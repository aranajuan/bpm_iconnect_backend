<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

class Getsimilars implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$TKT = new \Itracker\Tkt ();
		$TKT->load_VEC ( array (
				"origen" => $Context->get_params ( "path" ) 
		) );
		
		$topts = $TKT->get_last ();
		
		if (! $topts->get_prop ( 'unir' )) {
			throw new ItFunctionalException ( 'action/invalid', 'Accion no valida para esta opcion. #2' );
		}
		
		$ALL_v = $TKT->get_similar ();
		
		if ($ALL_v == null || count ( $ALL_v ) == 0) {
			return null;
		}
		
		$rta = new ResponseElement ( 'list' );
		$cc = 0;
		
		if ($ALL_v == null) {
			return null;
		}
		foreach ( $ALL_v as $l ) {
			$rta_tkt = new ResponseElement ( 'tkt', array (
					new ResponseElement ( 'id', $l->get_prop ( 'id' ) ),
					new ResponseElement ( 'fa', $l->get_prop ( 'fa' ) ),
					new ResponseElement ( 'origen', $l->get_prop ( 'origen' ) ),
					new ResponseElement ( 'childsc', $l->get_count_childs () ) 
			) );
			
			$fstTH = $l->get_first_tktH ();
			if ($fstTH) {
				$openxml = $fstTH->getData_H ();
				if ($openxml) {
					$rta_tkt->addValue ( $openxml );
					$rta->addValue ( $rta_tkt );
					$cc ++;
				}
			}
		}
		if ($cc == 0) {
			return null;
		}
		return $rta;
	}
}