<?php
/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new Itracker\System();
    $O->load_VEC($RC->get_params(null));
    return $RC->createElement("result",$O->insert_DB());
}