<?php
/**
 * Inserta
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $O= new Itracker\System();
    $O->load_VEC($Context->get_params(null));
    return $Context->createElement("result",$O->insert_DB());
}