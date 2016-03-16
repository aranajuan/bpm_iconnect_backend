<?php

namespace Itracker\Services\User;

class IdselDomains implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $V = $Context->get_User()->list_alldomains();
        $listL = $Context->createElement("list");
        if ($V) {
            foreach ($V as $l) {
                $e = $Context->createElement("DOMAIN");
                $nombre = $Context->createElement("nombre", $l);
                $e->appendChild($nombre);
                $listL->appendChild($e);
            }
            return $listL;
        }
        return null;
    }

}