<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItException;

class Listtouch implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$u = $Context->getUser ();
		$arrayTeam = array ();
		$idsteams = explode ( ",", $Context->get_params ( "team" ) );
		foreach ( $idsteams as $idteam ) {
			if (! $u->in_team ( $idteam )) {
				throw new ItException ( 'service/checkdata', "Equipo invalido($idteam). Acceso denegado." );
			}
			array_push ( $arrayTeam, $idteam );
		}
		
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$TOUCH_BY_TEAM, $arrayTeam );
		$Tf->set_filter ( \Itracker\TktFilter::$NOT_IDSTEAMS, $arrayTeam );
		$equipo = $u->get_team_obj ( $arrayTeam [0] );
		$view = $equipo->get_prop ( "staffhome_vista" );
		$fields = $equipo->getFieldRequired ( "staffhome_vista" );
		if ($Context->get_params ( "filter" ) == "derived") {
			$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
		} else {
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_UPDATE );
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, @STRdate_format ( $Context->get_params ( "cfrom" ), USERDATE_READ, DBDATE_WRITE ) );
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, @STRdate_format ( $Context->get_params ( "cto" ), USERDATE_READ, DBDATE_WRITE ) );
		}
		
		$Tl = new \Itracker\TktLister ();
		$Tl->loadFilter ( $Tf );
		
		$Tl->execute ();
		
		$rta = new ResponseElement ( 'data', new ResponseElement ( 'view', $view ) );
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