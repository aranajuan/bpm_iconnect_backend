<?php
/**
 * Ejecuta accion
 * @param \Itracker\Context $Context
 * @return null
 */
function GO($Context) {

    $idtkt = $Context->get_params("idtkt");
    
    if ($idtkt) {
        $TKT= $Context->get_objcache()->get_object("Tkt",$idtkt);
        if($Context->get_objcache()->get_status("Tkt",$idtkt)!="ok"){
            return $Context->createElement("error", "No se pudo cargar el ticket");
        }
    }else{
        $TKT = new \Itracker\Tkt();
        $lV_rta = $TKT->load_VEC(array("origen" => $Context->get_params("path")));
        if($lV_rta!="ok"){
           return $Context->createElement("error", "Tipificacion invalida. ".$lV_rta); 
        }
    }
    $A = new Itracker\Action();
    $A->load_DB($Context->get_params("action"));
    $A->setWorking();
    $TKT->setWorking();
    $validation = $A->loadTKT($TKT);

    if (!$validation) {
        return $Context->createElement("error", "No se pudo cargar el ticket");
    }
    
    $validation = $A->check_valid(); //opciones del arbol - equipo destino - etc en apertura

    if ($validation != "ok") {
        return $Context->createElement("error", "Accion invalida. " . $validation);
    }

    $form = json_decode($Context->get_params("form"),true);
    $validation = $A->loadFormValues($form,"actionform");

    if ($validation != "ok") {
        return $Context->createElement("error", "Error en formulario. " . $validation);
    }
    
    if($Context->get_params("sendfiles")=="true"){
        $files = $Context->get_files();
        $A->loadFiles($files);
    }
    
    $Notif = new \Itracker\Notify();
    $actionResult = $A->ejecute();
    if($actionResult["result"]=="ok"){
        $Notif->load_actionOBJ($A);
        $actionResult["mail"]= $Notif->send();
    }
    $result= $Context->createElement("data");
    foreach($actionResult as $k=>$v){
        $result->appendChild($Context->createElement($k, $v));
    }
    return $result;
}
