<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */

    $response = array("result" => "", "msj" => "");
    $TKT = $this->getTKT();
    
    $idusr = $this->getScriptResponse()->get_prop('id');
    $tou = $obCI->get_object('User', $idusr);
    if($obCI->get_status('User', $idusr)!="ok"){
        return array("result" => "error", "msj" => "Error al cargar usuario.");
    }
    
    $rtaOP = $TKT->asign($tou);
    
    $this->loadObjadjId($tou->get_prop("usr"));
    
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;
