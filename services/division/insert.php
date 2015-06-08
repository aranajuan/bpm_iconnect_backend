<?php
/**
 * Inserta division
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $D= new Itracker\Division($Context->get_Connection());
    $D->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$D->insert_DB());
}