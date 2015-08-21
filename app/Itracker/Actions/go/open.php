<?php

/**
 * 
 * @param Itracker\Action $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");

$TKT = $this->getTKT();
$itf = $this->getitform();
$destiny = $this->getScriptResponse();

/* VALIDACIONES */

if (!$TKT->is_active()) {
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion. #1";
    return $response;
}

$lstOption = $TKT->get_last();

if (!is_numeric($destiny->get_prop('id'))) {
    $this->getContext()->getLogger()->warning('No hay destino valido id en script', array(
        'id' => $lstOption->get_prop('id'),
        'usr' => $this->getContext()->get_User()->get_prop('usr'),
        'data' => $this->getContext()->get_params('form')
    ));
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion. #2";
    return $response;
}



/* ABRIR */
$rtaOP = $TKT->open($destiny->get_prop('id'));

if ($lstOption->get_prop('unir')) {
    $response["openother"] = 0;
} else {
    $response["openother"] = 1;
}

$this->loadObjadjId($TKT->get_prop("idequipo"));

if ($rtaOP != "ok") {
    $response["result"] = "error";
    $response["msj"] = $rtaOP;
    return $response;
} else {
    $response["result"] = "ok";
    $response["id"] = $TKT->get_prop("id");
    $this->force_tkth();
}

/* CERRAR A FILE */
$file = $destiny->get_prop('file');
if ($file) { //no une
    $response["type"] = "file";
    $response["file"] = $file;
    $rta = $TKT->ejecute_action("CERRAR_RUTA", array(array("id" => "link_archivo",
        "value" => $file)));
    if ($rta["result"] == "ok") {
        $response["status"] = "close";
    } else {
        $response["status"] = "open";
    }

    return $response; //no une
}


/* UNIR */
if(!$lstOption->get_prop('unir')){
    return $response;
}

$idmaster = $itf->getExtravalue('idmaster');

if (is_numeric($idmaster) && $idmaster > 0) {
    $rta = $TKT->ejecute_action("UNIR", array(array("id" => "idmaster",
        "value" => $idmaster)));
    if ($rta["result"] != "ok") {
        $response["result"] = "ok";
        $response["type"] = "tkt";
        $response["msj"] = "No se pudo unir al master." . $rta["msj"]."-".$rta["result"];
    }
}
return $response;
?>
