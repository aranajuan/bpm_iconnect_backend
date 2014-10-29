<?php
/**
 * Lista listines
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $LISTALL = new LISTIN($RC->get_Connection());
    $LISTALL_v = $LISTALL->list_all();
    $listL=$RC->createElement("list");
    if ($LISTALL_v) {
        foreach ($LISTALL_v as $u)
            $listL->appendChild($u->getXML($RC,array('id','too','cc')));
        return $listL;
    }
    return null;
}