<?php
require_once   'classes/division.php';
/**
 * Elimina division
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= new DIVISION($RC->get_Connection());
    $D->load_DB($RC->get_params("id"));
    return $RC->createElement("result",$D->delete_DB());
}