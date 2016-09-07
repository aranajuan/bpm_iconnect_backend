<?php
namespace Itracker\Exceptions;
use \KLogger\Psr\Log\LogLevel;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ItException
 *
 * @author u548391
 */
class ItFunctionalException extends ItErrorException {

	/**
	 * Descripcion
	 * @var String
	 */
	private $description;
	
	function __construct($error,$description=null, $logmsg = null, $logdata = null) {
		$this->description = $description;
		if($logdata){
			$logdata=  array_merge($logdata,
				array('description'=>$this->description));
		}else{
			$logdata =array('description'=>$this->description);
		}
		parent::__construct ( $error, $logmsg, $logdata, LogLevel::NOTICE );
	}
	
	/**
	 * Descripcion del error
	 * @return String
	 */
	public function getDescription(){
		return $this->description;
	}
}
