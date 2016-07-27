<?php

namespace Itracker\Services\Listin;
use Itracker\ResponseElement;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\Listin();
        $ALL_v = $ALL->list_all();
        $rta = new ResponseElement('list');
        if ($ALL_v) {
            foreach ($ALL_v as $l){
                $rta->addValue($l->getData(array('id', 'nombre', 'too', 'cc')));
            }
        }
        return $rta;
    }

}