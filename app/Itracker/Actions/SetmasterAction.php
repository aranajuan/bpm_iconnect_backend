<?php

namespace Itracker\Actions;

class SetmasterAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$TKT->set_master ();
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		return null;
	}
}
