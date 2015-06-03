<?php
/**
 * Ejecuta accion
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $idtkt = $RC->get_params("idtkt");
    
    if ($idtkt) {
        $TKT= $RC->get_objcache()->get_object("Tkt",$idtkt);
    }else{
        $TKT = new \Itracker\Tkt();
        $TKT->load_VEC(array("origen" => $RC->get_params("path")));
    }
    $A = new Itracker\Action();
    $A->load_DB($RC->get_params("action"));
    $A->setWorking();
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
    
    $Notif = new \Itracker\Notify();
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
