<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");
$TKT = $this->getTKT();

$idequipo = $this->getScriptResponse()->get_prop('id');
$td = $obCI->get_object('Team', $idequipo);
if ($obCI->get_status('Team', $idequipo) != "ok") {
    return array("result" => "error", "msj" => "Error al cargar equipo. #1.$idequipo");
}

$rtaOP = $TKT->derive($td);

$this->loadObjadjId($td->get_prop("id"));

if ($rtaOP != "ok") {
    $response = array("result" => "error", "msj" => $rtaOP);
} else {
    $response = array("result" => "ok", "msj" => "");
}
return $response;
