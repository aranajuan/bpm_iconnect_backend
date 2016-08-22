<?php
namespace Itracker\RequestHandlers;

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
	function __construct($method, $class, $params, $files) {
		$this->method = $method;
		$this->class = $class;
		$this->params = $params;
		$this->files = $files;
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
	public function setMethod(String $method) {
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
		$this->class = $class;
	}

	/**
	 * Obtener parametro
	 * @param String $path
	 * @return Array
	 */
	public function getParams($path) {
		return $this->params;
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
		return $this->files;
	}

	/**
	 * Setear archivos
	 * @param Array $files
	 */
	public function setFiles($files) {
		$this->files = $files;
	}


	
}