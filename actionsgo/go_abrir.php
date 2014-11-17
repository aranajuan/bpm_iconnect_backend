<?php

/**
 * 
 * @param ACTION $action
 * @return array    $response=array("result"=>"","msj"=>"");
 */
function GO_action($action) {

    $response = array("result" => "", "msj" => "");

    $TKT = $action->getTKT();
    $itf = $action->getitform();

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
    $idmaster = $itf->get_value("idmaster");

    
    /* abre ticket */
    $rtaOP = $TKT->open();

    $action->loadValue($TKT->get_prop("idequipo"));

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
            $AC = new ACTION();
            $AC->load_DB("AUTOCERRAR");
            $AC->loadTKT($TKT);
            $rc = $AC->ejecute();
            $response["status"] = "close";
            $response["close"]=$rc;
        } else {
            $response["status"] = "open";
        }
        return $response;
    }

    if (is_numeric($idmaster) && $idmaster > 0) {
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
