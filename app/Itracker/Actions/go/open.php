<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$response = array("result" => "", "msj" => "");

$TKT = $this->getTKT();
$itf = $this->getitform();

if (!$TKT->is_active()) {
    $response["result"] = "error";
    $response["msj"] = "Error en tipificacion.";
    return $response;
}
$lstOption = $TKT->get_last();

if ($lstOption == null) {
    $response["result"] = "error";
    $response["msj"] = "No se pudo generar ticket. No se encontro ultima opcion.";
    return $response;
}

if ($lstOption->get_prop("no_anexar") == 1) {
    $response["openother"] = 1;
} else {
    $response["openother"] = 0;
}

if ($lstOption->get_prop("idequipo_destino") == NULL && $lstOption->get_prop("ruta_destino") == NULL) {
    $response["result"] = "error";
    $response["msj"] = "Error, fin de arbol invalido (Sin destino).";
    return $response;
}

/* abre ticket */
$rtaOP = $TKT->open();

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
