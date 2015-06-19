<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");

$TKT = $this->getTKT();
$itf = $this->getitform();

/* VALIDACIONES */

if (!$TKT->is_active()) {
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion. #1";
    return $response;
}

$lstOption = $TKT->get_last();

$dest = $lstOption->getDestiny($this->getLogged(), $itf);

if (!$dest->hasDestiny()) {
    $this->getContext()->getLogger()->warning('No hay destino valido', array(
        'id' => $lstOption->get_prop('id'),
        'usr' => $this->getContext()->get_User()->get_prop('usr'),
        'data' => $this->getContext()->get_params('form')
    ));
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion. #2";
    return $response;
}

if ($dest->getDestinyVal('team') == NULL) {
    $this->getContext()->getLogger()->warning('No hay destino valido <team>', array(
        'id' => $lstOption->get_prop('id'),
        'usr' => $this->getContext()->get_User()->get_prop('usr'),
        'data' => $this->getContext()->get_params('form')
    ));
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion. #3";
    return $response;
}



/* ABRIR */
$rtaOP = $TKT->open();

if ($dest->getVal('join') == 'true') {
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

if ($lstOption->get_prop("ruta_destino")) { //no une
    $response["type"] = "file";
    $response["file"] = $lstOption->get_prop("ruta_destino");
    $rta = $TKT->ejecute_action("CERRAR_RUTA", array(array("id" => "link_archivo", "value" => $lstOption->get_prop("ruta_destino"))));
    if ($rta["result"] == "ok") {
        $response["status"] = "close";
    } else {
        $response["status"] = "open";
    }

    return $response; //no une
}

/**
 *  revisar master y campos ocultos
 */
$idmaster = $itf->get_value_arr("idmaster");

if (is_numeric($idmaster) && $idmaster > 0) {
    $rta = $TKT->ejecute_action("UNIR", array(array("id" => "idmaster", "value" => $idmaster)));
    if ($rta["result"] != "ok") {
        $response["result"] = "ok";
        $response["type"] = "tkt";
        $response["msj"] = "No se pudo unir al master." . $rta["msj"];
    }
}
return $response;
?>
