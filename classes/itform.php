<?php

/**
 * Formularios xml para datos itracker
 */
class itform {

    /**
     *
     * @var string
     */
    private $xml_input_text;

    /**
     *
     * @var SimpleXMLElement
     */
    private $xml_input;

    /**
     *
     * @var SimpleXMLElement
     */
    private $xml_output;

    /**
     * Carga xml y lo parsea
     * @param string $xml
     * @return boolean  se pudo cargar ok
     */
    public function load_xml($xml) {
        $this->xml_input_text = $xml;
        try {
            $this->xml_input = new SimpleXMLElement($this->xml_input_text);
            if (!$this->xml_input->element) {
                return false;
            }
            return true;
        } catch (Exception $e) {
            $this->xml_input = null;
            return false;
        }
        return false;
    }

    /**
     * Valida campo
     * @param string $value
     * @param SimpleXMLElement $field
     * @return string
     */
    private function check_values($value, $field) {
        if ($field->validations == null) {
            return "ok";
        }
        $rta = "";
        foreach ($field->validations->children() as $v) {
            $validationV = strip_tags($v->asXML());
            switch ($v->getName()) {
                case "numeric":
                    if ($validationV == "true" && !is_numeric($value) && !(trim($value) == "" || $value == null)) {
                        return "El campo " . $field->label . " debe ser numerico.";
                    }
                    break;
                case "required":
                    if ($validationV == "true" && (trim($value) == "" || $value == null)) {
                        return "El campo " . $field->label . " es obligatorio.";
                    }
                    break;
                case "maxlen":
                    if (strlen($value) > $validationV) {
                        return "El campo " . $field->label . " es muy largo. Maximo " . $validationV . " caracteres";
                    }
                    break;
                case "minlen":
                    if (strlen($value) < $validationV) {
                        return "El campo " . $field->label . " es muy corto. Minimo " . $validationV . " caracteres";
                    }
                    break;
                case "regex":
                    $valid = preg_match($validationV, $value, $newstr);
                    if (!$valid) {
                        return "El campo " . $field->label . " no cumple el formato solicitado.";
                    } elseif (is_array($newstr) && $newstr[0] != $value) {
                        return "El campo " . $field->label . " no cumple el formato solicitado. ¿Corresponde " . $newstr[0] . " ?";
                    }
                    break;
            }
        }
        return "ok";
    }

    /**
     *  Busca valor en array por id
     * @param array $arr
     * @param string $id
     * @return string|null
     */
    private function find_elementVal($arr, $id, $formname) {
        if ($id == null) {
            return null;
        }
        if ($formname) {
            $nid = $formname . "_" . $id;
        }else{
            $nid=$id;
        }
        foreach ($arr as $a) {
            if (trim($a["id"]) == trim($nid)) {
                return $a["value"];
            }
        }
        return null;
    }

    /**
     * Carga out valida campos
     * @param array $arr    Valores [id=>,value=>]
     * @param type $formname    nombre del form para id
     * @return string
     */
    public function load_values($arr, $formname = null) {
        $this->xml_output = $this->xml_input;
        foreach ($this->xml_output->element as $field) {
            $value = trim($this->find_elementVal($arr, $field->id, $formname));
            $rta = $this->check_values($value, $field);
            if ($rta != "ok") {
                return $rta;
            }
            unset($field->validations);
            $field->addChild("value", $value);
        }
        return "ok";
    }

    /**
     * Devuelve valor del form
     * @param string $id
     * @return string
     */
    public function get_value($id) {
        if (!$this->xml_output) {
            return null;
        }
        foreach ($this->xml_output->element as $field) {
            if ($field->id == $id) {
                return $field->value->asXML();
            }
        }
        return null;
    }

    /**
     * Elimina elemento del formulario
     * @return boolean
     */
    public function delete_value($id) {
        if (!$this->xml_output) {
            return null;
        }
        $i = 0;
        foreach ($this->xml_output->element as $field) {
            if ($field->id == $id) {
                unset($this->xml_output->element[$i]);
            }
            $i++;
        }
        return null;
    }

    /**
     * Devuelve valor del form y lo elimina
     * @param string $id
     * @return string
     */
    public function getAnddelete($id) {
        if (!$this->xml_output) {
            return null;
        }
        $i = 0;
        foreach ($this->xml_output->element as $field) {
            if ($field->id == $id) {
                $value = $field->value->asXML();
                unset($this->xml_output->element[$i]);
                return $value;
            }
            $i++;
        }
        return null;
    }

    /**
     * Elimina los que tengan notsave
     */
    private function deleteNotSave() {
        if (!$this->xml_output) {
            return null;
        }
        $tmp = $this->xml_output;
        $i = 0;
        $delete = array();
        foreach ($this->xml_output->element as $field) {
            if (trim($field->notsave) == "true") {
                array_push($delete, $i);
            }
            $i++;
        }
        $back=0;
        foreach($delete as $p){
            error_log("Eliminado ".$tmp->element[$p-$back]->asXML());
            unset($tmp->element[$p-$back]);
            $back++;
        }
        
        return $tmp;
    }

    /**
     * Devuelve el formulario de salida
     * @return string
     */
    public function get_output() {
        if ($this->xml_output) {
            $final = $this->deleteNotSave();
            return $final->asXML();
        }
        return null;
    }

}
