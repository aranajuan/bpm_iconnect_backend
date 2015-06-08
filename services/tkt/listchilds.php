<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $TKT = $Context->get_objcache()->get_object("Tkt", $Context->get_params("idtkt"));
    if($Context->get_objcache()->get_status("Tkt", $Context->get_params("idtkt"))!="ok"){
        return $Context->createElement("error", "Ticket invalido");
    }
    
    if(!$Context->get_User()->in_team($TKT->get_prop("idequipo"))){
        return $Context->createElement("error", "Acceso denegado. El ticket no esta asignado a tu equipo.");
    }

    $ALL_v = $TKT->get_prop("childs");

    $response=$Context->createElement("data");
    
    $listL=$Context->createElement("list");
    
    $fields=array("id","usr_o.nombre","FA");
    
    if ($ALL_v) {
        foreach ($ALL_v as $l){
            $listL->appendChild($l->getXML($Context,$fields));
        }
        $response->appendChild($listL);
        return $response;
    }
     return $Context->createElement("error", "Ningun anexo");
}