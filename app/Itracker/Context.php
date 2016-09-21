<?php

namespace Itracker;
use Itracker\Exceptions\ItErrorException;
use Itracker\Exceptions\ItFunctionalException;
use Itracker\Utils\AccessLog;
use \Itracker\Utils\LoggerFactory;
use Itracker\ResponseElement;

/**
 * Maneja todo el requerimiento del front
 */
class Context {

	/**
	 * log de acceso
	 * @var AccessLog
	 */
	private $accesslog;

	/**
	 * usuario logueado
	 *
	 * @var User
	 */
	private $user;

	/**
	 * Front conectado
	 *
	 * @var Front
	 */
	private $front;

	/**
	 * administrador de conexiones
	 *
	 * @var Utils\ConnectionManager
	 */
	private $connections; //

	/**
	 *
	 * @var Instance
	 */
	private $instance;

	/**
	 * Script finalizado
	 *
	 * @var boolean
	 */
	private $finished;

	/**
	 * Configuracion de errores
	 * @var Utils\Config
	 */
	private $errorConfig;

	/**
	 * Handler
	 *
	 * @var RequestHandlers\HandlerInterface
	 */
	private $handler;
	private static $__instance;

	private function __construct() {
		$this->finished=false;
		$this->errorConfig=null;
		$this->accesslog = new AccessLog();
	}

	/**
	 *
	 * @return Context
	 */
	public static function getContext() {
		if (! static::$__instance) {
			static::$__instance = new static ();
		}
		return static::$__instance;
	}
	public function getLogger() {
		return LoggerFactory::getLogger ();
	}

	/**
	 * Configuracion de errores
	 * @return Utils\Config
	 */
	public function getErrorConfig(){
		if($this->errorConfig == null){
			$this->errorConfig = new Utils\Config('errors.xml','errors');
		}
		return $this->errorConfig;
	}

	/**
	 * Objeto de cache
	 *
	 * @return ObjectCache
	 */
	public function get_objcache() {
		return ObjectCache::getInstance ();
	}

	/**
	 *
	 * @return \Itracker\Utils\GlobalConfig
	 */
	public function get_GlobalConfig() {
		return \Itracker\Utils\GlobalConfig::getInstance ();
	}

	/**
	 * Carga Handler
	 *
	 * @param RequestHandlers\HandlerInterface $handler
	 */
	public function setHandler($handler) {
		$this->handler = $handler;
	}

	/**
	 * Handler
	 *
	 * @return \Itracker\RequestHandlers\HandlerInterface
	 */
	public function getHandler() {
		return $this->handler;
	}

	/**
	 * Carga access log
	 */
	private function loadAccessLog(){
		$handler = $this->getHandler();
		$this->accesslog->addArray(array(
				'date_rq' => $handler->getHeader()->getRequestTime(),
				'usr' => $handler->getHeader()->getUser(),
				'instance'=>$handler->getHeader()->getInstance(),
				'usr_ip'=>$handler->getHeader()->getIpuser(),
				'front_name'=>$handler->getHeader()->getFront(),
				'rq_class'=>$handler->getBody()->getClass(),
				'rq_method'=>$handler->getBody()->getMethod()
				));


	}

	/**
	 * Carga contexto
	 * @throws ItErrorException
	 * @throws ItFunctionalException
	 */
	private function prepare() {

		$config = $this->get_GlobalConfig ();
		if (in_array ( $this->getHandler ()->getHeader ()->getUser (), $config->getArray ( 'debug/user' ) )) {
			$this->getLogger ()->setLogLevelThreshold ( $config->getString ( 'debug/log_debug' ) );
		}

		$this->connections = new Utils\ConnectionManager ();

		$this->connections->connect_root (
				$config->getString ( 'database/motor' ),
				$config->getString ( 'database/host' ),
				$config->getString ( 'database/user' ),
				$config->getString ( 'database/pass' ),
				$GLOBALS ['tables_root'] );

		$this->instance = $this->get_objcache ()
				->get_object ( 'Instance',
				$this->getHandler()->getHeader()->getInstance() );

		$this->connections->connect_instance (
				$this->getInstance()->get_prop ( "dbhost" ),
				$this->getInstance()->get_prop ( "dbuser" ),
				$this->getInstance()->get_prop ( "dbpass" ),
				$this->getInstance()->get_alias () );

		$this->front = $this->get_objcache ()
				->get_object ( 'Front',
				$this->getHandler()->getHeader()->getFront() );

		if(!$this->getFront()->validip(
				$this->getHandler()->getHeader()->getIpfront()
				)){
				throw new ItErrorException('handler/invalid','Front desconocido');
		}

		if(!$this->getFront()->is_validInstance(
				$this->getInstance()->get_prop ( 'nombre' )
				)){
					throw new ItErrorException('handler/invalid','Instancia desconocida al front');
		}

		if($this->getHandler ()->getBody ()->getClass ()=='user'
				&& $this->getHandler ()->getBody ()->getMethod ()=='login'){
			$login = true;
		}else{
			$login = false;
		}

		try{
			$this->user = $this->get_objcache ()
				->get_object ( 'User',
				$this->getHandler()->getHeader()->getUser() );
		}catch(ItFunctionalException $e){
			if($login){
					$this->user = new User();
			}else{
				throw new ItErrorException('handler/invalid', 'Usuario invalido.');
			}
		}

		if($login){
			return;
		}

		if (! $this->getUser()->check_instance ( $this->getInstance()->get_prop ( 'nombre' ) )) {
			throw new ItErrorException('handler/invalid','Instancia invalida');
		}

		if (! $this->getUser()->check_front ( $this->getFront()->get_prop ( 'id' ) )) {
			throw new ItErrorException('handler/invalid','Front invalido');
		}

		$this->validateRequest();

		if ($this->getUser ()->get_prop ( 'superuser' ) == 1) {
			set_time_limit ( 12000 );
			ini_set ( 'memory_limit', '512M' );
		} else {
			set_time_limit ( 300 );
		}

		$this->getUser ()->sessionActivity ();
	}

	/**
	 * Valida accesos
	 * @throws ItFunctionalException
	 */
	private function validateRequest() {
		$class = $this->getHandler()->getBody()->getClass();
		$method = $this->getHandler()->getBody()->getMethod();

		if (! $this->getFront()->validAction ( 	$class, $method )) {
					throw new ItFunctionalException('dbobject/checkdata', 'Acceso denegado(Front) a '.$class.'/'.$method);
		}

		if($this->getHandler()->getHeader()->getPass() != null &&
				$this->getHandler()->getHeader()->getHash () == null ){

						$this->getUser()->login($this->getHandler()->getHeader()->getPass(),
							$this->getFront(),
							$this->getInstance(),
							$this->getHandler()->getHeader()->getIpuser());
						$this->getHandler()->addResponse(
								new ResponseElement('hash',
									$this->getUser()->get_prop('hash'),
									ResponseElement::TEXT)
								,'header');

		}else{
					if (! $this->getUser()->sessionValidate (
							$this->getHandler()->getHeader()->getHash (),
							$this->getFront(),
							$this->getHandler()->getHeader()->getIpuser())) {
						throw new ItFunctionalException('handler/invalid', 'Sesion invalida o vencida');
					}

					if ($class == 'user' && $method == 'logout') {
						return;
					}
		}
		if (! $this->getUser()->validAction ( $class, $method )) {
			throw new ItFunctionalException('dbobject/checkdata', 'Acceso denegado(User) a '.$class.'/'.$method);
		}
	}

	/**
	 * Ejecuta servicio
	 * @return ResponseElement
	 */
	private function executeWS() {
		$ClassName = '\\Itracker\\Services\\ ' .
			$this->getHandler()->getBody ()->getClass () .
			'\\ ' . $this->getHandler()->getBody ()->getMethod ();
		$ClassName = str_replace ( '_', ' ', $ClassName );
		$ClassName = ucwords ( $ClassName );
		$ClassName = str_replace ( ' ', '', $ClassName );
		$C = new $ClassName();
		return $C->GO($this);
	}


		/**
	 * Ejecuta request y carga handler
	 * Maneja errores
	 */
	public function executeRequest() {
		try{
			$this->getHandler()->initialize();
			$this->loadAccessLog();
			$this->prepare ();
			$response = $this->executeWS ();
			$error = false;
		}catch(\Exception $e){
			LoggerFactory::getLogger()
				->logMsj(new \KLogger\ErrorLogAdapter ($e ));
			$response = new RequestHandlers\ErrorResponseAdapter($e);
			$error = true;
		}
		$this->getHandler()->addResponse ( $response);
		$responseSTR = $this->getHandler()->getResponse();
		$this->finishScript($error);
		return $responseSTR;

	}

	/**
	 * Finaliza la ejecucion del script
	 *
	 * @param boolean $error
	 */
	public function finishScript($error = false) {
		if ($this->finished == true)
			return;
		$this->finished = true;

		$this->accesslog->add( 'timeelapsed', get_measure ( 'fullscript' ) );
		$this->accesslog->add ( 'memoryusage', memory_get_peak_usage ( true ) );
		if ($this->getConnection () instanceof Utils\ConnectionManager) {
			$this->accesslog->add ( 'sql_elapsed', $this->getConnection ()->getSqlElapsed () );
			$this->accesslog->add ( 'sql_count', $this->getConnection ()->getSqlCount () );
			$this->getConnection ()->close_connections ( $error );
		}
		$this->accesslog->add ( 'exit_error', $error );
		LoggerFactory::getAccessLogger ()->write ( $this->accesslog->getJson() . ',' . PHP_EOL );
	}

	/**
	 * Devuelve usuario que ejecuta
	 *
	 * @return User
	 */
	public function getUser() {
		return $this->user;
	}

	/**
	 * Devuelve FRONT que ejecuta
	 *
	 * @return Front
	 */
	public function getFront() {
		return $this->front;
	}

	/**
	 * Devuelve conexiones establecidas
	 *
	 * @return Utils\ConnectionManager
	 */
	public function getConnection() {
		return $this->connections;
	}

	/**
	 * Devuelve instancia solicitada
	 *
	 * @return Instance
	 */
	public function getInstance() {
		return $this->instance;
	}

	/**
	 * Nombre del parametro
	 * @param string $name
	 */
	public function get_params($name){
		return $this->getHandler()->getBody()->getParams($name);
	}

	/**
	 * @return AccessLog
	 */
	public function getAccessLog(){
		return $this->accesslog;
	}
}
