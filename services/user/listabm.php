<?php
/**
 * Lista usuarios
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $USERALL = new USER($RC->get_Connection());
    $USERALL_v = $USERALL->list_all();
    $DOM=$RC->get_responseDOM();
    $userL=$DOM->createElement("list");
    if ($USERALL_v) {
        foreach ($USERALL_v as $u)
            $userL->appendChild($u->getXML($DOM,array('usr','dominio')));
        return $userL;
    }
    return null;
}