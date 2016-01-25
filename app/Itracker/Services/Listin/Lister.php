<?php

namespace Itracker\Services\Listin;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $LISTINALL = new \Itracker\Listin();
        $LISTINALL_v = $LISTINALL->list_all();
        $listL = $Context->createElement("list");
        if ($LISTINALL_v) {
            foreach ($LISTINALL_v as $l)
                $listL->appendChild($l->getXML($Context, array('id', 'nombre', 'too', 'cc')));
            return $listL;
        }
        return null;
    }

}