<?php
/**
 * Elimina listines
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $L= $Context->get_objcache()->get_object("Listin",$Context->get_params("id"));
    return $Context->createElement("result",$L->delete_DB());
}