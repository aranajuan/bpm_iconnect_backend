<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $teams = $Context->get_User()->get_prop("equiposobj");
    $listL=$Context->createElement("list");
    if ($teams) {
        foreach ($teams as $l)
            $listL->appendChild($l->getXML($Context,array('id','nombre')));
        return $listL;
    }
    return null;
    
}
