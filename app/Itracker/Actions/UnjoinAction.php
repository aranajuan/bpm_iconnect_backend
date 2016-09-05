<?php

namespace Itracker\Actions;

class UnjoinAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$TKT->un_join ();
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		return null;
	}
}
