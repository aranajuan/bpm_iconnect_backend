<?php

namespace Itracker\Actions;

use Itracker\ItException;

class JoinAction implements ITActionsInterface {
	public static function go($action) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		$TKT = $action->getTKT ();
		$context = \Itracker\Context::getContext ();
		
		$idmaster = $action->getScriptResponse ()->get_prop ( 'id' );
		$master = $obCI->get_object ( 'Tkt', $idmaster );
		
		if ($action->isWorking ()) {
			
			if (! $context->get_User ()->in_team ( $master->get_prop ( 'idequipo' ) )) {
				throw new ItException ('action/go/invalid','El ticket master no esta en tu equipo');
			}
			
			$utomM = $master->get_prop ( "u_tom" );
			if ($utomM != null && $utomM != $context->get_User ()->get_prop ( 'usr' )) { // el ticket master esta tomado por otro
				$arrEJ = makeproparr ( $action->getTKT ()->valid_actions (), 'ejecuta' );
				if (! in_array ( 'asign', $arrEJ )) {
					throw new ItException ('action/go/invalid','El ticket master esta tomado y no puedes asignarlo');
				}
			}
		}
		
		$action->setChilds ( $TKT->get_prop ( "childs" ) );
		
		$TKT->join ( $master );
		
		$action->loadObjadjId ( $master->get_prop ( "id" ) );
		
		return new ITActionsGoResponse ( 'ok', '' );
	}
	public static function show($th) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		
		$T = $obCI->get_object ( 'Tkt', $th->get_prop ( 'objadj_id' ) );
		return new ITActionsShowResponse ( $T, 'Unido a itracker ' . $th->get_prop ( 'objadj_id' ) );
	}
}