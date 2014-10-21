<?php

abstract class XMLhandler {

    private $input; // entrada en texto
    private $parse; // entrada parseada, objeto SimpleXMLElement
    private $error; // ultimo error
    private $error_origin;
    private $ip;    // ip de origen - front
    private $date;  // fecha de RQ - front
    private $response; // DOMdocument con respuesta
    private $usr;

    /**
     * Carga texto del xml
     * @param String $text
     * @param String $ipOr
     * @param Date $date
     * @return boolean se pudo cargar xml
     */
    protected function load_input($text, $ipOr, $date) {
        $this->response = new DOMDocument('1.0', 'UTF-8'); // prepara respuesta XML
        $this->prepare_response();
        $this->error = null;
        $this->input = $text;
        $this->ip = $ipOr;
        $this->date = $date;
        try {
            $this->parse = new SimpleXMLElement($text);
        } catch (Exception $e) {
            $this->error = $e->getMessage();
            $this->parse = null;
            $this->input = null;
            return false;
        }
        return $this->validXML_request();
    }

    /**
     * Prepara respuesta XML
     */
    private function prepare_response() {
        $xmlRoot = $this->response->createElement("itracker");
        $xmlRoot = $this->response->appendChild($xmlRoot);
        $header = $this->response->createElement("header");
        $xmlRoot->appendChild($header);
        $response_d = $this->response->createElement("response");
        $xmlRoot->appendChild($response_d);
    }

    /**
     * Valida header y request
     * Valida Accesos
     * @return boolean Description
     */
    private function validXML_request() {

        /* Validacion header */
        if (filter_var($this->ip, FILTER_VALIDATE_IP) == false) { //ip del front
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #1");
            return false;
        }
        if ($this->date == null || $this->date == "") {
            $this->set_error("xml_validation","Error en el origen de la solicitud - #2");
            return false;
        }
        if (!isset($this->parse->header)) {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #3");
            return false;
        }

        if (!isset($this->parse->header->usr) || $this->parse->header->usr=="") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #3.1");
            return false;
        }
        
        if (!isset($this->parse->header->instance) || $this->parse->header->instance=="") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #6.3");
            return false;
        }

        if (filter_var($this->parse->header->ip, FILTER_VALIDATE_IP) == false) { //ip del usuario
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #4");
            return false;
        }

        if ($this->parse->header->front == null || $this->parse->header->front == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #6");
            return false;
        }

        /* Validaciones request */

        if (!$this->parse->request) {
            $this->set_error("xml_validation","Error en el origen de la solicitud - #7");
            return false;
        }

        if ($this->parse->request->class == null || $this->parse->request->class == "") {
            $this->set_error("xml_validation","Error en el origen de la solicitud - #8");
            return false;
        }

        if ($this->parse->request->method == null || $this->parse->request->method == "") {
            $this->set_error("xml_validation","Error en el origen de la solicitud - #9");
            return false;
        }

        return true;
    }

    protected function set_error($origin,$msj){
        $this->error=$msj;
        $this->error_origin=$origin;
    }
    
    /**
     * devuelve Ip del front
     * @return string Ip
     */
    protected function getIpFront() {
        return $this->filter_param($this->ip);
    }
    
    /**
     * devuelve Ip del cliente
     * @return string Ip
     */
    public function getIp() {
        return $this->filter_param($this->parse->header->ip);
    }

    /**
     * Devuelve la instacia para solicitar archivos
     * @return string instance name
     */
    protected function getInstance() {
        return $this->filter_param($this->parse->header->instance);
    }
    
    /**
     * devuelve hash del usuario
     * @return string hash
     */
    protected function getHash() {
        return $this->filter_param($this->parse->header->hash);
    }
    /**
     * Devuelve front
     * @return FRONT
     */
    protected function getFrontName() {
        return $this->filter_param($this->parse->header->front);
    }

    /**
     * Devuelve usuario RQ
     * @return string
     */
    protected function getUser() {
        return $this->filter_param($this->parse->header->usr);
    }

   
    /**
     * agrega error al dom
     */
    private function add_error_response() {
        if ($this->error) {
            $resNodes = $this->response->getElementsByTagName("response");
            $resNode = $resNodes->item(0);
            $resNode->appendChild($this->get_responseDOM()->createElement("error", $this->error_origin."::".$this->error));
        }
    }

    /**
     * Devuelve el dom para crear elementos
     * @return DOMdocumment
     */
    public function get_responseDOM() {
        return $this->response;
    }

    /**
     * Respuesta del servicio
     * @return string
     */
    public function get_response() {
        $this->add_error_response();
        return $this->response->saveXML();
    }

    /**
     * devuelve array con parametros de XML filtrados
     */
    public function get_params($paramName, $parent = 'def') {
        if ($parent == 'def') {
            $obj = $this->parse->request->params->{$paramName};
        } else {
            $obj = $parent->{$paramName};
        }
        $cobj = $obj->children();

        if (count($cobj)) {
            $ret = array();
            foreach ($cobj as $key => $val) {
                $ret[$key] = $this->get_params($key, $obj);
            }
            return $ret;
        } else {
            return $this->filter_param($obj);
        }
    }

    protected function get_class(){
        return $this->filter_param($this->parse->request->class);
    }
    
    protected function get_method(){
        return $this->filter_param($this->parse->request->method);
    }
    
    /**
     * Devuelve parametro limpio de etiquetas XSS
     * @param string $param
     * @return string $param
     */
    private function filter_param($value) {
        return trim(strip_tags($value));
    }

}

?>
