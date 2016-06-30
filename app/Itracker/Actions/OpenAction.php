<?php

namespace Itracker\Actions;

use KLogger;

class OpenAction implements ITActionsInterface {
	public static function go($action) {
		$TKT = $action->getTKT ();
		$itf = $action->getitform ();
		$destiny = $action->getScriptResponse ();
		$context = \Itracker\Context::getContext ();
		$extra = array ();
		
		/* VALIDACIONES */
		
		$lstOption = $TKT->get_last ();
		
		if (! is_numeric ( $destiny->get_prop ( 'id' ) )) {
			throw new ItException ( 'action/go/invalid', 'No hay destino valido id en script', KLogger\Psr\Log\LogLevel::WARNING, '', array (
					'id' => $lstOption->get_prop ( 'id' ),
					'usr' => $context->get_User ()->get_prop ( 'usr' ),
					'data' => $context->get_params ( 'form' ) 
			) );
		}
		
		/* ABRIR */
		$TKT->open ( $destiny->get_prop ( 'id' ) );
		
		if ($lstOption->get_prop ( 'unir' )) {
			$extra ["openother"] = 0;
		} else {
			$extra ["openother"] = 1;
		}
		
		$action->loadObjadjId ( $TKT->get_prop ( "idequipo" ) );
		
		$extra ["id"] = $TKT->get_prop ( "id" );
		$action->force_tkth ();
		
		/* CERRAR A FILE */
		$file = $destiny->get_prop ( 'file' );
		if ($file) { // no une
			$extra ["type"] = "file";
			$extra ["file"] = $file;
			$TKT->ejecute_action ( "CERRAR_RUTA", array (
					array (
							"id" => "link_archivo",
							"value" => $file 
					) 
			) );
			
			$extra ["status"] = "close";
			
			return new ITActionsGoResponse ( 'ok', '', $extra );
		}
		
		/* UNIR */
		if (! $lstOption->get_prop ( 'unir' )) {
			return new ITActionsGoResponse ( 'ok', '', $extra );
		}
		
		$idmaster = $itf->getExtravalue ( 'idmaster' );
		
		if (is_numeric ( $idmaster ) && $idmaster > 0) {
			$TKT->ejecute_action ( "UNIR", array (
					array (
							"id" => "idmaster",
							"value" => $idmaster 
					) 
			) );
		}
		return new ITActionsGoResponse ( 'ok', '', $extra );
	}
	public static function show($th) {
		$obCI = \Itracker\ObjectCache::getInstance ();
		
		$T = $obCI->get_object ( 'Team', $th->get_prop ( 'objadj_id' ),false,true );
		$TT = $obCI->get_object ( 'Tkt', $th->get_prop ( "idtkt" ) );
		$status = $TT->get_status ();
		$asignado = " // Asignado a: " . $T->get_prop ( 'nombre' ) . " ($status)";
		
		if ($th->get_prop ( 'UA_o' )) {
			$tnames = $th->get_prop ( 'UA_o' )->get_prop ( 'equiposname' );
			$tnamesv = explode ( ';', $tnames );
			if (count ( $tnamesv ) > 3) {
				$tnames = implode ( ';', array_slice ( $tnamesv, 0, 3 ) );
				$tnames .= ' (+)';
			}
			$userGen = 'Generado por :' . ' ' . $th->get_prop ( 'UA' ) . '-' . $th->get_prop ( 'UA_o' )->get_prop ( 'nombre' ) . ' (' . $tnames . ')';
		} else {
			$userGen = 'Generado por: Indeterminado - Error ' . $th->get_prop ( 'UA' );
		}
		
		return new ITActionsShowResponse ( $T, $userGen . $asignado );
	}
}