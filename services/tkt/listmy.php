<?php
require_once 'classes/tkt.php';
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    if($RC->get_params("status")=="open"){
        $filter=array("open"=>"open");
    }elseif($RC->get_params("status")=="closed"){
        $filter=array("open"=>"closed",
            "cfrom"=>$RC->get_params("cfrom"),
            "cto"=>$RC->get_params("cto"));
    }else{
        return null;
    }
    
    $filter=  array_merge($filter,array("openby"=>$RC->get_User()->get_prop("usr")));
    
    $ALL = new TKT();
    
    $equipos = $RC->get_User()->get_prop("equiposobj");
    if(count($equipos)){
        $view=$equipos[0]->get_prop("mytkts_vista");
    }else{
        $view="";
    }
    
    $ALL_v = $ALL->list_fiter($filter);
    $response=$RC->createElement("data");
    $response->appendChild($RC->createElement("view", $view));
    $listL=$RC->createElement("list");
    $fields=array("id","usr_o.nombre","usr_o.equiposname","FA","FB","u_tom_o.nombre","prioridadtext","childsc","origen_json","equipo.nombre","status","critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l){
            $listL->appendChild($l->getXML($RC,$fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}