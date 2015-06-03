<?php
/**
 * Update
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $D= $Context->get_objcache()->get_object("Division",$Context->get_params("id"));
    $D->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$D->update_DB());
}