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
     * @var DOMDocument
     */
    private $xml_input;

    /**
     *
     * @var DOMDocument
     */
    private $xml_output;

    /**
     *  Nivel de vista para el get_output
     * @var int 
     */
    private $view_level;
    private $arr_val;
    private $formname;

    /**
     * Carga xml y lo parsea
     * @param string $xml
     * @return boolean  se pudo cargar ok
     */
    public function load_xml($xml) {
        $this->set_view(0);
        $this->xml_input_text = $xml;
        try {
            $this->xml_input = new DOMDocument();
            $res = $this->xml_input->loadXML($this->xml_input_text);
            if (!$res) {
                return false;
            }
            $nodeList = $this->xml_input->getElementsByTagName("element");
            if ($nodeList->length == 0) {
                return false;
            }
            $this->xml_output = clone $this->xml_input;
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
     * @param DOMElement $field
     * @return string
     */
    private function check_values($value, $field) {
        $validations = $field->getElementsByTagName("validations")->item(0);
        $name = $field->getElementsByTagName("label")->item(0)->nodeValue;
        if ($validations == null || !$validations->hasChildNodes()) {
            return "ok";
        }
        $rta = "";
        foreach ($validations->childNodes as $v) {
            $validationV = $v->nodeValue;
            switch ($v->nodeName) {
                case "numeric":
                    if ($validationV == "true" && !is_numeric($value) && !(trim($value) == "" || $value == null)) {
                        return "El campo " . $name . " debe ser numerico.";
                    }
                    break;
                case "required":
                    if ($validationV == "true" && (trim($value) == "" || $value == null)) {
                        return "El campo " . $name . " es obligatorio.";
                    }
                    break;
                case "maxlen":
                    if (strlen($value) > $validationV) {
                        return "El campo " . $name . " es muy largo. Maximo " . $validationV . " caracteres";
                    }
                    break;
                case "minlen":
                    if (strlen($value) < $validationV) {
                        return "El campo " . $name . " es muy corto. Minimo " . $validationV . " caracteres";
                    }
                    break;
                case "regex":
                    $valid = preg_match($validationV, $value, $newstr);
                    if (!$valid) {
                        return "El campo " . $name . " no cumple el formato solicitado.";
                    } elseif (is_array($newstr) && $newstr[0] != $value) {
                        return "El campo " . $name . " no cumple el formato solicitado. ¿Corresponde " . $newstr[0] . " ?";
                    }
                    break;
            }
        }
        $validations->parentNode->removeChild($validations);
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
            $nid = $formname . "_" . trim($id);
        } else {
            $nid = $id;
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
        $arr = make_arrayobj($arr);
        $this->arr_val = $arr;
        $this->formname = $formname;
        $nodelist = $this->xml_output->getElementsByTagName("element");
        foreach ($nodelist as $field) {
            $value = trim($this->find_elementVal($arr, $field->getElementsByTagName("id")->item(0)->nodeValue, $formname));
            $rta = $this->check_values($value, $field);
            if ($rta != "ok") {
                return $rta;
            }
            $field->appendChild($this->xml_output->createElement("value", xmlEscape($value)));
        }
        return "ok";
    }

    /**
     * Devuelve valor del form elegido
     * @param string $id
     * @parama DOMDocument $dom
     * @return string
     */
    private function get_valueDOM($id, $dom) {
        if (!$dom) {
            return null;
        }
        $elements = $dom->getElementsByTagName("element");
        foreach ($elements as $field) {
            if (trim($field->getElementsByTagName("id")->item(0)->nodeValue) == trim($id)) {
                return $field->getElementsByTagName("value")->item(0)->nodeValue;
            }
        }
        return null;
    }

    /**
     * Devuelve valor del form / sin filtrar
     * @param string $id
     * @return string
     */
    public function get_value($id) {
        return $this->get_valueDOM($id, $this->xml_output);
    }
    
    /**
     * Devuelve valor del form / seguro
     * @param string $id
     * @return string
     */
    public function get_valueSecure($id) {
        return $this->get_valueDOM($id, $this->get_outputDOM());
    }

    /**
     * Devuelve valor del array de valores ingresado (aunque no este en form)
     * @param string $id
     * @return string
     */
    public function get_value_arr($id) {
        return trim($this->find_elementVal($this->arr_val, $id, $this->formname));
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
        $elements = $this->xml_output->getElementsByTagName("element");
        foreach ($elements as $field) {
            if ($field->getElementsByTagName("id")->item(0)->nodeValue == $id) {
                $val = $field->getElementsByTagName("value")->item(0)->nodeValue;
                $field->parentNode->removeChild($field);
                return $val;
            }
        }
        return null;
    }

    /**
     * Elimina los que tengan notsave
     * Bloquea vista
     */
    private function prepareOutput() {
        if (!$this->xml_output) {
            return null;
        }
        $tmp = clone $this->xml_output;
        $active = 0;
        $elements = $tmp->getElementsByTagName("element");
        $domElemsToRemove = array();
        $domElemsToBlock = array();
        foreach ($elements as $field) {
            $nsave = $field->getElementsByTagName("notsave");
            if ($nsave->length && $nsave->item(0)->nodeValue == "true") {
                $domElemsToRemove[] = $field;
                $active--;
            } else {
                $active++;
                $viewL = $field->getElementsByTagName("view");
                if ($viewL->length) {
                    $vRQ = intval($viewL->item(0)->nodeValue || 0);
                    if ($vRQ != 0 && $this->view_level > $vRQ) {
                        $domElemsToBlock[] = $field->getElementsByTagName("value")->item(0);
                    }
                }
            }
        }
        foreach ($domElemsToRemove as $domElement) {
            $domElement->parentNode->removeChild($domElement);
        }
        foreach ($domElemsToBlock as $domElement) {
            $domElement->nodeValue = "****";
        }
        if ($active < 1) {
            return null;
        }
        return $tmp;
    }

    /**
     * Devuelve el formulario de salida
     * @return string
     */
    public function get_output() {
        $opForm = $this->get_outputDOM();
        if ($opForm) {
            return $opForm->saveXML();
        }
        return null;
    }

    /**
     * Devuelve el formulario de salida
     * @return DOMDocument
     */
    public function get_outputDOM() {
        if ($this->xml_output) {
            $final = $this->prepareOutput();
            return $final;
        }
        return null;
    }

    /**
     * Devuelve el formulario de entrada
     * @return DOMDocument
     */
    public function get_inputDOM() {
        return $this->xml_input;
    }

    /**
     * Setea nivel de vista
     * @param int $view_level
     */
    public function set_view($view_level) {
        $this->view_level = $view_level;
    }

    public function get_prop($property) {

        $rta = $this->get_valueSecure($property);
        if($rta){
            return $rta;
        }
        return "Propiedad invalida.";
    }

}
