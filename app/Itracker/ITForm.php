<?php

namespace Itracker;

/**
 * Formularios xml para datos itracker
 */
class ITForm implements XMLPropInterface {

    /**
     *
     * @var string
     */
    private $xml_input_text;

    /**
     *
     * @var \DOMDocument
     */
    private $xml_input;

    /**
     *
     * @var \DOMDocument
     */
    private $xml_output;

    /**
     *
     * @var \DOMXPath
     */
    private $xml_output_Xpath;

    /**
     *  Nivel de vista para el get_output
     * @var int 
     */
    private $view_level;

    /**
     * Proceso seleccionado para defaults
     * @var string
     */
    private $process;
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
            $this->xml_input = new \DOMDocument();
            $res = $this->xml_input->loadXML($this->xml_input_text);
            if (!$res) {
                Utils\LoggerFactory::getLogger()->error("No se pudo parsear XML", array($xml));
                return false;
            }
            $nodeList = $this->xml_input->getElementsByTagName("element");
            if ($nodeList->length == 0) {
                return false;
            }
            return true;
        } catch (\Exception $e) {
            $this->xml_input = null;
            Utils\LoggerFactory::getLogger()->error("No se pudo parsear XML", array($xml));
            return false;
        }
        return false;
    }

    /**
     * Prepara output clonado
     */
    public function loadOutput() {
        $this->xml_output = clone $this->xml_input;
        $this->xml_output_Xpath = new \DOMXPath($this->xml_output);
    }

    /**
     * Valida campo
     * @param array $element
     * @return string
     */
    private function check_values($element) {
        if (trim($element["value"]) != "" && $element["value"] != null) {
            switch ($element["type"]) {
                case "date":
                    if (STRdate_format($element["value"], USERDATE_READ_DATE, USERDATE_READ) == -1)
                        return "El campo " . $element["label"] . " debe ser una fecha.";
                    break;
                case "month":
                    if (STRdate_format($element["value"], USERDATE_READ_MONTH, USERDATE_READ) == -1)
                        return "El campo " . $element["label"] . " debe ser una fecha.";
                    break;
                case "datetime":
                    if (STRdate_format($element["value"], USERDATE_READ, USERDATE_READ) == -1)
                        return "El campo " . $element["label"] . " debe ser una fecha.";
                    break;
            }
        }

        if ($element["validations"] == null || count($element["validations"]) == 0) {
            return "ok";
        }
        foreach ($element["validations"] as $valName => $valValue) {
            switch ($valName) {
                case "numeric":
                    if ($valValue == "true" && !is_numeric($element["value"]) && !(trim($element["value"]) == "" || $element["value"] == null)) {
                        return "El campo " . $element["label"] . " debe ser numerico.";
                    }
                    break;
                case "required":
                    if ($valValue == "true" && (trim($element["value"]) == "" || $element["value"] == null)) {
                        return "El campo " . $element["label"] . " es obligatorio."; 
                    }
                    break;
                case "maxlen":
                    if (strlen($element["value"]) > $valValue) {
                        return "El campo " . $element["label"] . " es muy largo. Maximo " . $valValue . " caracteres";
                    }
                    break;
                case "minlen":
                    if (strlen($element["value"]) < $valValue) {
                        return "El campo " . $element["label"] . " es muy corto. Minimo " . $valValue . " caracteres";
                    }
                    break;
                case "regex":
                    $valid = preg_match($valValue, $element["value"], $newstr);
                    if (!$valid) {
                        return "El campo " . $element["label"] . " no cumple el formato solicitado.";
                    } elseif (is_array($newstr) && $newstr[0] != $element["value"]) {
                        return "El campo " . $element["label"] . " no cumple el formato solicitado. ¿Corresponde " . $newstr[0] . " ?";
                    }
                    break;
            }
        }
        return "ok";
    }

    /**
     * Devuelve hijos inmediatos *** SOLO HOTFIX ****
     * @param \DOMElement $element
     * @param type $tagName
     * @return array
     */
    private function getImmediateChildrenByTagName($element, $tagName) {
        $result = array();
        foreach ($element->childNodes as $child) {
            if ($child instanceof \DOMElement && $child->tagName == $tagName) {
                return $child;
            }
        }
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
     * Ejecuta busqueda en xpath
     * @param string $path
     * @param \DOMNode $relative
     * @return \DOMNodeList
     */
    private function queryEl($path, $relative = null) {
        if (!$this->xml_output) {
            return null;
        }
        return $this->xml_output_Xpath->query($path, $relative);
    }

    /**
     * Ejecuta busqueda en xpath y devuelve priemer elemento
     * @param string $path
     * @param mixed $default defecto si no hay elemento
     * @param \DOMNode $relative
     * @return string
     */
    private function getEl($path,$default=null, $relative = null){
        $elems = $this->queryEl($path, $relative);
        if($elems->length){
            return trim($elems->item(0)->nodeValue);
        }
        return $default;
    }
    /**
     * Busca elemento por valor de tag
     * @param string $tag
     * @param string $val
     * @return array<DOMElement>
     */
    private function findFieldsByTag($tag, $val) {
        if (!$this->xml_output) {
            return null;
        }
        $founds = array();
        $elements = $this->queryEl('/itform/element');
        foreach ($elements as $field) {
            $elemTags = $this->queryEl($tag, $field);
            if ($elemTags->length) {
                if ($val == '*' || strtolower(trim($elemTags->item(0)->nodeValue)
                        ) == strtolower(trim($val))) {
                    $founds[] = $field;
                }
            }
        }
        return $founds;
    }

    /**
     * Carga out valida campos
     * @param array $arr    Valores [id=>,value=>]
     * @param type $formname    nombre del form para id
     * @return string
     */
    public function load_values($arr, $formname = null) {
        $this->loadOutput();
        $arr = make_arrayobj($arr);
        $this->arr_val = $arr;
        $this->formname = $formname;
        $nodelist = $this->queryEl('/itform/element');
        foreach ($nodelist as $field) {
            $nfield = $this->elementToArray($field);
            $value = $this->getDefault($field);
            if ($value == null) {
                 $value =
                        trim($this->find_elementVal($arr, $nfield['id'], $formname));
            }
            $nfield['value'] = $value;
            $rta = $this->check_values($nfield);
            if ($rta != "ok") {
                return $rta;
            }
            $field->appendChild($this->xml_output->createElement('value', xmlEscape($value)));
        }
        return "ok";
    }

    /**
     * Devuelve value default
     * @param \DOMElement $element
     */
    private function getDefault($element) {
        $nfield = $this->elementToArray($element);
        $defaults = $this->queryEl('defaults', $element);
        if($defaults->length==0){
            return null;
        }
        $defaults_nodes = $defaults->item(0)
                ->childNodes;        
                
        foreach ($defaults_nodes as $default) {
            if ($default instanceof \DOMText) {
                continue;
            }
            $processDom = $this->queryEl('process', $default);
            $valueDom = $this->queryEl('value', $default);
            if ($valueDom->length != 0) {
                $value = $valueDom->item(0)->nodeValue;
            } else {
                Utils\LoggerFactory::getLogger()->warning(
                        'Defaults invalido en formulario no value', array('xml' => $this->xml_input_text));
            }

            if ($processDom->length != 0) {
                if (preg_match('/' . $processDom->item(0)->nodeValue . '/', $this->process)) {
                    return $value;
                }
            } else {
                return $value;
            }
        }
        Utils\LoggerFactory::getLogger()->warning(
                        'Defaults invalido', 
                             array('xml' => $this->xml_input_text,
                                 'process'=>$this->process));
    }

    /**
     * Carga todos los defaults
     * @return string
     */
    private function loadDefaults() {
        $elements = $this->findFieldsByTag('defaults', '*');
        foreach ($elements as $element) {
            $value = $this->getDefault($element);
            $element->appendChild(
                    $this->xml_output->createElement(
                            'value', $value
            ));
        }
        return 'ok';
    }

    /**
     * Convierte DOMElement a Array
     * @param DOMElement $element
     * @return array   campo
     */
    private function elementToArray($element) {
        $arr = array();
        $arr["id"] = $this->getEl('id', null,$element);
        $arr["label"] = $this->getEl('label', $arr["id"],$element);
        $arr["value"] =$this->getEl('value', null,$element);
        $arr["type"] = $this->getEl('type', null,$element);
        if ($arr["type"] == "select") {
            $options = $this->queryEl('option', $element);
            $arr["valuetxt"] = $arr["value"];
            foreach ($options as $opt) {
                if ($this->getEl('value', null,$opt) == trim($arr["value"])) {
                    $arr["valuetxt"] = $this->getEl('text', null,$opt);
                }
            }
        }

        $arr["validations"] = array();
        $validations = $this->queryEl('validations', $element)->item(0);
        if ($validations == null || !$validations->hasChildNodes()) {
            return $arr;
        } else {
            foreach ($validations->childNodes as $v) {
                $arr["validations"][trim($v->nodeName)] = trim($v->nodeValue);
            }
            return $arr;
        }
    }

    /**
     * Devuelve valor del form elegido
     * @param string $id
     * @return string
     */
    public function get_value($id) {
        $field = $this->findFieldsByTag('id', $id);
        if ($field) {
<<<<<<< HEAD
            return $this->getEl('value', null,$field[0]);
=======
            return $this->getImmediateChildrenByTagName($field, 'value')->nodeValue;
>>>>>>> master
        }
        return null;
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
        $field = $this->findFieldsByTag('id', $id);
        if ($field) {
<<<<<<< HEAD
            $val = $this->getEl('value', null,$field[0]);
            $field[0]->parentNode->removeChild($field[0]);
=======
            $val = $this->getImmediateChildrenByTagName($field, 'value')->nodeValue;
            $field->parentNode->removeChild($field);
>>>>>>> master
            return $val;
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
        foreach ($domElemsToRemove as $domElement) {
            $domElement->parentNode->removeChild($domElement);
        }

        $domElemsToBlock = $this->findFieldsByTag('view', '*');
        foreach ($domElemsToBlock as $domElement) {
            $vRQ = intval($domElement->nodeValue || 0);
            if ($vRQ != 0 && $this->view_level > $vRQ) {
                $domElement->nodeValue = "****";
            }
        }
    }

    /**
     * Devuelve el formulario de salida
     * @return \DOMDocument
     */
    public function get_outputDOM() {
        $this->prepareOutput();
        return $this->xml_output;
    }

    /**
     * Devuelve el formulario de entrada
     * Para uso interno
     * @return \DOMDocument
     */
    public function get_InputDOM() {
        return $this->xml_input;
    }

    /**
     * Devuelve el formulario de entrada para el usuario
     * @return \DOMDocument
     */
    public function get_UserInputDOM() {
        $this->loadOutput();
        /* Eliminar defaults */
        $nshow = $this->findFieldsByTag('defaults', '*');
        foreach ($nshow as $tdelete) {
            $tdelete->parentNode->removeChild($tdelete);
        }
        return $this->xml_output;
    }

    /**
     * Setea nivel de vista
     * @param int $view_level
     */
    public function set_view($view_level) {
        $this->view_level = $view_level;
    }

    /**
<<<<<<< HEAD
        $domElemsToRemove = $this->findFieldsByTag('notsave', 'true');
=======
        $tmp = clone $this->xml_output;
        $elements = $tmp->getElementsByTagName("element");
        $active = $elements->length;
        $domElemsToRemove = array();
        $domElemsToBlock = array();
        foreach ($elements as $field) {
            $nsave = $field->getElementsByTagName("notsave");
            if ($nsave->length && $nsave->item(0)->nodeValue == "true") {
                $domElemsToRemove[] = $field;
                $active--;
            } else {
                $viewL = $field->getElementsByTagName("view");
                if ($viewL->length) {
                    $vRQ = intval($viewL->item(0)->nodeValue || 0);
                    if ($vRQ != 0 && $this->view_level > $vRQ) {
                        $domElemsToBlock[] = $this->getImmediateChildrenByTagName($field, 'value');
                    }
                }
            }
        }
>>>>>>> master
     * Calcula tipo para reporte
     * @param array $arr    elementtoarray
     * @return string   nuevo tipo
     */
    private function getReportType($arr) {
        if ($arr["type"] == "input") {
            if (isset($arr["validations"]["numeric"]) &&
                    $arr["validations"]["numeric"] == "true") {
                return "number";
            }
            return "text";
        }
        return $arr["type"];
    }

    /**
     * Genera array con todos los valores de los campos
     * @return array
     */
    private function getArrReport() {
        $arr = array();
        $i = 0;
        $data = $this->get_outputDOM();
<<<<<<< HEAD
     * Setea proceso
     * @param int $view_level
     */
    public function set_process($process) {
        $this->process = $process;
    }

    /**
=======
>>>>>>> master
        $arrTitles = array();
        foreach ($els as $el) {
            $arr[$i] = $this->elementToArray($el);
            $arr[$i]["type"] = $this->getReportType($arr[$i]);
            $arr[$i]["title"] = $arr[$i]["label"];
            if (in_array($arr[$i]["title"], $arrTitles)) {
                $arr[$i]["title"].=$arr[$i]["id"];
            }
            array_push($arrTitles, $arr[$i]["title"]);
            if ($arr[$i]["type"] == "select") {
                $arr[$i]["type"] = "input";
                $arr[$i]["value"] = $arr[$i]["valuetxt"];
            }
            $i++;
        }
        return $arr;
    }

    public function get_prop($property) {
        $property = strtolower($property);
        if ($property == "*") {
            return $this->getArrReport();
        }

        $rta = $this->get_value($property);
        if ($rta) {
            return $rta;
        }
        return "Propiedad invalida.";
    }

    public function getXML($doc, $props) {
        return null;
    }

}
<<<<<<< HEAD
        $els = $this->queryEl('/itform/element');
=======
        $els = $data->getElementsByTagName("element");
>>>>>>> master
