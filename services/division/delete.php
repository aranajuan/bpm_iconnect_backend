<?php
/**
 * Elimina division
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $D= $Context->get_objcache()->get_object("Division",$Context->get_params("id"));
    return $Context->createElement("result",$D->delete_DB());
}