<?php

namespace Itracker\Services\Report;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

class Report implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$u = $Context->getUser ();
		$rname = $Context->getInstance ()->get_prop ( "nombre" ) . "_" . $u->get_prop ( "perfilt" );
		$filepath = ROOT_DIR . "/config/reports/" . $rname;
		
		$ffound = false;
		$arrayTeam = array ();
		$idsteams = explode ( ",", $Context->get_params ( "team" ) );
		foreach ( $idsteams as $idteam ) {
			if (! $u->in_team ( $idteam, true )) {
				throw new ItFunctionalException ( 'service/checkdata', "Equipo invalido($idteam). Acceso denegado." );
			}
			array_push ( $arrayTeam, $idteam );
			if (! $ffound && file_exists ( $filepath . '_' . $idteam . '.json' )) {
				$filepath .= '_' . $idteam . '.json';
				$rname .= '_' . $u->get_team_obj ( $idteam )->get_prop ( 'nombre' ) . '(' . $idteam . ')';
				$ffound = true;
			}
		}
		
		if (! $ffound) {
			if (file_exists ( $filepath . '.json' )) {
				$filepath .= '.json';
			} else {
				throw new ItFunctionalException ( 'service/checkdata',"No hay reporte disponible para el perfil. $rname");
			}
		}
		
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, @STRdate_format ( $Context->get_params ( "from" ) . "00:00", USERDATE_READ, DBDATE_WRITE ) );
		
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, @STRdate_format ( $Context->get_params ( "too" ) . " 23:59", USERDATE_READ, DBDATE_WRITE ) );
		
		if ($Context->get_params ( "datefilter" ) == "apertura") {
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FA );
		} else {
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_UPDATE );
		}
		
		if ($Context->get_params ( "filter" ) == "tratadopor") {
			$Tf->set_filter ( \Itracker\TktFilter::$TOUCH_BY_TEAM, $arrayTeam );
		} else {
			$users = array ();
			foreach ( $arrayTeam as $id ) {
				$t = $Context->get_objcache ()->get_object ( "Team", $id );
				$users = array_merge ( $users, makeproparr ( $t->get_users (), "usr" ) );
			}
			$Tf->set_filter ( \Itracker\TktFilter::$UA, $users );
		}
		
		$Tl = new \Itracker\TktLister ();
		$Tl->loadFilter ( $Tf );
		
		$Tl->execute ();
		
		if ($Tl->getCount () == 0) {
			throw new ItFunctionalException('service/checkdata','No hay tickes en el periodo');
		}
		
		$RR = new \Itracker\Report\Request ();
		$RR->setTitle ( $rname );
		
		$RR->loadTKTS ( $Tl );
		
		$RR->loadITJson ( file_get_contents ( $filepath ) );
		
		$RR->execute ();
		// $RPADAPTER = new \Itracker\Report\PHPExcel($RR);
		$RPADAPTER = new \Itracker\Report\PHP_XLSXWriter ( $RR );
		$RPADAPTER->loadExcel ();
		
		$rta = new ResponseElement ( 'file' );
		$rta->addValue ( new ResponseElement ( 'name', 'reporteITRACKER.xlsx', ResponseElement::TEXT ) );
		$rta->addValue ( new ResponseElement ( 'data', $RPADAPTER->getFile (), ResponseElement::FILE ) );
		
		return $rta;
	}
}
