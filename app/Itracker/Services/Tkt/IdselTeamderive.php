<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;

class IdselTeamDerive implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$params = $Context->get_params ( "sel_params" );
		$arr = json_decode ( $params );
		$TKT = $Context->get_objcache ()->get_object ( "Tkt", $arr->idtkt );
		
		$team = $TKT->get_prop ( "equipo" );
		$teams = $team->get_prop ( 'equiposderiva' );
		$rta = new ResponseElement ( 'list' );
		
		if ($teams) {
			foreach ( $teams as $l ) {
				$rta->addValue ( $l->getData ( array (
						'id',
						'nombre' 
				) ) );
			}
		}
		
		return $rta;
	}
}