<?php
require_once   'classes/team.php';
/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new TEAM($RC->get_Connection());
    $O->load_DB($RC->get_params("id"));
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->update_DB());
}