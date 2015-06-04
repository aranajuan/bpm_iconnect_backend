<?php

/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $V = $Context->get_User()->list_allprofiles();
    $listL = $Context->createElement("list");
    if ($V) {
        foreach ($V as $l) {
            if ($l["id"] > 1) {
                $e = $Context->createElement("PROFILE");
                $id = $Context->createElement("id", $l["id"]);
                $nombre = $Context->createElement("nombre", $l["nombre"]);
                $e->appendChild($id);
                $e->appendChild($nombre);
                $listL->appendChild($e);
            }
        }
        return $listL;
    }
    return null;
}
