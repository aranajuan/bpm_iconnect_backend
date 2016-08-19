<?php

namespace Itracker;

use Itracker\Exceptions\ItException;
use Itracker\ResponseElement;

abstract class ITObject extends BasicObject implements PropInterface, DBObjectInterface {
	public function getData($props = null) {
		$cname = explode ( "\\", get_called_class () );
		$rta = new ResponseElement ( strtoupper ( $cname [count ( $cname ) - 1] ) );
		foreach ( $props as $p ) {
			$pv = $this->get_Subprop ( $p, true );
			$rta->addValue ( new ResponseElement ( $p, $pv, ResponseElement::$TEXT ) );
		}
		return $rta;
	}
	
	/**
	 * Busca propiedad, dos niveles
	 * 
	 * @param string $p        	
	 * @param boolean $hideError
	 *        	ocultarPropnull
	 * @return string | variant
	 */
	public function get_Subprop($p, $hideError = false) {
		$pparts = explode ( ".", $p );
		$i = 0;
		$cobj = $this;
		while ( 1 ) {
			$rta = $cobj->get_prop ( $pparts [$i] );
			if (isset ( $pparts [$i + 1] )) {
				if ($rta instanceof PropInterface) {
					$cobj = $rta;
				} else {
					/* Error */
					if ($hideError) {
						$pv = "";
					} else {
						throw new ItException ( 'prop/getprop' );
					}
					return $pv;
				}
			} else {
				return $rta;
			}
			$i ++;
		}
	}
	public function set_prop($property, $value) {
		throw new ItException ( 'prop/setprop' );
	}
}

?>
