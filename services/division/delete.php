<?php
/**
 * Elimina division
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= $RC->get_objcache()->get_object("Division",$RC->get_params("id"));
    return $RC->createElement("result",$D->delete_DB());
}