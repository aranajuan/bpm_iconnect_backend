<?php

namespace Itracker\Services\System;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\System();
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