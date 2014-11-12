<?php

/**
 * 
 * @param TKT $TKT
 * @param itform $itf
 * @return array    $response=array("result"=>"","msj"=>"");
 */
function GO_action($TKT, $itf) {

    $response = array("result" => "", "msj" => "");

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

    /**
     *  revisar master y campos ocultos
     */
    
    $idmaster = $itf->getAnddelete("idmaster");


    if ($lstOption->get_prop("ruta_destino") == NULL) { //se derivará directamente a un equipo
        $TKT->load_detail($itf->get_output());
    }

    /* abre ticket */
    $rtaOP = $TKT->open();

    if ($rtaOP != "ok") {
        $response["result"] = "error";
        $response["msj"] = $rtaOP;
        return $response;
    } else {
        $response["result"] = "ok";
        $response["id"] = $TKT->get_prop("id");
    }
    if ($lstOption->get_prop("ruta_destino")) {
        $response["type"] = "file";
        $response["file"] = $lstOption->get_prop("ruta_destino");
        if ($lstOption->get_prop("autocerrar") == 1) {
            $TKT->close("USER");
            $response["status"] = "close";
        } else {
            $response["status"] = "open";
        }
        return $response;
    }

    if (is_numeric($idmaster) && $idmaster>0) {
        $master = new TKT();
        $rtaMA = $master->load_DB($idmaster);
        if ($rtaMA != "ok") {
            $response["result"] = "ok";
            $response["type"] = "tkt";
            $response["msj"] = "No se pudo cargar el master.";
            $response["id"] = $TKT->get_prop("id");
            return $response;
        }
        $rtaJOI = $TKT->join($master);
        if ($rtaJOI != "ok") {
            $response["result"] = "ok";
            $response["type"] = "tkt";
            $response["msj"] = "No se pudo unir al master." . $rtaJOI;
            $response["id"] = $TKT->get_prop("id");
            return $response;
        }
        $response["result"] = "ok";
        $response["type"] = "tkt";
        $response["id"] = $TKT->get_prop("id");
        return $response;
    }
    return $response;
}

?>
