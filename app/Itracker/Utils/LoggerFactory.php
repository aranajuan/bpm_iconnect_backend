<?php

namespace Itracker\Utils;

class LoggerFactory{

    /**
     * @var \KLogger\Logger
     */
    private static $logger;
    
    private function __construct() {

    }
    
    /**
     * Devuelve instancia de Logger
     * @param \KLogger\Psr\Log\LogLevel $level
     * @return \KLogger\Logger
     */
    public final static function getLogger($level=null){
        if(!static::$logger){
            if(!$level){ $level='error'; }
            static::$logger= new \KLogger\Logger(ROOT_DIR."/logs", $level);
        }
        return self::$logger;
    }
    
    
    
}
?>
