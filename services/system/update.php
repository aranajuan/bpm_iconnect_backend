<?php
require_once   'classes/system.php';
/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= $RC->get_objcache()->get_object("SYSTEM",$RC->get_params("id"));
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->update_DB());
}