<?php

namespace Itracker\Actions;

class FreeAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$TKT->free ();
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		return null;
	}
}
