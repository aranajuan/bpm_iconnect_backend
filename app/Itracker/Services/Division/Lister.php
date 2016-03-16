<?php

namespace Itracker\Services\Division;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\Division($Context->get_Connection());
        $ALL_v = $ALL->list_all();
        $listL = $Context->createElement("list");
        if ($ALL_v) {
            foreach ($ALL_v as $l)
                $listL->appendChild($l->getXML($Context, array('id', 'nombre', 'linkwi')));
            return $listL;
        }
        return null;
    }

}