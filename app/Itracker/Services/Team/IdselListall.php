<?php

namespace Itracker\Services\Team;
use Itracker\ResponseElement;

class IdselListall implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $ALL = new \Itracker\Team();
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