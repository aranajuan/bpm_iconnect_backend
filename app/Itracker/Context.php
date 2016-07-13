<?php

namespace Itracker;

/**
 * Maneja todo el requerimiento del front
 */
class Context extends Utils\XMLhandler {

    /**
     * usuario logueado 
     * @var User
     */
    private $user;

    /**
     * Front conectado
     * @var Front
     */
    private $front;

    /**
     * administrador de conexiones
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
     * @var boolean
     */
    private $finished;
    private $error;
    private static $__instance;

    private function __construct() {
        
    }

    /**
     * 
     * @return Context
     */
    public static function getContext() {
        if (!static::$__instance) {
            static::$__instance = new static();
            static::$__instance->finished = false;
        }
        return static::$__instance;
    }

    /**
     * Prepara conexiones a db, carga input, valida datos
     * @param type $text 
     * @param type $ipOr ip del front
     * @param type $date
     * @return boolean
     */
    public function request($text, $ipOr, $date) {
        if (!$this->load_input($text, $ipOr, $date)) {
            return false;
        }
        if (in_array($this->getUser(), $this->get_GlobalConfig()->getArray('debug/user'))) {
            $this->getLogger()->setLogLevelThreshold(
                    $this->get_GlobalConfig()->getString('debug/log_debug')
            );
        }

        $this->connections = new Utils\ConnectionManager();
        $config = $this->get_GlobalConfig();
        if ($this->connections->connect_root(
                        $config->getString('database/motor'), $config->getString('database/host'), $config->getString('database/user'), $config->getString('database/pass'), $GLOBALS["tables_root"]) == false) {
            $this->set_error("conection", "no se puede conectar a la base de datos.");
            return false;
        }

        if (!$this->load_instance()) {
            $this->set_error("load_instance", "no se puede cargar la instancia.");
            return false;
        }

        if ($this->connections->connect_instance($this->instance->get_prop("dbhost"), $this->instance->get_prop("dbuser"), $this->instance->get_prop("dbpass"), $this->instance->get_alias()) == false) {
            $this->set_error("connection", "no se puede conectar a la base de datos de la instancia.");
            return false;
        }

        if (!$this->load_front()) {
            $this->set_error("front", $this->error);
            return false;
        }

        if (!$this->validate_request()) {
            $this->set_error("validation", $this->error);
            return false;
        }

        if ($this->get_User()->get_prop('superuser') == 1) {
            set_time_limit(12000);
            ini_set('memory_limit', '512M');
        } else {
            set_time_limit(300);
        }

        $this->get_User()->sessionActivity();

        if (!$this->execute_request()) {
            $this->set_error("ejecution", $this->error);
            return false;
        }
    }

    /**
     * Valida objetos y acceso de usuario
     * @return boolean
     */
    private function validate_request() {
        if (!$this->front->validip($this->getIpFront())) {    // no coincide ip del front con el nombrado
            $this->error = "Error en el origen de la solicitud - #6.2";
            return false;
        }
        if (!$this->front->is_validInstance($this->instance->get_prop("nombre"))) {
            $this->error = "Error en el origen de la solicitud - #6.3";
            return false;
        }

        if (!$this->load_user()) {
            return false;
        }

        if ($this->get_class() == "user" && $this->get_method() == "login") {
            return true;
        }
        
        // no lanza error! [IMPORTANTE]
         if (!$this->front->validAction($this->get_class(), $this->get_method())) {
            $this->error = "Acceso denegado a " . $this->get_class() . "/" . $this->get_method()." #1";
            return false;
        }
        
        if (!$this->user->sessionValidate($this->getHash(), $this->front, $this->getIp())) {
            $this->error = "Usuario no logeado";
            return false;
        }

        if ($this->get_class() == "user" && $this->get_method() == "logout") {
            return true;
        }

        if (!$this->user->validAction($this->get_class(), $this->get_method())) {
            $this->error = "Acceso denegado a " . $this->get_class() . "/" . $this->get_method();
            return false;
        }
        return true;
    }

    /**
     * Carga objeto usuario
     * @return boolean
     */
    private function load_user() {
        $U = $this->get_objcache()->get_object("User", $this->getUser());
        if ($this->get_objcache()->get_status("User", $this->getUser()) != "ok") {
            $this->error = "Usuario o contrase&ntilde;a invalidos";
            return false;
        }

        if (!$U->check_instance($this->instance->get_prop("nombre"))) {
            $this->error = "Instancia invalida";
            return false;
        }

        if (!$U->check_front($this->front->get_prop("id"))) {
            $this->error = "Front invalido.";
            return false;
        }

        $this->user = $U;
        return true;
    }

    /**
     * Carga objeto instancia
     * @return boolean
     */
    private function load_instance() {
        $I = $this->get_objcache()->get_object("Instance", $this->getInstance());
        if ($this->get_objcache()->get_status("Instance", $this->getInstance()) != "ok") {
            $this->instance = null;
            return false;
        }
        //verificar si existe carpeta
        $this->instance = $I;
        return true;
    }

    /**
     * Carga objeto front
     * @return boolean
     */
    private function load_front() {
        //validar usuario - front - acceso del usr a funcion
        $front = $this->get_objcache()->get_object("Front", $this->getFrontName());
        if ($this->get_objcache()->get_status("Front", $this->getFrontName()) != "ok") {
            $this->error = "Error en el origen de la solicitud - #6.1";
            return false;
        }
        $this->front = $front;
        return true;
    }

    /**
     * Ejecuta GO agrega a response
     * @return boolean
     */
    private function execute_request() {
        $ClassName = '\\Itracker\\Services\\ ' . $this->get_class() . '\\ ' . $this->get_method();
        $ClassName = str_replace('_', ' ', $ClassName);
        $ClassName = ucwords($ClassName);
        $ClassName = str_replace(' ', '', $ClassName);
        if (!class_exists($ClassName)) {
            $this->getLogger()->critical("No se encuentra archivo de ejecucion", array($ClassName));
            $this->error = "Error al ejecutar solicitud";
            return false;
        }
        include $file;
        $ret = $ClassName::GO($this);
        if ($ret) {
            $this->append_response($ret);
        }
        return true;
    }

    /**
     * Finaliza la ejecucion del script
     * @param boolean $error
     */
    public function finishScript($error = false) {
        if ($this->finished==true)
            return;
        $this->finished=true;
        try{
            $this->add_accessLog('timeelapsed', get_measure('fullscript'));
            $this->add_accessLog('memoryusage', memory_get_peak_usage(true));
            if ($this->get_Connection() instanceof Utils\ConnectionManager) {
                $this->add_accessLog('sql_elapsed', $this->get_Connection()->getSqlElapsed());
                $this->add_accessLog('sql_count', $this->get_Connection()->getSqlCount());
                $this->get_Connection()->close_connections($error,false);
            }else{
                if($error){
                    echo 'Ocurrio un error inesperado, reintente la operacion.';
                }
            }
            $this->add_accessLog('exit_error', $error);
            if($error){
                $this->add_accessLog('exit_error_message', print_r(error_get_last(),true));
                $this->getLogger()->error(print_r(array(error_get_last(),$this->get_plainrequest()),true));
            }
            //echo $this->get_accesslogJson();
            \Itracker\Utils\LoggerFactory::getAccessLogger()->write($this->get_accesslogJson() . ',' . PHP_EOL);
        }catch(\Exception $e){
            echo '<b>Fatal error:</b> '.$e->getMessage();
        }
    }

    /**
     * Devuelve usuario que ejecuta
     * @return User
     */
    public function get_User() {
        return $this->user;
    }

    /**
     * Devuelve FRONT que ejecuta
     * @return Front
     */
    public function get_Front() {
        return $this->front;
    }

    /**
     * Devuelve conexiones establecidas
     * @return Utils\ConnectionManager
     */
    public function get_Connection() {
        return $this->connections;
    }

    /**
     * Devuelve instancia solicitada
     * @return Instance
     */
    public function get_Instance() {
        return $this->instance;
    }

    /**
     * Objeto de cache
     * @return ObjectCache
     */
    public function get_objcache() {
        return ObjectCache::getInstance();
    }

    /**
     * 
     * @return \Itracker\Utils\GlobalConfig
     */
    public function get_GlobalConfig() {
        return \Itracker\Utils\GlobalConfig::getInstance();
    }

}

?>
