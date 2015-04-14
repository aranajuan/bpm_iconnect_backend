<?php

class REPORTVALUE {

    /**
     * Valores
     * @var array[$id][title | value]
     */
    private $values;

    /**
     * Cantidad
     * @var int 
     */
    private $count;

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
        $this->count = 0;
        $this->finished = false;
    }

    /**
     * Agregar valores
     * @param array $value  title | type | value
     * @return int  Cantidad de elementos
     */
    public function addValue($value) {
        $this->nextRcount();
        if ($this->getFinished()) {
            return false;
        }
        $valV = make_arrayobj($value);
        foreach ($valV as $vals) {
            if (!isset($vals["title"])) {
                $this->values[$this->count]["title"] = $this->count;
            } else {
                $this->values[$this->count]["title"] = $vals["title"];
            }
            $this->values[$this->count]["value"] = $vals["value"];
            if (isset($vals["type"])) {
                $this->values[$this->count]["type"] = $vals["type"];
            }
            $this->count++;
        }
        return $this->count;
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
    public function getCount() {
        return $this->count;
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

}

?>
