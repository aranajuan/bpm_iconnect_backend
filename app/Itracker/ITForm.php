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
     *  Nivel de vista para el get_output
     * @var int 
     */
    private $view_level;

    /**
     * Se puede guardar
     * @var boolean 
     */
    private $okToSave;

    /**
     * Array con el formulario
     * @var array
     */
    private $formArray;
    
     /**
     * Array con datos fuera del form solicitado
     * @var array
     */
    private $formArrayExt;

    /**
     * Cantidad de elementos que se deben guardar
     * @var int
     */
    private $elSaveCount;
    
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
            $this->loadOutput();
            return $this->loadXMLFormArray();
        } catch (\Exception $e) {
            $this->xml_input = null;
            Utils\LoggerFactory::getLogger()->error("No se pudo parsear XML", array($xml));
            return false;
        }
        return false;
    }

    /**
     * Clona xml input a output
     */
    private function loadOutput() {
        $this->okToSave = false;
        $this->xml_output = clone $this->xml_input;
    }

    /**
     * Devuelve hijos inmediatos
     * @param \DOMElement $element
     * @param type $tagName
     * @return \DOMElement|array
     */
    private function getImmediateChildrenByTagName($element, $tagName, $single = true) {
        $result = array();
        foreach ($element->childNodes as $child) {
            if ($child instanceof \DOMElement && $child->tagName == $tagName) {
                if ($single) {
                    return $child;
                } else {
                    array_push($result, $child);
                }
            }
        }
        if ($single) {
            return new \DOMElement('empty');
        } else {
            return $result;
        }
    }

    /**
     * Pasa el XML del formulario al array
     * @return boolean
     */
    private function loadXMLFormArray() {
        $this->formArray = array();
        $els = $this->xml_output->getElementsByTagName("element");
        $this->elSaveCount=0;
        foreach ($els as $el) {
            $arr = $this->elementToArray($el);
            if (isset($this->formArray[trim($arr['id'])])) {
                $this->xml_output = null;
                $this->formArray = null;
                Utils\LoggerFactory::getLogger()->error("Id duplicado en itform", array('xml' => $this->xml_input_text,
                    'id' => $arr['id'])
                );
                return false;
            }
            $this->formArray[trim($arr['id'])] = $arr;
            if($arr['notsave']!='true'){
                $this->elSaveCount++;
            }
        }
        return true;
    }

    /**
     * Convierte DOMElement a Array y guarda en arr_val
     * @param DOMElement $element
     * @return array   campo
     */
    private function elementToArray($element) {
        $arr = array();

        $arr["id"] = $this->getImmediateChildrenByTagName($element, 'id')->nodeValue;
        $label = $this->getImmediateChildrenByTagName($element, 'label')->nodeValue;
        if ($label != '') {
            $arr["label"] = $arr["id"];
        } else {
            $arr["label"] = trim($label);
        }
        $arr["value"] = trim($this->getImmediateChildrenByTagName($element, 'value')->nodeValue);
        $arr["notsave"] = trim($this->getImmediateChildrenByTagName($element, 'notsave')->nodeValue);
        $this->arr_val[$arr["id"]] = $arr["value"];
        $arr["type"] = trim($this->getImmediateChildrenByTagName($element, 'type')->nodeValue);
        if ($arr["type"] == "select") {
            $options = $this->getImmediateChildrenByTagName($element, 'option', false);
            $arr["valuetxt"] = $arr["value"];
            foreach ($options as $opt) {
                if (trim($this->getImmediateChildrenByTagName($opt, 'value')->nodeValue) == trim($arr["value"])) {
                    $arr["valuetxt"] = trim($this->getImmediateChildrenByTagName($opt, 'text')->nodeValue);
                }
            }
        }

        $arr["validations"] = array();
        $validations = $this->getImmediateChildrenByTagName($element, 'validations');
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
     * Carga valores de arr_val a XML de formulario
     * @return string
     */
    private function loadValtoXML() {
        $this->loadOutput();
        $this->okToSave = false;
        $nodelist = $this->xml_output->getElementsByTagName('element');
        foreach ($nodelist as $field) {
            $id = trim($this->getImmediateChildrenByTagName($field, 'id')->nodeValue);
            $rta = $this->check_values($this->formArray[$id]);
            if ($rta != "ok") {
                return $rta;
            }
            $field->appendChild($this->xml_output->createElement('value', xmlEscape($this->formArray[$id]['value'])));
        }
        $this->okToSave = true;
        return "ok";
    }

    /**
     * Carga array desde form
     * @param array $arr    Valores [id=>,value=>]
     * @param type $formname    nombre del form para id
     */
    public function load_values($arr, $formname = null) {
        $arr = make_arrayobj($arr);
        $prefix = '';
        if ($formname) {
            $prefix = $formname . '_';
        }
        foreach ($arr as $a) {
            $id=trim(str_replace($prefix, '', $a['id']));
            if(isset($this->formArray[$id])){
                $this->formArray[$id]['value'] = $a['value'];
            }else{
                $this->formArrayExt[$id]['value']=$a['value'];
            }
        }
        return $this->loadValtoXML();
    }

    /**
     * Devuelve valor del form elegido
     * @param string $id
     * @return string
     */
    private function get_value($id) {
        if (isset($this->formArray[$id]['value'])) {
            return $this->formArray[$id]['value'];
        }
        return null;
    }
    
    /**
     * Devuelve valor del form no solicitado en el XML
     * @param string $id
     * @return string
     */
    public function getExtravalue($id) {
        if (isset($this->formArrayExt[$id]['value'])) {
            return $this->formArrayExt[$id]['value'];
        }
        return null;
    }

    /**
     * Setea valor a elemento
     * @param string $id
     * @param string $value
     * @return string resultado
     */
    public function set_value($id, $value) {
        $this->formArray[$id]['value'] = $value;
        return $this->loadValtoXML();
    }

    /**
     * Setea nivel de vista
     * @param int $view_level
     */
    public function set_view($view_level) {
        $this->view_level = $view_level;
    }

    /**
     * Devuelve domdocument para guardar
     * @return \DOMDocument
     */
    public function getSaveDom() {
        if (!$this->okToSave) {
            return null;
        }
        $domElemsToRemove = $this->findFieldsByTag('notsave', 'true');
        foreach ($domElemsToRemove as $domElement) {
            $domElement->parentNode->removeChild($domElement);
        }
        return $this->xml_output;
    }

    /**
     * Devuelve array para reporte
     * @return array
     */
    public function getReportArr() {
        $arr_ret = array();
        $arrTitles = array();
        foreach ($this->formArray as $fa) {
            $nar = $fa;
            $nar["type"] = $this->getReportType($fa);
            $nar["title"] = $nar["label"];
            if (in_array($nar["title"], $arrTitles)) {
                $nar["title"].=$nar["id"];
            }
            array_push($arrTitles, $nar[$i]["title"]);
            if ($nar["type"] == "select") {
                $nar["type"] = "input";
                $nar["value"] = $nar["valuetxt"];
            }
            array_push($arr_ret, $nar);
        }
        return $arr_ret;
    }

    /**
     * Devuelve Dom para que el usuario complete
     * @return \DOMDocument
     */
    public function getInputDom() {
        return clone $this->xml_input;
    }

    /**
     * Para vista detalle
     * @return \DOMDocument
     */
    public function getViewDom() {
        $this->loadOutput();
        $domElemsToBlock = $this->findFieldsByTag('view', '*');
        foreach ($domElemsToBlock as $domElement) {
            $vRQ = intval($domElement->nodeValue || 0);
            if ($vRQ != 0 && $this->view_level > $vRQ) {
                $domElement->nodeValue = "****";
            }
        }
        return $this->xml_output;
    }

    /**
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
        $elements = $this->xml_output->getElementsByTagName("element");
        foreach ($elements as $field) {
            $elem = $this->getImmediateChildrenByTagName($field, $tag);
            if ($val == '*' || strtolower(trim($elem->nodeValue)
                    ) == strtolower(trim($val))) {
                $founds[] = $field;
            }
        }
        return $founds;
    }

    /**
     * Genera array con todos los valores de los campos
     * @return array
     */
    private function getArrReport() {
        $arr = array();
        $i = 0;
        $data = $this->get_outputDOM();
        $els = $data->getElementsByTagName("element");
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

    /**
     * Devuelve cantidad de elementos a guardar
     * @return int
     */
    public function getSaveElCount(){
        return $this->elSaveCount;
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

    public function getXML() {
        return $this->getInputDom();
    }

    public function get_Subprop($p, $hideError = false) {
        return $this->get_prop($p);
    }

    public function set_prop($property, $value) {
        $this->set_value($property, $value);
    }

}
