<?php
/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");
$TKT = $this->getTKT();

$itf = $this->getitform();

$idequipo = $itf->get_value("idequipo");
$td = $obCI->get_object('Team', $idequipo);
if ($obCI->get_status('Team', $idequipo) != "ok") {
    return array("result" => "error", "msj" => "Erro al cargar equipo.");
}

$rtaOP = $TKT->derive($td);

$this->loadObjadjId($td->get_prop("id"));

if ($rtaOP != "ok") {
    $response = array("result" => "error", "msj" => $rtaOP);
} else {
    $response = array("result" => "ok", "msj" => "");
}
return $response;