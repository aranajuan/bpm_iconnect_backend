<?php

namespace Itracker;

class TktLister extends BasicObject {
	private $resultids;
	private $posRead;
	private $ssql;
	
	/**
	 * Filtros precargados
	 * 
	 * @var TKTFILTER
	 */
	private $filter;
	
	/* EJECUCION */
	
	/**
	 * Carga filtro
	 * 
	 * @param TktFilter $filter        	
	 */
	public function loadFilter($filter) {
		$this->filter = $filter;
	}
	
	/**
	 * Ejecuta filtro
	 */
	public function execute() {
		$this->filter->makeSQL ();
		$ssql = $this->filter->getSQL ();
		$this->posRead = 0;
		$this->ssql = $ssql;
		$this->executeSQL ();
	}
	
	
	/**
	 * Ejecuta SQL carga IDS y objetos
	 */
	private function executeSQL() {
		$retArr = array ();
		$this->dbinstance->loadRS ( $this->ssql );
		while ( $tid = $this->dbinstance->get_vector () ) {
			array_push ( $retArr, $tid ["id"] );
		}
		$this->resultids = $retArr;
	}
	
	/**
	 * Cantidad de tickets filtrados
	 * 
	 * @return int
	 */
	public function getCount() {
		return count ( $this->resultids );
	}
	
	/**
	 * Lista de tickets filtrados
	 * 
	 * @return TKT
	 */
	public function getObj() {
		$id = $this->resultids [$this->posRead];
		$this->posRead ++;
		if ($this->posRead > $this->getCount ()) {
			return null;
		}
		$T = $this->objsCache->get_object ( "Tkt", $id );
		$this->objsCache->clean_object ( "Tkt", $id );
		if ($this->getContext ()->getUser ()->get_view ( $T ) != null) {
			return $T;
		}
	}
	
	/**
	 * Devuelve el id de la posicion solicitada
	 * @param int $order
	 * @return int
	 */
	public function getTktId($order){
		return $this->resultids [$order];
	}
}