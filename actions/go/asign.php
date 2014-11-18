<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */

    $response = array("result" => "", "msj" => "");
    $TKT = $this->getTKT();
    
    $itf = $this->getitform();
    
    $idusr = $itf->get_value("idusr");
    $tou = new USER();
    if($tou->load_DB($idusr)!="ok"){
        $response = array("result" => "error", "msj" => "Erro al cargar usuario.");
    }
    
    $rtaOP = $TKT->asign($tou);
    
    $this->loadValue($tou->get_prop("usr"));
    
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;
