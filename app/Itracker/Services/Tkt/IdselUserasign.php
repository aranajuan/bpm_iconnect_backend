<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;

class IdselUserasign implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $params = $Context->get_params("sel_params");
        $arr = json_decode($params);
        $TKT = $Context->get_objcache()->get_object("Tkt", $arr->idtkt);

        $team = $TKT->get_prop("equipo");
        $usrs = $team->get_users();
        $rta = new ResponseElement ( 'list' );

        if ($usrs) {
            foreach ($usrs as $l){
				$rta->addValue ( $l->getData ( array (
						'usr',
						'nombre' 
				) ) );
			}
		}
		
		return $rta;
    }

}