<?php

namespace Itracker\Utils;

class LoggerFactory{

    /**
     * @var \KLogger\Logger
     */
    private static $logger;
    
    /**
     * @var \KLogger\Logger
     */
    private static $accesLog;
    
    private function __construct() {

    }
    
    /**
     * Devuelve instancia de Logger
     * @param \KLogger\Psr\Log\LogLevel $level
     * @return \KLogger\Psr\Log\LoggerInterface
     */
    public final static function getLogger($level=null){
        if(!static::$logger){
            if(!$level){ $level='error'; }
            static::$logger= new \KLogger\Logger(ROOT_DIR."/logs", $level);
        }
        return self::$logger;
    }
    
    
     /**
     * Devuelve instancia de Logger para access
     * @return \KLogger\Psr\Log\LoggerInterface
     */
    public final static function getAccessLogger(){
        if(!static::$accesLog){
              static::$accesLog= new \KLogger\Logger(ROOT_DIR."/logs", 
                      \KLogger\Psr\Log\LogLevel::DEBUG,array('prefix'=>'access_'));
        }
        return self::$accesLog;
    }
    
}
?>
