<?php
require_once 'classes/team.php';
/**
 * Lista usuarios
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $ALL = new TEAM($RC->get_Connection());
    $ALL_v = $ALL->list_all();
    $listL=$RC->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l)
            $listL->appendChild($l->getXML($RC,array("id","nombre","t_conformidad","iddireccion","idsequiposderiva","idsequiposvisible","idlistin","direccionname")));
        return $listL;
    }
    return null;
}