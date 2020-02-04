<?php

namespace Itracker\Report;

class Request {

	/**
	 *
	 * @var array<Itracker\TktLister>
	 */
	private $tktsDB;

	/**
	 *
	 * @var String
	 */
	private $itjson;

	/**
	 * Acciones a traer historico
	 * @var array 
	 */
	private $actionRQ;

	/**
	 * Requiere datos de TKT
	 * @var boolean
	 */
	private $needtTKT;

	/**
	 *  Array ordenado segun solicitud
	 * @var array[$id]<Field>
	 */
	private $fields;

	/**
	 *
	 * @var array[$id][idtkt]<Value>
	 */
	private $values;

	/**
	 *
	 * @var string  Titulo del reporte 
	 */
	private $title;

	/**
	 * Alias para itform
	 * [label]=> [alias] = "xxx"
	 *           [type] = "type"
	 * @var array 
	 */
	private $itformAlias;

	public function __construct() {
		$this->actionRQ = array ();
		$this->fields = array ();
		$this->values = array ();
		$this->needtTKT = false;
		$this->itformAlias = array ();
	}

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	/**
	 *  Carga tickets a reportar
	 * @param Array<\Itracker\TktLister> $tktsDB
	 */
	public function loadTKTS($tktsDB) {
		$this->tktsDB = $tktsDB;
	}

	/**
	 *  Carga itsql, devuelve si es valido
	 * @param String $itsql
	 * @return boolean
	 */
	public function loadITJson($itjson) {
		$this->itjson = json_decode ( $itjson );
		if ( $this->itjson == null )
			return false;
		$this->loaditFormAlias ();
		return $this->loadFields ();
	}

	/**
	 * Carga alias para itform
	 */
	private function loaditFormAlias() {
		if ( !isset ( $this->itjson->itformalias ) )
			return false;
		$i = 0;
		foreach ( $this->itjson->itformalias as $itformalias ) {
			$label = strtoupper ( $itformalias->label );
			if ( isset ( $itformalias->alias ) )
				$this->itformAlias[$label]["alias"] = $itformalias->alias;
			if ( isset ( $itformalias->type ) )
				$this->itformAlias[$label]["type"] = $itformalias->type;
		}
	}

	/**
	 * Devuelve alias y tipe nuevos
	 * @param type $label
	 * @return array [alias,type]
	 */
	public function getitFormAlias($label) {
		return $this->itformAlias[strtoupper ( $label )];
	}

	/**
	 *  Genera campos, devuelve si es valido
	 * @return boolean
	 */
	private function loadFields() {
		if ( !isset ( $this->itjson->fields ) )
			return false;
		$ft = new Field();
		$ft->load ( json_decode (
				'
		{
			"action": "NC",
			"property": "NC",
			"modificator": "FST",
			"alias": "estado_r"
		}
		'
		) );
		$ft->setOrder ( 0 );
		$ft->setMax_cevents(1);
		$this->fields[0] = $ft;
		$i = 1;
		foreach ( $this->itjson->fields as $fields ) {
			$ft = new Field();
			if ( $ft->load ( $fields ) == false ) {
				return false;
			}

			$ft->setOrder ( $i );
			if ( in_array ( "TKT", $ft->getActionV () ) ) {
				$this->needtTKT = true;
			}
			if ( !in_array ( $ft->getAction (), $this->actionRQ ) )
				array_push ( $this->actionRQ, $ft->getAction () );
			$this->fields[$ft->getOrder ()] = $ft;
			$i++;
		}
		return true;
	}

	/**
	 *  Ejecuta reporte para los tickets cargados
	 */
	public function execute() {
		$itkt = 0;
		while ( 1 ) {
			try{
				$this->createTKTvalues ( $itkt );
				$tkt = $this->tktsDB->getObj ();
				if ( !$tkt )
					return;
				
				$this->addValues ( $itkt, $tkt );
				$this->values[0][$itkt]->addValue(
					array(
					    'title'=>'',
					    'type'=>'input',
					    'value'=>'ok'
					)
					);
			}  catch (\Exception $e){
				$this->values[0][$itkt]->addValue(
					array(
					    'title'=>'',
					    'type'=>'input',
					    'value'=>
						'TKTID::'.
						$this->tktsDB->getTktId($itkt).
						'::'.$e->getMessage()
					)
					);
			}
			$itkt++;
		}
	}

	/**
	 * Prepara todos los Value para el ticket
	 * @param int $itkt
	 */
	private function createTKTvalues($itkt) {
		foreach ( $this->fields as $pos => $field ) {
			$this->values[$pos][$itkt] = new Value();
		}
	}

	/**
	 * Carga hitorico necesario y genera value para cada evento
	 * @param int $itkt numero de ticket continuo
	 * @param \Itracker\Tkt $tkt
	 */
	private function addValues($itkt, $tkt) {
		if ( $this->needtTKT ) {
			$this->loadActionValues ( "TKT", $tkt, null, $itkt );
		}

		$THL = $tkt->get_tktHObj ( implode ( ",", $this->actionRQ ) );
		foreach ( $THL as $TH ) {
			$actName = $TH->get_prop ( "accion" )->get_prop ( "nombre" );
			$this->loadActionValues ( $actName, $tkt, $TH, $itkt );
		}
	}

	/**
	 * Carga todos los valores de la accion
	 * @param string $actionName
	 * @param \Itracker\Tkt $tkt
	 * @param \Itracker\TktH $th
	 * @param int $itkt
	 */
	private function loadActionValues($actionName, $tkt, $th, $itkt) {
		foreach ( $this->fields as &$field ) {
			if ( in_array ( $actionName, $field->getActionV () ) ) {
				$value = $this->values[$field->getOrder ()][$itkt];
				$field->loadValue ( $tkt, $th, $value );
			}
		}
	}

	/**
	 * Devuelve array de FIELD
	 * @return type
	 */
	public function getFields() {
		return $this->fields;
	}

	/**
	 *  Devuelve valores, misma ubicacion que fields
	 * @return type
	 */
	public function getValues() {
		return $this->values;
	}

}

?>
