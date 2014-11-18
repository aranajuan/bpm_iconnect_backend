<?php
require_once 'classes/team.php';
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */

    $response = array("result" => "", "msj" => "");
    $TKT = $this->getTKT();
    
    $itf = $this->getitform();
    
    $idequipo = $itf->get_value("idequipo");
    $td = new TEAM();
    if($td->load_DB($idequipo)!="ok"){
        $response = array("result" => "error", "msj" => "Erro al cargar equipo.");
    }
    
    $rtaOP = $TKT->derive($td);
    
    $this->loadValue($td->get_prop("id"));
    
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;
