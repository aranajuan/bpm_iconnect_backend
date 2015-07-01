<?php

namespace Itracker;

class TktLister extends BasicObject {

    private $resultids;
    private $resultobjts;
    private $ssql;

    /**
     * Filtros precargados
     * @var TKTFILTER 
     */
    private $filter;
    
    /* EJECUCION */

    /**
     * Carga filtro
     * @param TktFilter $filter
     */
    public function loadFilter($filter){
        $this->filter=$filter;
    }

    /**
     * Ejecuta filtro
     * @return boolean
     */
    public function execute(){
        $this->filter->makeSQL();
        $ssql= $this->filter->getSQL();
        if($ssql){
            $this->ssql=$ssql;
            return $this->executeSQL();
        }
        error_log("Error de filtro: ".print_r($this->filter,true));
        return false;
    }
    
    /**
     * Devuelve error del filtro
     * @return string
     */
    public function getError(){
        $err = $this->filter->getError();
        if($err){
            return $err;
        }
        return "ERROR al ejecutar filtro.";
    }
    
    /**
     * Ejecuta SQL carga IDS y objetos
     */
    private function executeSQL() {
        $retArr=array();
        if($this->dbinstance->loadRS($this->ssql)){
            return false;
        }
        while ($tid = $this->dbinstance->get_vector()) {
            array_push($retArr, $tid["id"]);
        }
        $this->resultids = $retArr;
        $this->loadObjs();
        return true;
    }

    /**
     * Carga vector de objetos TKT
     */
    private function loadObjs() {
        $this->resultobjts = array();
        foreach ($this->resultids as $id) {
            $T = $this->objsCache->get_object("Tkt", $id);
            if ($this->objsCache->get_status("Tkt", $id) == "ok") {
                array_push($this->resultobjts, $T);
            }
        }
    }

    /**
     * Cantidad de tickets filtrados
     * @return int
     */
    public function getCount(){
        return count($this->resultobjts);
    }
    
    /**
     * Lista de tickets filtrados
     * @return array<TKT>
     */
    public function getObjs() {
        return $this->resultobjts;
    }

}