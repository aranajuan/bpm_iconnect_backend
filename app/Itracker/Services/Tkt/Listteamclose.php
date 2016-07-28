<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItException;

class Listteamclose implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$u = $Context->get_User ();
		
		$dias = 5;
		$desde = date ( DBDATE_WRITE, strtotime ( '-' . $dias . ' day' ) );
		$hasta = date ( DBDATE_WRITE, strtotime ( '+1 day' ) );
		
		$arrayTeam = array ();
		$idsteams = explode ( ",", $Context->get_params ( "team" ) );
		foreach ( $idsteams as $idteam ) {
			if (! $u->in_team ( $idteam )) {
				throw new ItException ( 'dbobject/checkdata', "Equipo invalido($idteam). Acceso denegado." );
			}
			array_push ( $arrayTeam, $idteam );
		}
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$IDSTEAMS, $arrayTeam );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FB );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, $desde );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, $hasta );
		
		$equipo = $u->get_team_obj ( $arrayTeam [0] );
		$view = $equipo->get_prop ( "staffhome_vista" );
		$fields = $equipo->getFieldRequired ( "staffhome_vista" );
		
		$Tf->set_filter ( \Itracker\TktFilter::$IDMASTER, array (
				'null' 
		) );
		$Tl = new \Itracker\TktLister ();
		
		$Tl->loadFilter ( $Tf );
		
		$Tl->execute ();
		
		$rta = new ResponseElement ( 'data', new ResponseElement ( 'view', $view . ",fb=>FC" ) );
		$rta_list = new ResponseElement ( 'list' );
		if ($Tl->getCount () == 0) {
			return null;
		}
		while ( $l = $Tl->getObj () ) {
			$rta_list->addValue ( $l->getData ( $fields ) );
		}
		$rta->addValue ( $rta_list );
		return $rta;
	}
}