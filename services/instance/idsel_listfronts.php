<?php

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $Front = new Itracker\Front($RC->get_Connection());
    $FF = $Front->list_all();
    $FL=array();
    foreach ($FF as $F){
        if($F->is_validInstance($RC->get_Instance()->get_prop("nombre"))){
            array_push($FL, $F);
        }
    }
    
    $listL=$RC->createElement("list");
    if ($FL) {
        foreach ($FL as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre')));
        return $listL;
    }
    return null;
    
}