<?php
require_once   'classes/division.php';
/**
 * Elimina division
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= $RC->get_objcache()->get_object("DIVISION",$RC->get_params("id"));
    return $RC->createElement("result",$D->delete_DB());
}