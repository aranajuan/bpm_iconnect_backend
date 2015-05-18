<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");
$itf = $this->getitform();
$idth = $itf->get_value("idth");
$this->setChilds(null);
if(is_numeric($idth)){
    $this->loadObjadjId($idth);
    return array("result" => "ok", "msj" => "");
}else{
    return array("result" => "error", "msj" => "Id invalido");
}
