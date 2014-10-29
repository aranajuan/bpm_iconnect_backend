<?php
require_once   'classes/listin.php';
/**
 * Elimina listines
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $L= new LISTIN($RC->get_Connection());
    $L->load_DB($RC->get_params("id"));
    return $RC->createElement("result",$L->delete_DB());
}