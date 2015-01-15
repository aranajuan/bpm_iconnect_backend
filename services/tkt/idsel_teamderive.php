<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $params = $RC->get_params("sel_params");
    $arr=  json_decode($params);
    $TKT = $RC->get_objcache()->get_object("TKT", $arr->idtkt);
    if($RC->get_objcache()->get_status("TKT", $arr->idtkt)!="ok"){
        return $RC->createElement("error","ticket invalido".print_r($arr,true));
    }
    
    $team = $TKT->get_prop("equipo");
    $teams=$team->get_prop('equiposderiva');
    $listL=$RC->createElement("list");
    
    if ($teams) {
        foreach ($teams as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre')));
        return $listL;
    }
    
    return null;
    
}