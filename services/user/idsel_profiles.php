<?php

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $V = $RC->get_User()->list_allprofiles();
    $listL = $RC->createElement("list");
    if ($V) {
        foreach ($V as $l) {
            if ($l["id"] > 1) {
                $e = $RC->createElement("PROFILE");
                $id = $RC->createElement("id", $l["id"]);
                $nombre = $RC->createElement("nombre", $l["nombre"]);
                $e->appendChild($id);
                $e->appendChild($nombre);
                $listL->appendChild($e);
            }
        }
        return $listL;
    }
    return null;
}
