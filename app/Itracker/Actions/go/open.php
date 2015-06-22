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

/* ESTABLECER PROCESO */
$process = $dest->getDestinyVal('process');
if ($process) {
    $rta = $TKT->ejecute_action('SET_PROCESS',
            array(array("id" => "proceso", "value" => $process)));
    if ($rta["result"] != "ok") {
        $response['msj']='No se pudo asignar al proceso correspondiente';
        $this->getContext()->getLogger()->warning(
                'No se pudo asignar al proceso en apertura',
                array(
                'rta' => print_r($rta,true),
                'usr' => $this->getContext()->get_User()->get_prop('usr')
        ));
        return $response;
    }
}

/* CERRAR A FILE */
$file = $dest->getDestinyVal('file');
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
$join = $dest->getVal('join');
if($join!='true'){
    return $response;
}

$idmaster = $itf->get_value_arr("idmaster");

if (is_numeric($idmaster) && $idmaster > 0) {
    $rta = $TKT->ejecute_action("UNIR", array(array("id" => "idmaster",
        "value" => $idmaster)));
    if ($rta["result"] != "ok") {
        $response["result"] = "ok";
        $response["type"] = "tkt";
        $response["msj"] = "No se pudo unir al master." . $rta["msj"];
    }
}
return $response;
?>
