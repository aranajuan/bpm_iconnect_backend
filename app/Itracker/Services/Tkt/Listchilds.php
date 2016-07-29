<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;
use Itracker\Exceptions\ItException;

class Listchilds implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $TKT = $Context->get_objcache()->get_object("Tkt", $Context->get_params("idtkt"));

        if (!$Context->get_User()->in_team($TKT->get_prop("idequipo"))) {
        	throw new ItException('service/checkdata','Acceso denegado. El ticket no esta asignado a tu equipo.');
        }

        $ALL_v = $TKT->get_prop("childs");

        $rta = new ResponseElement ( 'data' );
        $rta_list = new ResponseElement ( 'list' );

        $fields = array("id", "usr_o.nombre", "FA");

        if ($ALL_v) {
            foreach ($ALL_v as $l) {
                $rta_list->addValue($l->getData( $fields));
            }
        }
        $rta->addValue($rta_list);
        return $rta;
    }

}