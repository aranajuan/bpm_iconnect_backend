<?php
/**
 * Elimina
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= $RC->get_objcache()->get_object("System",$RC->get_params("id"));
    return $RC->createElement("result",$O->delete_DB());
}