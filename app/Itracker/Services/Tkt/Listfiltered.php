<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

class Listfiltered implements \Itracker\Services\ITServiceInterface {
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
		$actions = $Context->get_params ( "actions" );
		
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
		$Tf->set_filter ( \Itracker\TktFilter::$IDSTEAMS, $arrayTeam );
		$Tf->set_filter ( \Itracker\TktFilter::$ORIGINS, explode ( ';', $Context->get_params ( "origin" ) ) );
		
		$taken = $Context->get_params ( "taken" );
		if ($taken) {
			$Tf->set_filter ( \Itracker\TktFilter::$TAKENBY, explode ( ",", $taken ) );
		}
		
		$Tl = new \Itracker\TktLister ();
		$Tl->loadFilter ( $Tf );
		
		$Tl->execute ();
		
		$rta = new ResponseElement ( 'list' );
		if ($Tl->getCount () == 0) {
			return null;
		}
		while ( $l = $Tl->getObj () ) {
			$tkt = $l->getData ( array (
					'id',
					'fa',
					'ua',
					'idmaster',
					'origen' 
			) );
			$tkt_h = new ResponseElement ( 'ths' );
			
			$ths = $l->get_tktHObj ( $actions );
			$c = 0;
			if ($ths && count ( $ths )) {
				foreach ( $ths as $th ) {
					$xmldetail = $th->getXML_H ();
					if ($xmldetail) {
						$tkt_h->addValue ( $xmldetail );
						$c ++;
					}
				}
			}
			if ($c) {
				$tkt->addValue ( $tkt_h );
				$rta->addValue ( $tkt );
			}
		}
		
		return $rta;
	}
}