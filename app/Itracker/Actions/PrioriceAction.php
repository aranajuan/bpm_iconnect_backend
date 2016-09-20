<?php

namespace Itracker\Actions;

class PrioriceAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		
		$prioridad = $action->getScriptResponse ()->get_prop ( 'id' );
		
		$TKT->set_priority ( $prioridad );
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		return null;
	}
}
