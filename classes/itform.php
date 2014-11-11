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
            return true;
        } catch (Exception $e) {
            $this->xml_input=null;
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
    private function check_values($value,$field){
        if($field->validations==null){
            return "ok";
        }
        $rta="";
        foreach($field->validations->children() as $v){
            $validationV = strip_tags($v->asXML());
            switch($v->getName()){
                case "numeric":
                    if($validationV=="true" && !is_numeric($value) && !(trim($value)=="" || $value==null)){
                        return "El campo ".$field->label." debe ser numerico.";
                    }
                    break;
                case "required":
                    if($validationV=="true" && (trim($value)=="" || $value==null)){
                        return "El campo ".$field->label." es obligatorio.";
                    }
                    break;
                case "maxlen":
                    if(strlen($value)>$validationV){
                        return "El campo ".$field->label." es muy largo. Maximo ".$validationV." caracteres";
                    }
                    break;
                case "minlen":
                    if(strlen($value)<$validationV){
                        return "El campo ".$field->label." es muy corto. Minimo ".$validationV." caracteres";
                    } 
                    break;
                case "regex":
                    if(!preg_match($validationV,$value)){
                        return "El campo ".$field->label." no cumple el formato solicitado.";
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
    private function find_elementVal($arr,$id,$formname){
        if($id==null){
            return null;
        }
        foreach($arr as $a){
            if($a["id"]==$formname."_".$id){
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
    public function load_values($arr,$formname){
        $this->xml_output = $this->xml_input;
        foreach($this->xml_output->element as $field){
            $value=$this->find_elementVal($arr, $field->id,$formname);
            $rta=$this->check_values($value, $field);
            if($rta!="ok"){
                return $rta;
            }
            unset($field->validations);
            $field->addChild("value", $value);
        }
        return "ok";
        
    }

    
}
