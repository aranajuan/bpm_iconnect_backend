<?php
require_once   'classes/division.php';
/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= new DIVISION($RC->get_Connection());
    $D->load_DB($RC->get_params("id"));
    $D->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$D->update_DB());
}