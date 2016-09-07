<?php

namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;

class GetTreeOptions implements \Itracker\Services\ITServiceInterface {
	public static function GO($Context) {
		$TKT = new \Itracker\Tkt ();
		$TKT->load_VEC ( array (
				"origen" => $Context->get_params ( "path" ) 
		) );
		
		// armar respuesta arbol
		$rta_tree = new ResponseElement ( 'tree' );
		/* Respuestas previas */
		$rta_previous = new ResponseElement ( 'previous' );
		
		$topts = $TKT->get_tree_options (); // primero cargar las opciones por si realiza movimiento
		$opts = $TKT->get_tree_history ();
		
		if ($opts) {
			foreach ( $opts as $o ) {
				$ans = $o ["ans"];
				if ($Context->getUser ()->get_prop ( "perfil" ) == 1) {
					$ans .= "/" . $o ["path"];
				}
				$rta_previous->addValue ( new ResponseElement ( 'option', array (
						new ResponseElement ( 'question', $o ["question"] ),
						new ResponseElement ( 'ans', $ans ) 
				) ) );
			}
		}
		
		$rta_previous->addValue ( new ResponseElement ( 'back', $topts ['back'] ) );
		$rta_previous->addValue ( new ResponseElement ( 'actual', $Context->get_params ( 'path' ) ) );
		
		$rta_tree->addValue ( $rta_previous );
		
		if ($topts ["object"] && $topts ["object"] instanceof \Itracker\Option) {
			if ($topts ["object"]->get_prop ( "itform" )) {
				$itform = $topts ["object"]->get_prop ( "itform" );
				$itfdom = $itform->getInputDom ();
				if ($itfdom) {
					$rta_tree->addValue ( new ResponseElement ( 'opendata', $itfdom,  ResponseElement::XML ) );
					
					if ($topts ["object"]->get_prop ( "unir" )) {
						$rta_tree->addValue ( new ResponseElement ( 'join', 'true' ) );
					}
				} else {
					$rta_tree->addValue ( new ResponseElement ( 'opendata', 
							new ResponseElement('msj','No se necesitan datos adicionales. Puedes generar el itracker.') ) );
				}
			}
			return $rta_tree;
		}
		/* Pregunta */
		$rta_question = new ResponseElement('question',array(
				new ResponseElement('title', $topts['title']),
				new ResponseElement('detail', $topts['detail'])
		));
		
		/* Opciones */
		$rta_option = new ResponseElement('options');
		foreach ( $topts ["options"] as $o ) {
			$rta_option->addValue(new ResponseElement('option',array(
					new ResponseElement('title',$o['title']),
					new ResponseElement('isnew',$o['isnew']),
					new ResponseElement('destiny',$o['destiny']),
					new ResponseElement('end',$o['end'])
			)));
		}
		
		$rta_tree->addValue( $rta_question );
		$rta_tree->addValue( $rta_option );
		return $rta_tree;
	}
}