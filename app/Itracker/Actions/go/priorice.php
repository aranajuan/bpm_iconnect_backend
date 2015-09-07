<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */

    $response = array("result" => "", "msj" => "");
    $TKT = $this->getTKT();
    
    $prioridad = $this->getScriptResponse()->get_prop('id');

    $rtaOP = $TKT->set_priority($prioridad);
       
    if($rtaOP!="ok"){
        $response = array("result" => "error", "msj" => $rtaOP);
    }else{
        $response = array("result" => "ok", "msj" => "");
    }
    return $response;

