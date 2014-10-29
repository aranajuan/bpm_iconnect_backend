<?php
require_once   'classes/listin.php';
/**
 * Inserta listines
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $L= new LISTIN($RC->get_Connection());
    $L->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$L->insert_DB());
}