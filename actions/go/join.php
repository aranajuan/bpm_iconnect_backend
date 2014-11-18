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
    $master = new TKT();
    if($master->load_DB($idmaster)!="ok"){
        $response = array("result" => "error", "msj" => "Erro al cargar tkt.");
    }
    
    $rtaOP = $TKT->join($master);
    
    $this->loadValue($master->get_prop("id"));
    
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;

