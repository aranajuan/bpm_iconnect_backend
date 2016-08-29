<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

class Listteam implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$u = $Context->getUser ();
		$arrayTeam = array ();
		$idsteams = explode ( ",", $Context->get_params ( "team" ) );
		foreach ( $idsteams as $idteam ) {
			if (! $u->in_team ( $idteam )) {
				throw new ItFunctionalException ( 'service/checkdata', "Equipo invalido($idteam). Acceso denegado." );
			}
			array_push ( $arrayTeam, $idteam );
		}
		
		$Tf = new \Itracker\TktFilter ();
		
		$Tf->set_filter ( \Itracker\TktFilter::$IDSTEAMS, $arrayTeam );
		
		switch ($Context->get_params ( "filter" )) {
			case "my" :
				$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
				$Tf->set_filter ( \Itracker\TktFilter::$TAKENBY, array (
						$u->get_prop ( "usr" ) 
				) );
				break;
			case "myNtom" :
				$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
				$Tf->set_filter ( \Itracker\TktFilter::$TAKENBY, array (
						$u->get_prop ( "usr" ),
						'null' 
				) );
				break;
			case "free" :
				$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
				$Tf->set_filter ( \Itracker\TktFilter::$TAKENBY, array (
						'null' 
				) );
				break;
			case "taken" :
				$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
				$Tf->set_filter ( \Itracker\TktFilter::$TAKENBY, array (
						'*' 
				) );
				break;
			case "closed" :
				$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FB );
				$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, @STRdate_format ( $Context->get_params ( "cfrom" ), USERDATE_READ, DBDATE_WRITE ) );
				$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, @STRdate_format ( $Context->get_params ( "cto" ), USERDATE_READ, DBDATE_WRITE ) );
				break;
			default : // open todos
				$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
		}
		
		$equipo = $u->get_team_obj ( $arrayTeam [0] );
		$view = $equipo->get_prop ( "staffhome_vista" );
		$fields = $equipo->getFieldRequired ( "staffhome_vista" );
		
		$Tf->set_filter ( \Itracker\TktFilter::$IDMASTER, array (
				'null' 
		) );
		
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