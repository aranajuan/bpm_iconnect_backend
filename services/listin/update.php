<?php
require_once   'classes/listin.php';
/**
 * Inserta listines
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $L= $RC->get_objcache()->get_object("LISTIN",$RC->get_params("id"));
    $L->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$L->update_DB());
}