<?php

namespace Itracker\Actions;

class ReopenAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$TKT->re_open ();
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		return null;
	}
}
