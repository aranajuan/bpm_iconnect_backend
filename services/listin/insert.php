<?php
/**
 * Inserta listines
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $L= new Itracker\Listin();
    $L->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$L->insert_DB());
}