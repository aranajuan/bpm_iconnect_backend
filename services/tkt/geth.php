<?php
require_once 'classes/tkt.php';
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $idtkt = $RC->get_params("id");

    $TKT = new TKT();
    if($TKT->load_DB($idtkt)!="ok"){
        return $RC->createElement("error", "Ticket invalido.");
    }
    
    $THALL = $TKT->get_tktH();
    
    foreach ($THALL as $TH){
        
    }

    return null;
}