<?php

namespace Itracker\Actions;

/**
 *  Resultado de la ejecucion de la accion
 */
class ITActionsGoResponse {
    
    /**
     * Ok o error
     * @var string
     */
    private $result;
    
    /**
     * Detalle de la respuesta
     * @var string
     */
    private $msj;
    
    /**
     * Informacion extra para agregar en el toarray
     * @var array 
     */
    private $extras;
    
    function __construct($result, $msj, $extras=null) {
        $this->result = $result;
        $this->msj = $msj;
        $this->extras = $extras;
    }

    public function getResult() {
        return $this->result;
    }

    public function getMsj() {
        return $this->msj;
    }
    
    public function toArray(){
        if($this->extras==null){
            return array('result'=>$this->result,'msj'=>$this->msj);
        }
        return array_merge(array('result'=>$this->result,'msj'=>$this->msj),
                $this->extras
                );
                
    }
    
    
}