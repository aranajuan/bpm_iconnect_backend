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
        return $Context->createElement("error", "No se pudo cargar la accion.".$rta."-");
    }
    
    $form = $A->get_prop("itf");
    
    if(!$form){
        return $Context->createElement("error", "No se pudo cargar formulario");
    }
    
    $ret = $Context->append_xml($form->get_UserInputDOM()->documentElement);
    
    return $ret;
    
}