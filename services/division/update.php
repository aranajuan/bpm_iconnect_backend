<?php
/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= $RC->get_objcache()->get_object("Division",$RC->get_params("id"));
    $D->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$D->update_DB());
}