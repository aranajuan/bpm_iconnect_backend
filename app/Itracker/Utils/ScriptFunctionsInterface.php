<?php

namespace Itracker\Utils;

/**
 * Interface para ejecucion desde itscript
 * @author u548391
 */
interface ScriptFunctionsInterface {
    
    /**
     * Implementacion de las funciones
     * @param string $function
     * @param array $params 
     * @return mixed 
     */
    function scriptEjecute($function,$params);
    
}

?>
