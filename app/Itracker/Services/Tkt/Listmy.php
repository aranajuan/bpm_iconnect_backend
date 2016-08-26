<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;

class Listmy implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$UA, array (
				$Context->getUser ()->get_prop ( "usr" ) 
		) );
		
		if ($Context->get_params ( "status" ) == "open") {
			$Tf->set_filter ( \Itracker\TktFilter::$IS_OPEN, "true" );
		} elseif ($Context->get_params ( "status" ) == "closed") {
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FB );
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, @STRdate_format ( $Context->get_params ( "cfrom" ), USERDATE_READ, DBDATE_WRITE ) );
			$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, @STRdate_format ( $Context->get_params ( "cto" ), USERDATE_READ, DBDATE_WRITE ) );
		} else {
			return null;
		}
		
		$viewA = $Context->getUser ()->getMyView ();
		$view = $viewA [0];
		$fields = $viewA [1];
		
		$Tl = new \Itracker\TktLister ();
		$Tl->loadFilter ( $Tf );
		
		$Tl->execute ();
		
		$rta = new ResponseElement ( 'data', new ResponseElement ( 'view', $view ) );
		$rta_list = new ResponseElement ( 'list' );
		if ($Tl->getCount () == 0) {
			return null;
		}
		while ( $l = $Tl->getObj () ) {
			$rta_list->addValue($l->getData($fields));
		}
		$rta->addValue($rta_list);
		return $rta;
	}
}