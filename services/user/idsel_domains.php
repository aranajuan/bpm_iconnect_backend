<?php
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $V = $RC->get_User()->list_alldomains();
    $listL=$RC->createElement("list");
    if ($V) {
        foreach ($V as $l){
            $e=$RC->createElement("DOMAIN");
            $nombre=$RC->createElement("nombre", $l);
            $e->appendChild($nombre);
            $listL->appendChild($e);
        }
        return $listL;
    }
    return null;
    
}
