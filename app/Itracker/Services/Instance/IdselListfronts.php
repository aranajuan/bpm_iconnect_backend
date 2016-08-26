<?php

namespace Itracker\Services\Instance;
use Itracker\ResponseElement;

class IdselListfronts implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Front = new \Itracker\Front();
        $FF = $Front->list_all();
        $FL = array();
        foreach ($FF as $F) {
            if ($F->is_validInstance($Context->getInstance()->get_prop("nombre"))) {
                array_push($FL, $F);
            }
        }

        $rta = new ResponseElement('list');
        if ($FL) {
            foreach ($FL as $l){
                $rta->addValue($l->getData(array('id', 'nombre')));
            }
        }
        return $rta;
    }

}