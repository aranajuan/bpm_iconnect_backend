<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");
$TKT = $this->getTKT();

$rtaOP = $TKT->close();
if ($rtaOP != "ok") {
    $response = array("result" => "error", "msj" => $rtaOP);
} else {
    $response = array("result" => "ok", "msj" => "");
}
return $response;
