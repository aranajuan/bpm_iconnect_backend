<?php

namespace Itracker\Services\Listin;

class IdselList implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new Itracker\Listin($Context->get_Connection());
        $ALL_v = $ALL->list_all();
        $listL = $Context->createElement("list");
        if ($ALL_v) {
            foreach ($ALL_v as $l)
                $listL->appendChild($l->getXML($Context, array('id', 'nombre')));
            return $listL;
        }
        return null;
    }

}