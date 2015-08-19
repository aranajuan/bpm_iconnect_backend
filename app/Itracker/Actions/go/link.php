<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");

$idth = $this->getScriptResponse()->get_prop('id');
$this->setChilds(null);
if(is_numeric($idth)){
    $this->loadObjadjId($idth);
    return array("result" => "ok", "msj" => "");
}else{
    return array("result" => "error", "msj" => "Id invalido");
}
