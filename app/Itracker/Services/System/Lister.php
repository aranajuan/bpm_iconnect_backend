<?php

namespace Itracker\Services\System;
use Itracker\ResponseElement;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\System();
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