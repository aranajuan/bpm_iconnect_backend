<?php
namespace Itracker\Exceptions;
use Itracker\Context;
use \KLogger\Psr\Log\LogLevel;

/**
 * Excepciones graves
 */
class ItErrorException extends \Exception {
 /**
     * Codigo de error de var
     * @var String 
     */
    private $error;
    
    /**
     * Descripcion adicional
     */
    private $logMsj;
    
    /**
     * Error context
     * @var array 
     */
    private $logData;
    
    /**
     * Nivel de log
     * @var String
     */
    private $logLevel;
    /**
     * 
     * @param String $error
     * @param String $logmsg
     * @param Array $logdata
     */
    public function __construct($error,$logmsg=null,$logdata=null,$defaultLogLevel=LogLevel::ERROR) {
        $this->error = $error;
        $this->logMsj=$error.'/'.$logmsg;
	$this->logData=$logdata;
	$errorV = explode('/', $error);
	$errCnf = Context::getContext()->getErrorConfig();
	$this->logLevel = $errCnf->getString ( $error.'/loglevel' );
	if($this->logLevel == null){
		$this->logLevel = $defaultLogLevel;
	}
	parent::__construct(
		$errCnf->getString ( $error.'/description' ),
		$errCnf->getInt ( $errorV[0].'/code')*100+
		$errCnf->getInt ( $error.'/code' )
		);
	
    }
    
    /**
     * 
     * @return String
     */
    public function getLogMsj(){
	    return $this->logMsj;
    }
    
    /**
     * 
     * @return array
     */
    public function getLogData(){
	    return $this->logData;
    }

    /**
     * 
     * @return String
     */
    public function getLogLevel(){
	    return $this->logLevel;
    }
    
}


