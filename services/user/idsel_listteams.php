<?php
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $teams = $RC->get_User()->get_prop("equiposobj");
    $listL=$RC->createElement("list");
    if ($teams) {
        foreach ($teams as $l)
            $listL->appendChild($l->getXML($RC,array('id','nombre')));
        return $listL;
    }
    return null;
    
}
