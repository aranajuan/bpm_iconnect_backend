<?php
/**
 * Inserta listines
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $L= $Context->get_objcache()->get_object("Listin",$Context->get_params("id"));
    $L->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$L->update_DB());
}