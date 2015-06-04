<?php
/**
 * Lista usuarios
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $ALL = new \Itracker\Team();
    $ALL_v = $ALL->list_all();
    $listL=$Context->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l)
            $listL->appendChild($l->getXML($Context,array("id","nombre","t_conformidad","iddireccion","idsequiposderiva","idsequiposvisible","idsadms","staffhome_vista","mytkts_vista","idlistin","direccionname")));
        return $listL;
    }
    return null;
}