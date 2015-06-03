<?php
/**
 * Inserta division
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $D= new Itracker\Division($RC->get_Connection());
    $D->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$D->insert_DB());
}