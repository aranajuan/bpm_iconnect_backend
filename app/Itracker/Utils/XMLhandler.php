<?php
namespace Itracker\Utils;

abstract class XMLhandler {

    private $input; // entrada en texto
    private $parse; // entrada parseada, objeto \SimpleXMLElement
    private $error; // ultimo error
    private $error_origin;
    private $ip;    // ip de origen - front
    private $date;  // fecha de RQ - front
    private $response; // DOMdocument con respuesta
    private $usr;

    /**
     * Log de acceso
     * @var array
     */
    private $logAccessArray;
    
    /**
     * Carga texto del xml
     * @param String $text
     * @param String $ipOr
     * @param Date $date
     * @return boolean se pudo cargar xml
     */
    protected function load_input($text, $ipOr, $date) {
        $this->response = new \DOMDocument('1.0', 'UTF-8'); // prepara respuesta XML
        $this->prepare_response();
        $this->logAccessArray=array();
        $this->error = null;
        $this->input = $text;
        $this->ip = $ipOr;
        $this->date = $date;
        try {
            $this->parse = new \SimpleXMLElement($text);
        }catch(\Exception $e) {
            if(($ipOr=="::1" || $ipOr=="127.0.0.1" ||
                    $ipOr==GlobalConfig::getInstance()->getString('serverip'))){
		if($_GET["text"]!=""){
                	echo \Encrypter::encrypt($_GET["text"]);
		}else{
			echo "<input type=\"text\" id=\"pass\" />";
			echo "<input type=\"button\" value=\"Cifrar\" onclick=\"location.href='?text='+encodeURIComponent(document.getElementById('pass').value)\" />";
		}
                \Itracker\Context::getContext()->finishScript();
                exit();
            }
            $this->getLogger()->notice("Se recibio XML invalido",array($text, $ipOr, $date,$e->getMessage()));
            $this->error = $e->getMessage();
            $this->parse = null;
            $this->input = null;
            return false;
        }
        return $this->validXML_request();
    }

    /**
     * Devuelve palin request
     * @return string
     */
    public function get_plainrequest() {
        return $this->input;
    }

    /**
     * Agrega al access log
     * @param string $tag
     * @param string $value
     */
    public function add_accessLog($tag,$value){
        if($value instanceof \SimpleXMLElement){
            $value = (string)$value;
        }
        $this->logAccessArray[$tag]= $value;
    }
    
    /**
     * Agrega al access log incrementando
     * @param string $tag
     * @param float $value  null para unset
     */
    public function add_incrementaccessLog($tag,$value){
        if($value === NULL){
            if(!isset($this->logAccessArray[$tag])){
                unset($this->logAccessArray[$tag]);
            }
            return;
        }
        if(!is_numeric($value)){
            throw new Exception('Valor invalido a log, se espera un numero '.$value);
        }
        if(!isset($this->logAccessArray[$tag])){
            $this->logAccessArray[$tag]= $value;
        }else{
            $this->logAccessArray[$tag]+= $value;
        }
    }
    
    /**
     * Devuelve json de log de acceso
     * @return string
     */
    public function get_accesslogJson(){
        return json_encode($this->logAccessArray);
    }
    
    /**
     * Prepara respuesta XML
     */
    private function prepare_response() {
        $xmlRoot = $this->createElement("itracker");
        $XMLIT = $this->response->appendChild($xmlRoot);
        $header = $this->createElement("header");
        $XMLIT->appendChild($header);

        $response_d = $this->createElement("response");
        $XMLIT->appendChild($response_d);
    }

    /**
     * Valida header y request
     * Valida Accesos
     * @return boolean Description
     */
    private function validXML_request() {

        /* Validacion header */
        $this->add_accessLog('front_ip', $this->ip);
        if (filter_var($this->ip, FILTER_VALIDATE_IP) == false) { //ip del front
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #1");
            return false;
        }
        
        $this->add_accessLog('date_rq',date(USERDATE_READ.':s', $this->date));
        if ($this->date == null || $this->date == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #2");
            return false;
        }
        if (!isset($this->parse->header)) {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #3");
            return false;
        }

        $this->add_accessLog('usr', $this->parse->header->usr);
        if (!isset($this->parse->header->usr) || $this->parse->header->usr == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #3.1");
            return false;
        }

        $this->add_accessLog('instance', $this->parse->header->instance);
        if (!isset($this->parse->header->instance) || $this->parse->header->instance == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #6.3");
            return false;
        }

        $this->add_accessLog('usr_ip', $this->parse->header->ip);
        if (filter_var($this->parse->header->ip, FILTER_VALIDATE_IP) == false) { //ip del usuario
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #4");
            return false;
        }

        $this->add_accessLog('front_name', $this->parse->header->front);
        if ($this->parse->header->front == null || $this->parse->header->front == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #6");
            return false;
        }

        /* Validaciones request */

        if (!$this->parse->request) {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #7");
            return false;
        }

        $this->add_accessLog('rq_class', $this->parse->request->class);
        if ($this->parse->request->class == null || $this->parse->request->class == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #8");
            return false;
        }

        $this->add_accessLog('rq_method',$this->parse->request->method);
        if ($this->parse->request->method == null || $this->parse->request->method == "") {
            $this->set_error("xml_validation", "Error en el origen de la solicitud - #9");
            return false;
        }

        return true;
    }

    protected function set_error($origin, $msj) {
        $this->error = $msj;
        $this->error_origin = $origin;
        $this->add_accessLog('error',$origin.'::'.$msj);
        $this->getLogger()->notice("Error al validar XML",array($origin, $msj));
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
     * @return \Itracker\Front
     */
    protected function getFrontName() {
        return $this->filter_param($this->parse->header->front);
    }

    /**
     * Devuelve usuario RQ
     * @return string
     */
    protected function getUser() {
        return strtoupper($this->filter_param($this->parse->header->usr));
    }

    /**
     * agrega error al dom
     */
    private function add_error_response() {
        if ($this->error) {
            $EL = $this->createElement("error", $this->error_origin . "::" . $this->error);
            $this->append_response($EL);
        }
    }

    /**
     * Agrega Elemento al response
     * @param \DOMElement $EL
     */
    public function append_response($EL) {
        $resNode = $this->get_responseTag();
        $resNode->appendChild($EL);
    }

    /**
     * Devuelve el tag response para escribir respuesta
     * @return \DOMElement Response tag
     */
    private function get_responseTag() {
        $resNodes = $this->response->getElementsByTagName("response");
        $resNode = $resNodes->item(0);
        return $resNode;
    }

    /**
     * Devuelve el dom para crear elementos
     * @return \DOMdocumment
     */
    private function get_responseDOM() {
        return $this->response;
    }

    /**
     * Crea elemento en dom
     * @param string $k
     * @param string $v
     * @param boolean $CDATA
     * @return \DOMElement
     */
    public function createElement($k, $v = null, $CDATA = false) {
        if ($v) {
            $domEl = $this->get_responseDOM()->createElement($this->make_param($k), $this->make_param($v, $CDATA));
        } else {
            $domEl = $this->get_responseDOM()->createElement($this->make_param($k));
        }
        if($domEl==null){
            $this->getLogger()->error("No se puede crear elemento en Dom",array($k,$v,$CDATA));
        }
        return $domEl;
    }

    /**
     * Crea elemento en dom sin verificar y en base64
     * @param type $k
     * @param type $v
     * @return \DOMElement
     */
    public function createElementSecure($k, $v){
        if($v==null or $v=='') return null;
        $val = base64_encode($v);
        if($val){
            return $this->get_responseDOM()->createElement($this->make_param($k), $val);
        }
        $this->getLogger()->error("No se puede crear elemento(64) en Dom",array($k));
        return null;
    }
    
    /**
     * Importa documento
     * @param \DOMDocument $dom
     * @return \DOMNode
     */
    public function append_xml($dom) {
        if ($dom == null) {
            return false;
        }
        $imported = $this->get_responseDOM()->importNode($dom, true);
        if($imported==null){
            $this->getLogger()->error("No se puede importar documento en Dom",array($dom->saveXML()));
        }
        return $imported;
    }

    /**
     * Respuesta del servicio
     * @return string
     */
    public function get_response() {
        $this->add_error_response();
        $this->add_accessLog('date_resp', date(USERDATE_READ.':s'));
        return $this->response->saveXML(null, LIBXML_NOEMPTYTAG);
    }

    /**
     * devuelve array con parametros de XML filtrados
     */
    public function get_params($paramName, $parent = 'def') {

        if ($parent == 'def') {
            if ($paramName === null) {
                $obj = $this->parse->request->params;
            } else {
                $obj = $this->parse->request->params->{$paramName};
            }
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

    protected function get_class() {
        return $this->filter_param($this->parse->request->class);
    }

    protected function get_method() {
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

    /**
     * Escapa caracteres del texto a enviar por xml
     * @param string $text
     * @param boolean $CDATA
     * @return string
     */
    private function make_param($text, $CDATA=false) {
        return trim(xmlEscape(strip_tags($text), $CDATA));
    }

    /**
     * Devuelve archivos enviados
     * @return  array   {{name,data},{name,data}}
     */
    public function get_files(){
        $files=array();
        if($this->parse->request->files){
            foreach($this->parse->request->files->children() as $f){
                array_push($files, array("name"=>$f->getName(),"data"=>$f));
            }
        }
        return $files;
        
    }
    
    /**
     * Devuelve cantidad de archivos adjuntos
     * @return int
     */
    public function get_files_count(){
        if($this->parse->request->files){
           return count($this->parse->request->files->children());
        }
        return 0;
    }


    /**
     * Devuelve instancia de Logger
     * @param \KLogger\Psr\Log\LogLevel $level
     * @return \KLogger\Logger
     */
    public function getLogger($level=null){
        return LoggerFactory::getLogger($level);
    }
    
    /**
     * String default para log
     * @return String
     */
    public function getLogString(){
        return $this->getUser()."\t";
    }
}

?>
