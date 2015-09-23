<?php

/**
 * Ejecuta accion
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    
    $actionName = $Context->get_params("action");
    
    $A= $Context->get_objcache()->get_object("Action", $actionName);
    $rta =$Context->get_objcache()->get_status("Action", $actionName);
    if($rta!="ok"){
        return $Context->createElement("error", "No se pudo cargar la accion #0.".$rta."-");
    }
    
    $idth = $Context->get_params("idth");
    if($idth){
        $TH= $Context->get_objcache()->get_object("TktH",$idth);
        if($Context->get_objcache()->get_status("TktH",$idth)!="ok"){
            return $Context->createElement("error", "No se pudo cargar el evento #1 $idth");
        }
        $A->loadTH($TH);
    }
    
    $form = $A->get_prop("itf");
    
    if(!$form){
        return $Context->createElement("error", "No se pudo cargar formulario #2");
    }
    
    $ret = $Context->append_xml($form->getInputDom()->documentElement);
    
    return $ret;
    
}