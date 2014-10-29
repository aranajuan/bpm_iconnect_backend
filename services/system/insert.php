<?php
require_once   'classes/system.php';
/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new SYSTEM($RC->get_Connection());
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->insert_DB());
}