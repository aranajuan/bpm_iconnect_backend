<?php

namespace Itracker\Services\Division;
use Itracker\ResponseElement;

class IdselList implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\Division();
        $ALL_v = $ALL->list_all();
        $rta = new ResponseElement('list');
        if ($ALL_v) {
            foreach ($ALL_v as $l){
                $rta->addValue($l->getData(array('id', 'nombre')));
            }
        }
        return $rta;
    }

}