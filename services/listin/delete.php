<?php
require_once   'classes/listin.php';
/**
 * Elimina listines
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $L= $RC->get_objcache()->get_object("LISTIN",$RC->get_params("id"));
    return $RC->createElement("result",$L->delete_DB());
}