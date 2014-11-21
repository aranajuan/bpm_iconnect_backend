<?php
require_once 'classes/tkt.php';
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $TKT = new TKT();
    if($TKT->load_DB($RC->get_params("idtkt"))!="ok"){
        return $RC->createElement("error", "Ticket invalido");
    }
    
    if(!$RC->get_User()->in_team($TKT->get_prop("idequipo"))){
        return $RC->createElement("error", "Acceso denegado. El ticket no esta asignado a tu equipo.");
    }

    $ALL_v = $TKT->get_prop("childs");

    $response=$RC->createElement("data");
    
    $listL=$RC->createElement("list");
    
    $fields=array("id","usr_o.nombre","FA");
    
    if ($ALL_v) {
        foreach ($ALL_v as $l){
            $listL->appendChild($l->getXML($RC,$fields));
        }
        $response->appendChild($listL);
        return $response;
    }
     return $RC->createElement("error", "Ningun anexo");
}