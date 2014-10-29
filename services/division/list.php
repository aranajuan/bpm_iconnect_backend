<?php
require_once 'classes/division.php';
/**
 * Lista usuarios
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $ALL = new DIVISION($RC->get_Connection());
    $ALL_v = $ALL->list_all();
    $listL=$RC->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre','linkwi')));
        return $listL;
    }
    return null;
}