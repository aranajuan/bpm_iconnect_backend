<?php

namespace Itracker\RequestHandlers;
use \Itracker\ResponseElement;

class ErrorResponseAdapter implements ResponseItemInterface {

	/**
	 *
	 * @var \Exception
	 */
	private $error;
		
	function __construct($e) {
		$this->error = $e;
	}

	/**
	 * Obtener tipo
	 * @return int
	 */
	public function getType() {
		return self::ARRAYL;
	}

	/**
	 * Obtener valor
	 * @return array|string|int
	 */
	public function getValue(){
		$msj = 'Error desconocido, consulte a su administrador.';
		if($this->error instanceof \Itracker\Exceptions\ItErrorException){
			$msj = $this->error->getMessage();
		}
		if($this->error instanceof \Itracker\Exceptions\ItErrorException){
			$msj.= '||' .$this->error->getDescription();
		}
		return array(
		    new ResponseElement('msj',$msj,self::TEXT),
		    new ResponseElement('code',$this->error->getCode (),self::TEXT)
		);
	}

	/**
	 * Titulo
	 * @return string
	 */
	public function getTitle(){
		return 'error';
	}
}
