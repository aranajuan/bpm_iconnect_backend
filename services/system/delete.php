<?php
require_once   'classes/system.php';
/**
 * Elimina
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new SYSTEM($RC->get_Connection());
    $O->load_DB($RC->get_params("id"));
    return $RC->createElement("result",$O->delete_DB());
}