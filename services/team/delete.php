<?php

/**
 * Elimina
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $O= $Context->get_objcache()->get_object("Team",$Context->get_params("id"));
    return $Context->createElement("result",$O->delete_DB());
}