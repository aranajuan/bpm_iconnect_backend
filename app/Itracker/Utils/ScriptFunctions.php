<?php

namespace Itracker\Utils;

/**
 * Clase abstracta para ejecucion desde itscript
 * @author u548391
 */
abstract class ScriptFunctions {
    
    /**
     * Ejecutar la funcion
     * @param string $function
     * @return mixed
     */
    public function itsEjecute($function){
        for($i=0;$i<strlen($function);$i++){
            if(substr($function, $i,1)=='('){
                break;
            }
        }
        $fname=  substr($function, 0,$i);
        $paramsStr =  substr($function, $i+1,  strlen($function)-$i-2);
        $opParser = new OperationParser($paramsStr);
        $params=$opParser->getArgs();
        
        return $this->scriptEjecute($fname, $params);
    }
    
    /**
     * Implementacion de las funciones
     * @param string $function
     * @param array $params 
     * @return mixed 
     */
    protected abstract function scriptEjecute($function,$params);
    
}

?>
