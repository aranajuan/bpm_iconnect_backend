<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */

    $response = array("result" => "", "msj" => "");
    $TKT = $this->getTKT();
    
    $itf = $this->getitform();
    
    $idmaster = $itf->get_value("idmaster");
    $master = $obCI->get_object('TKT', $idmaster);
    if($obCI->get_status('TKT', $idmaster)!="ok"){
        return array("result" => "error", "msj" => "Erro al cargar tkt.");
    }
    
    if($this->isWorking()){
        if(!$this->getLogged()->in_team($master->get_prop("idequipo"))){
            return array("result" => "error", "msj" => "El ticket master no esta en tu equipo");
        }
    }
   
    $rtaOP = $TKT->join($master);
    
    $this->loadValue($master->get_prop("id"));
    
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;

