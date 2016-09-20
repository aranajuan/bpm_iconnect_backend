<?php

namespace Itracker\Utils;

class AccessLog {
	/**
	 * Log de acceso
	 * 
	 * @var array
	 */
	private $logAccessArray;
	
	/**
	 * Agrega al access log
	 * 
	 * @param string $tag        	
	 * @param string $value        	
	 */
	public function add($tag, $value) {
		$this->logAccessArray [$tag] = $value;
	}
	
	/**
	 * Agrega array a log
	 * @param array $array (tag=>value)
	 */
	public function addArray($array){
		foreach($array as $k=>$v){
			$this->add($k, $v);
		}
	}
	
	/**
	 * Agrega al access log incrementando
	 * 
	 * @param string $tag        	
	 * @param float $value
	 *        	null para unset
	 */
	public function addIncremental($tag, $value) {
		if ($value === NULL) {
			if (! isset ( $this->logAccessArray [$tag] )) {
				unset ( $this->logAccessArray [$tag] );
			}
			return;
		}
		if (! is_numeric ( $value )) {
			throw new \Exception ( 'Valor invalido a log, se espera un numero ' . $value );
		}
		if (! isset ( $this->logAccessArray [$tag] )) {
			$this->logAccessArray [$tag] = $value;
		} else {
			$this->logAccessArray [$tag] += $value;
		}
	}
	
	/**
	 * Devuelve json de log de acceso
	 * 
	 * @return string
	 */
	public function getJson() {
		return json_encode ( $this->logAccessArray );
	}
}