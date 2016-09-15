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
	
	function __construct($error,$description=null, $logmsg = null, $logdata = null,$defaultLogLevel= null) {
		$this->description = $description;
		if($logdata){
			$logdata=  array_merge($logdata,
				array('description'=>$this->description));
		}else{
			$logdata =array('description'=>$this->description);
		}
		if($defaultLogLevel==null){
			if($logmsg!=null){
				$defLogLevel = LogLevel::WARNING;
			}else{
				$defLogLevel = LogLevel::NOTICE;
			}
		}
		parent::__construct ( $error, $logmsg, $logdata, $defLogLevel );
	}
	
	/**
	 * Descripcion del error
	 * @return String
	 */
	public function getDescription(){
		return $this->description;
	}
}
