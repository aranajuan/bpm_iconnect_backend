<?php
namespace KLogger;
use \Itracker\Context;
use KLogger\Psr\Log\LogLevel;

class ErrorLogAdapter implements LogMsjInterface{
	
	private $error;
	
	private $level;
	
	private $msj;
	
	private $context;
	
	function __construct(\Exception $e) {
		$this->error=$e;
		$this->loadData();
	}
	
	private function loadData(){
		$this->context=array();
		$this->level = LogLevel::DEBUG;
		
		$this->msj=$this->error->getMessage();
		try{
			$this->context = array_merge($this->context, array('input'=>
			    Context::getContext()->getHandler()->getRequest()
			    ));
		}  catch (\Exception $e){
			$this->context = array_merge($this->context, array('input'=>'undefined'));
		}
		if($this->error 
			instanceof \Itracker\Exceptions\ItErrorException){
			$this->msj = $this->error->getLogMsj().'->'.$this->msj;
			$this->context = array_merge($this->context,
				(array)$this->error->getLogData());
			$this->level=$this->error->getLogLevel();
		}else{		
			$this->level =  Psr\Log\LogLevel::ERROR;
		}
		$this->context = array_merge($this->context,
			array('trace' => $this->error->getTraceAsString (),
			     'code' => $this->error->getCode()
			    ));
	}
	
	public function getContext() {
		return $this->context;
	}

	public function getLevel() {
		return $this->level;
	}

	public function getMsj() {
		return $this->msj;
	}	
}