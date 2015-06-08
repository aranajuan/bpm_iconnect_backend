<?php
namespace Itracker\Report;

class Value {

    /**
     * Valores de eventos
     * @var array<ValueData>
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

        $this->values[$this->event_count] = new ValueData($value);

        $this->event_count++;
        return $this->event_count;
    }

    public function getLastDataElCount(){
        return $this->values[$this->event_count-1]->getCount();
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

?>
