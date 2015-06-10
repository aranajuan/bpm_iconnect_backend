<?php

namespace ExternalWs;

class LdapWs {

    /**
     *
     * @var \DOMDocument 
     */
    private $domRequest;

    /**
     *
     * @var \SimpleXMLElement 
     */
    private $domResponse;
    
    private $responseTXT;
    
    private $error;

    /**
     *
     * @var \Itracker\Utils\Config 
     */
    private $configs;
    
    public function __construct() {
        $path=ROOT_DIR.DIRECTORY_SEPARATOR.'config'.
                DIRECTORY_SEPARATOR.'externalws'.
                DIRECTORY_SEPARATOR.'ldapws.xml';
        try{
            $this->configs = new \Itracker\Utils\Config($path);
        }  catch (Exception $e){
            \Itracker\Utils\LoggerFactory::getLogger()->error(
                    'Imposible cargar archivo de configuracion',
                    array('path'=>$path)
                    );
        }
    }

    /**
     * Crea execute y parametros de logueo
     * @return DOMElement
     */
    private function make_dom() {
        $this->domRequest = new \DOMDocument('1.0', 'UTF-8');
        $main = $this->domRequest->createElement("execute");
        $attribute = $this->domRequest->createAttribute("authUser");
        $attribute->value = $this->configs->getString('user');
        $main->appendChild($attribute);
        $attribute = $this->domRequest->createAttribute("authPass");
        $attribute->value = \Encrypter::decrypt(
                $this->configs->getString('pass')
                );
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
        return array("status" => "ok", "response"=> trim(strip_tags($this->domResponse->asXML())));
    }

    /**
     * Envio al servidor WS
     * @return boolean  parseo exitoso
     */
    private function send_request() {
        $requestTS = $this->domRequest->saveXML(null, LIBXML_NOEMPTYTAG);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->configs->getString('url'));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $requestTS);
        curl_setopt($ch, CURLOPT_POSTREDIR, 3);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT,
                $this->configs->getString('timeout'));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data = curl_exec($ch);
        if(curl_errno($ch)!=0){
            \Itracker\Utils\LoggerFactory::getLogger()->error("LDAP no responde",array(curl_errno($ch),$requestTS));
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
            $this->responseTXT=$data;
            $this->domResponse = new \SimpleXMLElement($data);
            $this->error = null;
            return $this->check_error();
        } catch (Exception $e) {
             \Itracker\Utils\LoggerFactory::getLogger()->error("LDAP error analizar respuesta #1",
                     array($e->getMessage(),$data,$this->error));
            $this->error = "Error en servicio al validar usuario";
            $this->domResponse = null;
            return false;
        }
    }

    /**
     * Chequea excepcion del WS
     * @return boolean  false ->error
     */
    private function check_error() {
        if ($this->domResponse->message->asXML() != null) {
            \Itracker\Utils\LoggerFactory::getLogger()->error("LDAP error analizar respuesta #2",
                     array($this->domResponse->asXML()));
            $this->error = "Error WS: " . $this->domResponse->message->asXML();
            return false;
        } 
        return true;
    }

}

