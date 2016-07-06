<?php

namespace Itracker\Actions;

use Itracker\Exceptions\ItException;

class AsignAction implements ITActionsInterface {
	public static function go($action) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		$TKT = $action->getTKT ();
		
		$idusr = $action->getScriptResponse ()->get_prop ( 'id' );
		$tou = $obCI->get_object ( 'User', $idusr );
		
		$TKT->asign ( $tou );
		
		$action->loadObjadjId ( $tou->get_prop ( "usr" ) );
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		try {
			$uas = $obCI->get_object ( 'User', $th->get_prop ( "objadj_id" ), false, true );
			return new ITActionsShowResponse ( $uas, 'Se ha asignado a ' . $uas->get_prop ( 'nombre' ) );
		} catch ( ItException $e ) {
			return new ITActionsShowResponse ( null, 'No se puede determinar usuario. Error ' . $th->get_prop ( 'objadj_id' ) );
		}
	}
}