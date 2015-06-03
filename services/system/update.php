<?php

/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= $RC->get_objcache()->get_object("System",$RC->get_params("id"));
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->update_DB());
}