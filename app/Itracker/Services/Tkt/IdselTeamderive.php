<?php

namespace Itracker\Services\Tkt;

class IdselTeamDerive implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
    $params = $Context->get_params("sel_params");
    $arr=  json_decode($params);
    $TKT = $Context->get_objcache()->get_object("Tkt", $arr->idtkt);
    if($Context->get_objcache()->get_status("Tkt", $arr->idtkt)!="ok"){
        return $Context->createElement("error","ticket invalido".print_r($arr,true));
    }
    
    $team = $TKT->get_prop("equipo");
    $teams=$team->get_prop('equiposderiva');
    $listL=$Context->createElement("list");
    
    if ($teams) {
        foreach ($teams as $l)
            $listL->appendChild($l->getXML($Context,array('id','nombre')));
        return $listL;
    }
    
    return null;
    
}
}