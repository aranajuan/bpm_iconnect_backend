<?php
require_once 'classes/notify.php';
require_once 'classes/action.php';

/**
 * Ejecuta accion
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $idtkt = $RC->get_params("idtkt");
   
    $TKT = new TKT();

    if ($idtkt) {
        $TKT->load_DB($idtkt);
    }else{
        $TKT->load_VEC(array("origen" => $RC->get_params("path")));
    }

    $A = new ACTION();
    $A->load_DB($RC->get_params("action"));
    $TKT->setWorking();
    $validation = $A->loadTKT($TKT);

    if (!$validation) {
        return $RC->createElement("error", "No se pudo cargar el ticket");
    }
    
    $validation = $A->check_valid(); //opciones del arbol - equipo destino - etc en apertura

    if ($validation != "ok") {
        return $RC->createElement("error", "Accion invalida. " . $validation);
    }

    $form = json_decode($RC->get_params("form"),true);
    $validation = $A->loadFormValues($form,"actionform");

    
    if ($validation != "ok") {
        return $RC->createElement("error", "Error en formulario. " . $validation);
    }
    
    if($RC->get_params("sendfiles")=="true"){
        $files = $RC->get_files();
        $A->loadFiles($files);
    }
    
    $Notif = new NOTIFY();
    $Notif->load_TKTEXT($TKT);
    $actionResult = $A->ejecute();
    
    if($actionResult["result"]){
        $Notif->load_actionOBJ($A);
        $actionResult["mail"]= $Notif->send();
    }
    $result= $RC->createElement("data");
    foreach($actionResult as $k=>$v){
        $result->appendChild($RC->createElement($k, $v));
    }
    return $result;
    //return $RC->createElement("error", "<pre>".print_r($actionResult,true)."</pre>");
}
