<?php

class REPORTVALUE {

    /**
     * Valores de eventos
     * @var array<REPORTVALUEDATA>
     */
    private $values;

    /**
     * Cantidad de eventos
     * @var int 
     */
    private $event_count;

    /**
     * No insertar mas registros
     * @var boolean 
     */
    private $finished;

    /**
     * Cuenta real no insertados
     * @var int 
     */
    private $rcount;

    public function __construct() {
        $this->rcount = 0;
        $this->inicialize();
    }

    private function inicialize() {
        $this->values = array();
        $this->event_count = 0;
        $this->finished = false;
    }

    /**
     * Agregar valores
     * @param array $value  title | type | value
     * @return int  Cantidad de eventos
     */
    public function addValue($value) {
        if ($this->getFinished()) {
            return false;
        }
        
        $this->values[$this->event_count] = new REPORTVALUEDATA($value);
        
        $this->event_count++;
        return $this->event_count;
    }

    public function nextRcount() {
        $this->rcount++;
    }

    public function getRcount() {
        return $this->rcount;
    }

    public function setValue($value) {
        $this->inicialize();
        return $this->addValue($value);
    }

    /**
     * Cantidad
     * @return int  Cantidad de elementos
     */
    public function getEvent_Count() {
        return $this->event_count;
    }

    public function setFinished() {
        $this->finished = true;
    }

    public function clearFinished() {
        $this->finished = false;
    }

    public function getFinished() {
        return $this->finished;
    }

    public function getValues() {
        return $this->values;
    }

}


class REPORTVALUEDATA{
    
    private $data;
    
    public function __construct($value) {
        $this->data=array();
        if(!is_array($value)){
            $this->data[0]["title"]="0";
            $this->data[0]["value"]=$value;
            $this->data[0]["type"]="";
        }else{
            $nval = make_arrayobj($value);
            $i=0;
            foreach ($nval as $val){
                if(!isset($val["title"])){
                    $this->data[$i]["title"]=$i;
                }else{
                    $this->data[$i]["title"]=$val["title"];
                }
                if(!isset($val["type"])){
                    $this->data[$i]["type"]="";
                }else{
                    $this->data[$i]["type"]=$val["type"];
                }
                if(!is_array($val)){
                    $this->data[$i]["value"]=$val;
                }else{
                    $this->data[$i]["value"]=$val["value"];
                }
                $i++;
            }
        }
    }
    
    public function getData(){
        return $this->data;
    }
    
    public function getCount(){
        return count($this->data);
    }
}
?>
