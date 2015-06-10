<?php

namespace Itracker\Utils;

class GlobalConfig extends Config {

    /**
     *
     * @var GlobalConfig
     */
    private static $__instance;

    /**
     * 
     * @return GlobalConfig
     */
    public static function getInstance() {
        if (!static::$__instance) {
            try{
                static::$__instance = new static(ROOT_DIR.'/config/config.xml');
            }  catch (\Exception $e){
                echo 'Archivo de configuracion invalido';
                exit();
            }
        }
        return self::$__instance;
    }

}

?>
