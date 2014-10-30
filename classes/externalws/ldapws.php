<?php

include 'config/externalws/ldapws.php';

class LDAPWS {

    /**
     *
     * @var DOMDocument 
     */
    private $domRequest;

    /**
     *
     * @var SimpleXMLElement 
     */
    private $domResponse;
    private $error;

    /**
     * Crea execute y parametros de logueo
     * @return DOMElement
     */
    private function make_dom() {
        $this->domRequest = new DOMDocument('1.0', 'UTF-8');
        $main = $this->domRequest->createElement("execute");
        $attribute = $this->domRequest->createAttribute("authUser");
        $attribute->value = LDAP_IT_USER;
        $main->appendChild($attribute);
        $attribute = $this->domRequest->createAttribute("authPass");
        $attribute->value = LDAP_IT_PASS;
        $main->appendChild($attribute);
        return $main;
    }

    /**
     * Verifica credenciales de usuario
     * @param string $user
     * @param string $pass
     * @return array    status respose  description
     */
    public function check_user($user, $pass) {
        $main = $this->make_dom();
        $class = $this->domRequest->createElement("className", "UserController");
        $method = $this->domRequest->createElement("methodName", "authenticateUser");
        $params = $this->domRequest->createElement("parameters");
        $userP = $this->domRequest->createElement("parameter", $user);
        $passP = $this->domRequest->createElement("parameter", $pass);
        $params->appendChild($userP);
        $params->appendChild($passP);
        $main->appendChild($class);
        $main->appendChild($method);
        $main->appendChild($params);
        $this->domRequest->appendChild($main);
        if (!$this->send_request()) {
            return array("status" => "error", "description" => $this->error);
        }
        return array("status" => "ok", "response", $this->domResponse->asXML());
    }

    /**
     * Envio al servidor WS
     * @return boolean  parseo exitoso
     */
    private function send_request() {
        $requestTS = $this->domRequest->saveXML(null, LIBXML_NOEMPTYTAG);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, LDAP_DIR);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $requestTS);
        curl_setopt($ch, CURLOPT_POSTREDIR, 3);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, LDAP_TIMEOUT);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data = curl_exec($ch);
        if(curl_errno($ch)!=0){
            $this->error="Error en comunicacion con WS ".curl_errno($ch);
            return false;
        }
        curl_close($ch);
        return $this->parse_response($data);
    }

    /**
     * Parsea respuesta del servidor
     * @param string $data
     * @return boolean  parseo exitoso
     */
    private function parse_response($data) {
        try {
            $this->domResponse = new SimpleXMLElement($data);
            $this->error = null;
            return $this->check_error();
        } catch (Exception $e) {
            $this->error = $e->getMessage() . ";" . $data;
            $this->domResponse = null;
            return false;
        }
    }

    /**
     * Chequea excepcion del WS
     * @return boolean  false ->error
     */
    private function check_error() {
        if ($this->domResponse->message != null) {
            $this->error = "Error WS: " . $this->domResponse->message->asXML();
            return false;
        } 
        return true;
    }

}

