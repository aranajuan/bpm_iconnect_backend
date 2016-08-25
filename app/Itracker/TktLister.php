<?php

namespace Itracker;

class TktLister extends BasicObject {

    private $resultids;
    private $posRead;
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
        $this->posRead=0;
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
        return true;
    }

    /**
     * Cantidad de tickets filtrados
     * @return int
     */
    public function getCount(){
        return count($this->resultids);
    }
    
    /**
     * Lista de tickets filtrados
     * @return TKT
     */
    public function getObj() {
        $id = $this->resultids[$this->posRead];
        $this->posRead++;
        if($this->posRead > $this->getCount()){
            return null;
        }
        $T = $this->objsCache->get_object("Tkt", $id);
        $this->objsCache->clean_object("Tkt", $id);
        if($this->getContext()->get_User()->get_view($T)!=null){
            return $T;
        }else{
        	return $this->getObj();
        }
    }

    
}