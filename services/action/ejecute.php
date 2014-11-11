<?php

require_once 'classes/action.php';

/**
 * Ejecuta accion
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $idtkt = $RC->get_params("idtkt");

    $TKT = new TKT($RC->get_Connection());

    if ($idtkt) {
        $TKT->load_DB($idtkt);
    }else{
        $TKT->load_VEC(array("origen" => $RC->get_params("path")));
    }

    $A = new ACTION($RC->get_Connection());
    $A->load_DB($RC->get_params("action"));
    $validation = $A->loadTKT($TKT);

    if (!$validation) {
        return $RC->createElement("error", "No se pudo cargar el ticket");
    }
    
    $validation = $A->check_valid(); //opciones del arbol - equipo destino - etc en apertura

    if ($validation != "ok") {
        return $RC->createElement("error", "Accion invalida. " . $validation);
    }

    $form = json_decode($RC->get_params("form"),true);
    $validation = $A->loadFormValues($form,"openform");

    
    //if ($validation != "ok") {
        return $RC->createElement("error", "Error en formulario. " . $validation);
    //}
    
    //$actionResult = $A->ejecute();
    
    return $RC->createElement("error", "Ejecutando");
}
