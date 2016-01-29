<?php

namespace Itracker\Actions;

/**
 *  Datos para mostrar ejecucion de la accion
 */
class ITActionsShowResponse {
    
    /**
     * Objeto de itracker afectado
     * @var \Itracker\ITObject
     */
    private $obj;
    
    /**
     * Texto de la accion ejecutada
     * @var string
     */
    private $txt;
    
    function __construct(\Itracker\ITObject $obj, $txt) {
        $this->obj = $obj;
        $this->txt = $txt;
    }

    public function getObj() {
        return $this->obj;
    }

    public function getTxt() {
        return $this->txt;
    }


}