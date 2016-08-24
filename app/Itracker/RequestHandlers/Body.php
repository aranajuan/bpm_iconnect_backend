<?php
namespace Itracker\RequestHandlers;
use \Itracker\Exceptions\ErrorException;

/**
 * Clase con datos del cuerpo de la solicitud
 * @author juan
 *
 */
class Body{
	/**
	 * Metodo de clase
	 * @var String 
	 */
	private $method;
	
	/**
	 * Clase a ejecutar
	 * @var String 
	 */
	private $class;
	
	/**
	 * Parametros
	 * @var Array 
	 */
	private $params;
	
	/**
	 * Archivos
	 * @var Array
	 */
	private $files;
	
	/**
	 * Constructor
	 * @param String $method
	 * @param String $class
	 * @param Array $params
	 * @param Array $files
	 */
	function __construct($class,$method, $params, $files) {
		$this->setMethod($method);
		$this->setClass($class);
		$this->setParams($params);
		$this->setFiles($files);
	}

	/**
	 * Metodo
	 * @return String
	 */
	public function getMethod() {
		return $this->method;
	}

	/**
	 * Metodo
	 * @param String $method
	 */
	public function setMethod($method) {
		if ( !preg_match ( '/\\s*\\w+\\s*/', $method ) ) {
			throw new ErrorException ( 'handler/invalid', 'Metodo invalido' );
		}
		$this->method = $method;
	}

	/**
	 * Clase
	 * @return String
	 */
	public function getClass() {
		return $this->class;
	}

	/**
	 * Clase
	 * @param String $class
	 */
	public function setClass($class) {
		if ( !preg_match ( '/\\s*\\w+\\s*/', $class ) ) {
			throw new ErrorException ( 'handler/invalid', 'Clase invalido' );
		}
		$this->class = $class;
	}

	/**
	 * Obtener parametro
	 * @param String $name
	 * @return Array
	 */
	public function getParams($name) {
		return $this->params[$name];
	}

	/**
	 * Setear parametros
	 * @param Array $params
	 */
	public function setParams($params) {
		$this->params = $params;
	}

	/**
	 * Obtener archivo
	 * @param int $id
	 * @return Array
	 */
	public function getFiles($id) {
		return $this->files[$id];
	}

	/**
	 * Cantidad de archivos
	 * @return int
	 */
	public function getFilesCount(){
		return count($this->files);
	}

	/**
	 * Setear archivos
	 * @param Array $files
	 */
	public function setFiles($files) {
		$this->files = $files;
	}


	
}