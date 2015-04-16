<?php

error_reporting(E_ALL);

class REPORTFIELD {

    private $json;
    private $max;
    private $order;
    private $modificator;

    public function __construct() {
        $this->max = 0;
    }

    /**
     * Divide texto del objeto [json]
     * @param type $fieldTXT
     */
    public function load($fieldJson) {
        $this->json = $fieldJson;
        $this->modificator = explode(",", $this->getModificator());
        return true;
    }

    /**
     * Agrega valor al value
     * @param TKT $tkt
     * @param TKT_H $th
     * @param REPORTVALUE $value
     */
    public function loadValue($tkt, $th, &$value) {

        if ($value->getFinished())
            return;

        if ($this->getAction() == "TKT") {
            $propval = $tkt->get_Subprop($this->getProperty());
        } else {
            $propval = $th->get_Subprop($this->getProperty());
        }

        if (!is_array($propval))
            $propval = array("value" => $propval);

        $this->setMax($this->addToValue($propval, $value));

        $value->nextRcount();
    }

    /**
     * Agrega valor segun modificador
     * @param type $propval
     * @param REPORTVALUE $value
     * @return int Posicion insertada
     */
    private function addToValue($propval, &$value) {
        if ($this->modificator[0] == "FST") {
            $pos = $value->addValue($propval);
            $value->setFinished();
        } else if ($this->modificator[0] == "LST") {
            $pos = $value->setValue($propval);
        } else if ($this->modificator[0] == "*") {
            $pos = $value->addValue($propval);
        } else {
            if (in_array($value->getRcount(), $this->modificator)) {
                $pos = $value->addValue($propval);
            } else {
                $pos = 0;
            }
        }
        return $pos;
    }

    public function setOrder($pos) {
        $this->order = $pos;
    }

    public function getOrder() {
        return $this->order;
    }

    private function setMax($val) {
        if ($val > $this->max) {
            $this->max = $val;
        }
    }

    public function getMax() {
        return $this->max;
    }

    /* configs de json */

    public function getAction() {
        return $this->json->action;
    }

    public function getProperty() {
        return $this->json->property;
    }

    public function getModificator() {
        if (isset($this->json->modificator))
            return $this->json->modificator;
        return "";
    }

    public function getType() {
        if (isset($this->json->type))
            return $this->json->type;
        return "";
    }

    public function getAlias() {
        return $this->json->alias;
    }

    /**
     * Compara similitud para alternar
     * @param REPORTFIELD $field
     * @return boolean
     */
    public function compare($field) {
        if ($this->getAction() == $field->getAction() &&
                $this->getMax() == $field->getMax()) {
            return true;
        }
        return false;
    }

}

?>
