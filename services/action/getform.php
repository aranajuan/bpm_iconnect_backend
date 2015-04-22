<?php

require_once 'classes/action.php';

/**
 * Ejecuta accion
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    
    $actionName = $RC->get_params("action");
    
    $A= $RC->get_objcache()->get_object("ACTION", $actionName);
    $rta =$RC->get_objcache()->get_status("ACTION", $actionName);
    if($rta!="ok"){
        return $RC->createElement("error", "No se pudo cargar la accion.".$rta."-");
    }
    
    $form = $A->get_prop("itf");
    
    if(!$form){
        return $RC->createElement("error", "No se pudo cargar formulario");
    }
    
    $ret = $RC->append_xml($form->get_inputDOM()->documentElement);
    
    return $ret;
    
}