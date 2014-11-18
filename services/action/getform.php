<?php

require_once 'classes/action.php';

/**
 * Ejecuta accion
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    
    $actionName = $RC->get_params("action");
    
    $A= new ACTION();
    
    if($A->load_DB($actionName)!="ok"){
        return $RC->createElement("error", "No se pudo cargar la accion");
    }
    
    $formTXT = $A->get_prop("form");
    
    if($formTXT==""){
        return $RC->createElement("error", "No se pudo cargar formulario");
    }
    
    $parser = new DOMDocument();
    $parser->loadXML($formTXT);
    
    $ret = $RC->append_xml($parser->getElementsByTagName("itform")->item(0));
    
    return $ret;
    
}