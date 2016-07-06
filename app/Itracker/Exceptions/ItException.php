<?php
namespace Itracker\Exceptions;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ItException
 *
 * @author u548391
 */
class ItException extends \Exception {
    
    /**
     * Codigo de error de var
     * @var String 
     */
    private $error;
    
    /**
     * Descripcion adicional
     */
    private $description;
    
    /**
     * 
     * @param String $error
     * @param String $description
     * @param \KLKLogger\Psr\Log\LogLevel $loglevel
     * @param String $logmsg
     * @param Array $logdata
     */
    public function __construct($error,$description='',
            $loglevel=null ,$logmsg=null,$logdata=null) {
        $this->error = $error;
        $this->description=$description;
    }
    
    /**
     * Error para buscar en vars.
     * @return String
     */
    public function getError() {
        return $this->error;
    }

    /**
     * Detalles adicionales del error.
     * @return String
     */
    public function getDescription() {
        return $this->description;
    }


}

?>
