<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;

class Listmyclose implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$dias = 5;
		$desde = date ( DBDATE_WRITE, strtotime ( '-' . $dias . ' day' ) );
		$hasta = date ( DBDATE_WRITE, strtotime ( '+1 day' ) );
		
		$Tf = new \Itracker\TktFilter ();
		$Tf->set_filter ( \Itracker\TktFilter::$UA, array (
				$Context->getUser ()->get_prop ( "usr" ) 
		) );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FB );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_FROM, $desde );
		$Tf->set_filter ( \Itracker\TktFilter::$DATE_TO, $hasta );
		
		$viewA = $Context->getUser ()->getMyView ();
		$view = $viewA [0];
		$fields = $viewA [1];
		
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