<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");
$TKT = $this->getTKT();

$idmaster = $this->getScriptResponse()->get_prop('id');
$master = $obCI->get_object('Tkt', $idmaster);
if ($obCI->get_status('Tkt', $idmaster) != "ok") {
    return array("result" => "error", "msj" => "Error al cargar tkt.");
}

if ($this->isWorking()) {

    if (!$this->getLogged()->in_team($master->get_prop("idequipo"))) {
        return array("result" => "error", "msj" => "El ticket master no esta en tu equipo");
    }

    $utomM = $master->get_prop("u_tom");
    if ($utomM != null && $utomM != $this->getLogged()->get_prop("usr")) { //el ticket master esta tomado por otro
        $arrEJ = makeproparr($this->getTKT()->valid_actions(), "ejecuta");
        if (!in_array("asign", $arrEJ)) {
            return array("result" => "error", "msj" => "El ticket master esta tomado y no puedes asignarlo");
        }
    }
}

$this->setChilds($TKT->get_prop("childs"));

$rtaOP = $TKT->join($master);

$this->loadObjadjId($master->get_prop("id"));

if ($rtaOP != "ok") {
    $response = array("result" => "error", "msj" => $rtaOP);
} else {
    $response = array("result" => "ok", "msj" => "");
}
return $response;

