<?php

namespace Itracker\Services\Instance;

class IdselListfronts implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Front = new Itracker\Front($Context->get_Connection());
        $FF = $Front->list_all();
        $FL = array();
        foreach ($FF as $F) {
            if ($F->is_validInstance($Context->get_Instance()->get_prop("nombre"))) {
                array_push($FL, $F);
            }
        }

        $listL = $Context->createElement("list");
        if ($FL) {
            foreach ($FL as $l)
                $listL->appendChild($l->getXML($Context, array('id', 'nombre')));
            return $listL;
        }
        return null;
    }

}