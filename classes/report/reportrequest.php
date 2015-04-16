<?php

include "reportfield.php";
include "reportvalue.php";

class REPORTREQUEST {

    /**
     *
     * @var array<TKT>
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
     *  optimizado para carga de datos
     * @var array[action][id]<FIELD>
     */
    private $fields_rqGroup;

    /**
     *  Array ordenado segun solicitud
     * @var array[$id]<FIELD>
     */
    private $fields;

    /**
     *
     * @var array[$id][idtkt]<VALUE>
     */
    private $values;

    public function __construct() {
        $this->actionRQ = array();
        $this->fields_rqGroup = array();
        $this->fields = array();
        $this->values = array();
    }

    /**
     *  Carga tickets a reportar
     * @param array<TKT> $tktsDB
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
        $this->itjson = json_decode($itjson);
        if ($this->itjson == null)
            return false;
        return $this->loadFields();
    }

    /**
     *  Genera campos, devuelve si es valido
     * @return boolean
     */
    private function loadFields() {
        if (!isset($this->itjson->fields))
            return false;
        $i = 0;
        foreach ($this->itjson->fields as $fields) {
            $ft = new REPORTFIELD();
            if ($ft->load($fields) == false) {
                return false;
            }

            $ft->setOrder($i);

            if (!in_array($ft->getAction(), $this->actionRQ))
                array_push($this->actionRQ, $ft->getAction());
            if (!isset($this->fields_rqGroup[$ft->getAction()]))
                $this->fields_rqGroup[$ft->getAction()] = array();
            array_push($this->fields_rqGroup[$ft->getAction()], $ft);
            $i++;
        }
        return true;
    }

    /**
     *  Ejecuta reporte para los tickets cargados
     */
    public function execute() {
        $itkt = 0;
        foreach ($this->tktsDB as $tkt) {
            $this->addValues($itkt, $tkt);
            $itkt++;
            if ($itkt > 5)
                return;
        }
        exit();
    }

    /**
     * Carga hitorico necesario y genera value para cada evento
     * @param int $itkt numero de ticket continuo
     * @param TKT $tkt
     */
    private function addValues($itkt, $tkt) {

        if (isset($this->fields_rqGroup["TKT"])) {
            $this->loadActionValues("TKT", $tkt, null, $itkt);
        }

        $THL = $tkt->get_tktHObj(implode(",", $this->actionRQ));
        foreach ($THL as $TH) {
            $actName = $TH->get_prop("accion")->get_prop("nombre");
            $this->loadActionValues($actName, $tkt, $TH, $itkt);
        }
        
    }

    /**
     * Carga todos los valores de la accion
     * @param string $actionName
     * @param TKT $tkt
     * @param TKT_H $th
     * @param int $itkt
     */
    private function loadActionValues($actionName, $tkt, $th, $itkt) {
        foreach ($this->fields_rqGroup[$actionName] as &$field) {
            if (!isset($this->values[$field->getOrder()][$itkt])) {
                $this->values[$field->getOrder()][$itkt] = new REPORTVALUE();
            }
            $value = $this->values[$field->getOrder()][$itkt];
            $field->loadValue($tkt, $th, $value);
            $this->fields[$field->getOrder()] = $field;
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
