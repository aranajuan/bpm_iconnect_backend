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
    $TKT = new TKT();
    if($TKT->load_DB($arr->idtkt)!="ok"){
        return $RC->createElement("error","ticket invalido".print_r($arr,true));
    }
    
    $team = $TKT->get_prop("equipo");
    $usrs=$team->get_users();
    $listL=$RC->createElement("list");
    
    if ($usrs) {
        foreach ($usrs as $l)
            $listL->appendChild($l->getXML($RC,array('usr','nombre')));
        return $listL;
    }
    
    return null;
    
}
