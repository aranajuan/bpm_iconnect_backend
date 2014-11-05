<?php
require_once   'classes/team.php';
/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new TEAM($RC->get_Connection());
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->insert_DB());
}