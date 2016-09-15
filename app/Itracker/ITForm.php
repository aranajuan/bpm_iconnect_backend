<?php

namespace Itracker;

use Itracker\Exceptions\ItFunctionalException;

/**
 * Formularios xml para datos itracker
 */
class ITForm implements PropInterface {

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
     * id de TktH para copiar archivos
     * @var int
     */
    private $THfiles;

    /**
     * Cantidad de adjuntos
     * @var int
     */
    private $fileCount;

    /**
     * Carga xml y lo parsea
     * @param string $xml
     */
    public function load_xml($xml) {
        $this->set_view(0);
        $this->fileCount = 0;
        $this->xml_input_text = $xml;
        try {
            $this->xml_input = new \DOMDocument();
            $res = $this->xml_input->loadXML($this->xml_input_text);
            if (!$res) {
                throw new ItFunctionalException('itf/load', '', 'No se pudo parsear XML', array($xml));
            }
            $nodeList = $this->xml_input->getElementsByTagName("element");
            $this->loadOutput();
            $this->loadXMLFormArray();
        }catch(ItFunctionalException $e){
            throw $e;
        }catch (\Exception $e) {
            $this->xml_input = null;
            throw new ItFunctionalException('itf/load', '',  'No se pudo parsear XML', array($xml));
        }
        
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
        $this->elSaveCount = 0;
        foreach ($els as $el) {
            $arr = $this->elementToArray($el);
            if (isset($this->formArray[trim($arr['id'])])) {
                $this->xml_output = null;
                $this->formArray = null;
                throw new ItFunctionalException('itf/load','Error en formulario', 
                        'Id duplicado en itform',
			array('xml' => $this->xml_input_text,
                    'id' => $arr['id']));
            }
            $this->formArray[trim($arr['id'])] = $arr;
            if ($arr['notsave'] != 'true') {
                $this->elSaveCount++;
            }
        }
        $els = $this->xml_output->getElementsByTagName("filelnk");
        if ($els->length) {
            $this->THfiles = $els->item(0)->getElementsByTagName('idth')->item(0)->nodeValue;
        }
    }

    /**
     * Devuelve array del input
     * @return array XML con values en array
     */
    public function getFormArray() {
        return $this->formArray;
    }

    /**
     * Devuelve array del input
     * @return array XML con values en array con indice numerico
     */
    public function getFormArrayLoad() {
        $tmp = array();
        $i = 0;
        foreach ($this->formArray as $el) {
            $tmp[$i] = $el;
            $i++;
        }
        return $tmp;
    }

    /**
     * Convierte DOMElement a Array y guarda en arr_val
     * @param DOMElement $element
     * @return array   campo
     */
    private function elementToArray($element) {
        $arr = array();

        $arr["id"] = $this->getImmediateChildrenByTagName($element, 'id')->nodeValue;
        $label = trim($this->getImmediateChildrenByTagName($element, 'label')->nodeValue);
        if ($label == '') {
            $arr["label"] = $arr["id"];
        } else {
            $arr["label"] = $label;
        }
        $arr["value"] = trim($this->getImmediateChildrenByTagName($element, 'value')->nodeValue);
        $arr["view"] = trim($this->getImmediateChildrenByTagName($element, 'view')->nodeValue);
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
        } else {
            $arr["valuetxt"] = $arr["value"];
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
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " debe ser una fecha.");
                    break;
                case "month":
                    if (STRdate_format($element["value"], USERDATE_READ_MONTH, USERDATE_READ) == -1)
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " debe ser una fecha.");
                    break;
                case "datetime":
                    if (STRdate_format($element["value"], USERDATE_READ, USERDATE_READ) == -1)
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " debe ser una fecha.");
                    break;
            }
        }

        if ($element["validations"] == null || count($element["validations"]) == 0) {
            return;
        }

        if ($element["type"] == "fileupl") {
            $element["value"] = $this->fileCount;
        }

        foreach ($element["validations"] as $valName => $valValue) {
            $notempty = !(trim($element["value"]) == "" || $element["value"] == null);
            switch ($valName) {
                case "numeric":
                    if ($valValue == "true" && !is_numeric($element["value"]) && $notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " debe ser numerico (Punto separador decimal).");
                    }
                    break;
                case "required":
                    if ($valValue == "true" && !$notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " es obligatorio.");
                    }
                    break;
                case "maxlen":
                    if (strlen($element["value"]) > $valValue && $notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " es muy largo. Maximo " . $valValue . " caracteres");
                    }
                    break;
                case "minlen":
                    if (strlen($element["value"]) < $valValue && $notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " es muy corto. Minimo " . $valValue . " caracteres");
                    }
                    break;
                case "max":
                    if ($element["value"] > $valValue && $notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " es mayor al solicitado. Maximo " . $valValue);
                    }
                    break;
                case "min":
                    if ($element["value"] < $valValue && $notempty) {
                        throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " es menor al requerido. Minimo " . $valValue);
                    }
                    break;
                case "regex":
                    if ($notempty) {
                        $valid = preg_match($valValue, $element["value"], $newstr);
                        if (!$valid) {
                            throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " no cumple el formato solicitado.");
                        } elseif (is_array($newstr) && $newstr[0] != $element["value"]) {
                            throw new ItFunctionalException('itf/value',"El campo " . $element["label"] . " no cumple el formato solicitado. ¿Corresponde " . $newstr[0] . " ?");
                        }
                    }
                    break;
            }
        }
    }

    /**
     * Carga valores de arr_val a XML de formulario
     */
    private function loadValtoXML() {
        $this->loadOutput();
        $nodelist = $this->xml_output->getElementsByTagName('element');
        foreach ($nodelist as $field) {
            $id = trim($this->getImmediateChildrenByTagName($field, 'id')->nodeValue);
            $this->check_values($this->formArray[$id]);
            $list = $this->getImmediateChildrenByTagName($field, 'value', false);
            if (count($list)) {
                $field->removeChild($list[0]);
            }
            $field->appendChild($this->xml_output->createElement('value', htmlspecialchars($this->formArray[$id]['value'],ENT_XML1)));
        }
        if ($this->THfiles) {
            $fileLnk = $this->xml_output->createElement('filelnk');
            $fileLnk->appendChild($this->xml_output->createElement('idth', $this->THfiles));
            $this->xml_output->firstChild->appendChild(
                    $fileLnk
            );
        }
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
        foreach ($this->formArray as &$el) {
            $el['value'] = '';
        }
        foreach ($arr as $a) {
            $id = trim(str_replace($prefix, '', $a['id']));
            if (is_array($a['value'])) {
                throw new ItFunctionalException('itf/value','El formulario contiene informacion invalida en:' . $id);
            }
            if (isset($this->formArray[$id])) {
                $this->formArray[$id]['value'] = $a['value'];
            } else {
                $this->formArrayExt[$id]['value'] = $a['value'];
            }
        }
        $this->loadValtoXML();
    }

    /**
     * Agrega link para archivos
     * @param TktH $TH
     */
    public function addFileLinkTh($TH) {
        if ($TH) {
            $this->THfiles = $TH->get_prop('id');
        } else {
            $this->THfiles = 0;
        }
    }

    /**
     * Id de TH adjunto para archivos
     * @return int
     */
    public function getFileLinkTh() {
        return $this->THfiles;
    }

    /**
     * Setear candtidad de adjuntos
     * @param int $cant
     */
    public function setFileCount($cant) {
        $this->fileCount = $cant;
    }

    /**
     * Devuelve valor del form elegido
     * @param string $id
     * @param boolean $text extraer en texto    default:false
     * @return string
     */
    private function get_value($id, $text = false) {
        if (isset($this->formArray[$id]['value'])) {
            if ($text) {
                return $this->formArray[$id]['valuetxt'];
            }
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
     */
    public function set_value($id, $value) {
        $this->formArray[$id]['value'] = $value;
        $this->loadValtoXML();
    }

    /**
     * Setea nivel de vista
     * @param int $view_level
     */
    public function set_view($view_level) {
        $this->view_level = $view_level;
    }

    /**
     * Clona out en in
     */
    public function setOutToIn() {
        $this->xml_input = clone $this->xml_output;
    }

    /**
     * Devuelve domdocument para guardar
     * @return \DOMDocument
     */
    public function getSaveDom() {
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
            $vRQ = intval($nar['view'] || 0);
            if ($vRQ != 0 && $this->view_level > $vRQ) {
                $nar["value"] = "****";
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
        $data = $this->getViewDom();
        $els = $data->getElementsByTagName("element");
        $arrTitles = array();
        foreach ($els as $el) {
            $arr[$i] = $this->elementToArray($el);
            if ($arr[$i]["type"] == "select") {
                $arr[$i]["type"] = "input";
            }
            $arr[$i]["type"] = $this->getReportType($arr[$i]);
            $arr[$i]["title"] = $arr[$i]["label"];
            if (in_array($arr[$i]["title"], $arrTitles)) {
                $arr[$i]["title"].=$arr[$i]["id"];
            }
            array_push($arrTitles, $arr[$i]["title"]);

            $arr[$i]["value"] = $arr[$i]["valuetxt"];
            $i++;
        }
        return $arr;
    }

    /**
     * Devuelve cantidad de elementos a guardar
     * @return int
     */
    public function getSaveElCount() {
        return $this->elSaveCount;
    }

    public function get_prop($property) {
        $property = strtolower($property);
        $text = false;
        if (substr($property, 0, 6) == '(text)') {
            $property = substr($property, 6, strlen($property));
            $text = true;
        }
        if ($property == "*") {
            return $this->getArrReport();
        }
        $rta = $this->get_value($property, $text);
        if ($rta) {
            return $rta;
        }
        throw new ItFunctionalException('prop/getprop');
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

	public function getData($props = null) {
		
	}

}
