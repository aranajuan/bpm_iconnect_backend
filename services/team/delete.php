<?php
require_once   'classes/team.php';
/**
 * Elimina
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new TEAM($RC->get_Connection());
    $O->load_DB($RC->get_params("id"));
    return $RC->createElement("result",$O->delete_DB());
}