<?php

namespace Itracker\Actions;

use Itracker\Exceptions\ItFunctionalException;

class TakeAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$TKT->take ();
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		try {
			$uas = $obCI->get_object ( 'User', $th->get_prop ( 'UA' ), false, true );
			return new ITActionsShowResponse ( $uas, 'Tomado por ' . $uas->get_prop ( 'nombre' ) );
		} catch ( ItFunctionalException $e ) {
			return new ITActionsShowResponse ( null, 'No se puede determinar usuario. Error ' . $th->get_prop ( 'UA' ) );
		}
	}
}
