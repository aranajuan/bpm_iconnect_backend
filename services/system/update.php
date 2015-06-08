<?php

/**
 * Update
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $O= $Context->get_objcache()->get_object("System",$Context->get_params("id"));
    $O->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$O->update_DB());
}