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
    }elseif($RC->get_params("status")=="close"){
        $filter=array("open"=>"close",
            "from"=>$RC->get_params("fecha_d"),
            "to"=>$RC->get_params("fecha_h"));
    }else{
        return null;
    }
    
    $filter=  array_merge($filter,array("openby"=>$RC->get_User()->get_prop("usr")));
    
    $ALL = new TKT();
            
    $ALL_v = $ALL->list_fiter($filter);
    $listL=$RC->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l){
            $listL->appendChild($l->getXML($RC,array("id","FA","FB")));
        }
        return $listL;
    }
    return null;
}