<?php
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $ALL = new Itracker\Division($RC->get_Connection());
    $ALL_v = $ALL->list_all();
    $listL=$RC->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre')));
        return $listL;
    }
    return null;
}