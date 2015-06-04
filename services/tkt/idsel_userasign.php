<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $params = $Context->get_params("sel_params");
    $arr=  json_decode($params);
    $TKT = $Context->get_objcache()->get_object("Tkt", $arr->idtkt);
    if($Context->get_objcache()->get_status("Tkt", $arr->idtkt)!="ok"){
        return $Context->createElement("error","ticket invalido".print_r($arr,true));
    }
    
    $team = $TKT->get_prop("equipo");
    $usrs=$team->get_users();
    $listL=$Context->createElement("list");
    
    if ($usrs) {
        foreach ($usrs as $l)
            $listL->appendChild($l->getXML($Context,array('usr','nombre')));
        return $listL;
    }
    
    return null;
    
}
