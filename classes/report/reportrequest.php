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
     *
     * @var array[action]<FIELD>
     */
    private $fields;

    /**
     *
     * @var array[action][row]<VALUE>
     */
    private $values;

    public function __construct() {
        $this->actionRQ= array();
        $this->fields=array();
        $this->values=array();
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
            if(!isset($this->fields[$ft->getAction()])) $this->fields[$ft->getAction()]=array();
            array_push($this->fields[$ft->getAction()], $ft);
            $i++;
        }
        return true;
    }

    public function execute() {    
        $itkt = 0;
        foreach ($this->tktsDB as $tkt) {
            $this->addValues($itkt, $tkt);
            $itkt++;
            if($itkt>5) return;
        }
    }

    private function addValues($itkt, $tkt) {
        
        if(isset($this->fields["TKT"])){
            $i=0;
            foreach($this->fields["TKT"] as &$field){
                if(!isset($this->values["TKT"][$i][$itkt])){
                    $this->values["TKT"][$i][$itkt] = new REPORTVALUE();
                }
                $value = $this->values["TKT"][$i][$itkt];
                $field->loadValue($tkt,null,$value);
                $i++;
            }
        }
        
        $THL = $tkt->get_tktHObj(implode(",", $this->actionRQ));
        foreach ($THL as $TH) {
            $i = 0;
            $actName = $TH->get_prop("accion")->get_prop("nombre");
            foreach ($this->fields[$actName] as &$field) {
                if(!isset($this->values[$actName][$i][$itkt])){
                    $this->values[$actName][$i][$itkt] = new REPORTVALUE();
                }
                $value = $this->values[$actName][$i][$itkt];
                $field->loadValue($tkt, $TH, $value);
                $i++;
            }
        }
    }

}
?>
