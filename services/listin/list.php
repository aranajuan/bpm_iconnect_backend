<?php
require_once 'classes/listin.php';
/**
 * Lista usuarios
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $LISTINALL = new LISTIN($RC->get_Connection());
    $LISTINALL_v = $LISTINALL->list_all();
    $listL=$RC->createElement("list");
    if ($LISTINALL_v) {
        foreach ($LISTINALL_v as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre','too','cc')));
        return $listL;
    }
    return null;
}