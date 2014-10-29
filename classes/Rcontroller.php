<?php

include 'abstract/XMLhandler.php';

include 'connectionmanager.php';
include 'instance.php';
include 'front.php';
include 'user.php';

/**
 * Maneja todo el requerimiento del front
 */
class Rcontroller extends XMLhandler {

    /**
     * usuario logueado 
     * @var USER
     */
    private $user;

    /**
     * Front conectado
     * @var FRONT
     */
    private $front;

    /**
     * administrador de conexiones
     * @var ConectionManager 
     */
    private $conections; // 

    /**
     *
     * @var INSTANCE
     */
    private $instance;
    
    private $error;

    /**
     * Prepara conexiones a db, carga input, valida datos
     * @param type $text 
     * @param type $ipOr ip del front
     * @param type $date
     * @return boolean
     */
    public function request($text, $ipOr, $date) {
        if (!$this->load_input($text, $ipOr, $date)) {
            return false;
        }

        $this->conections = new ConnectionManager();
        if ($this->conections->connect_root(DBSERVER_ALL, DBHOST_ROOT, DBUSER_ROOT, DBPASS_ROOT, $GLOBALS["tables_root"]) == false) {
            $this->set_error("conection", "no se puede conectar a la base de datos.");
            return false;
        }

        if (!$this->load_instance()) {
            $this->set_error("load_instance", "no se puede cargar la instancia.");
            return false;
        }

        if ($this->conections->connect_instance($this->instance->get_prop("dbhost"), $this->instance->get_prop("dbuser"), $this->instance->get_prop("dbpass"), $this->instance->get_alias()) == false) {
            $this->set_error("conection", "no se puede conectar a la base de datos de la instancia.");
            return false;
        }

        if (!$this->load_front()) {
            $this->set_error("front", $this->error);
            return false;
        }

        if (!$this->validate_request()) {
            $this->set_error("validation", $this->error);
            return false;
        }

        if (!$this->ejectute_request()) {
            $this->set_error("ejecution", $this->error);
            return false;
        }
    }

    /**
     * Valida objetos y acceso de usuario
     * @return boolean
     */
    private function validate_request() {
        if ($this->front->get_prop("ip") != $this->getIpFront()) {    // no coincide ip del front con el nombrado
            $this->error = "Error en el origen de la solicitud - #6.2" . $this->getIpFront();
            return false;
        }
        if (!$this->front->is_validInstance($this->instance->get_prop("nombre"))) {
            $this->error = "Error en el origen de la solicitud - #6.3";
            return false;
        }

        if (!$this->load_user()) {
            return false;
        }

        if ($this->get_class() == "user" && $this->get_method() == "login") {
            return true;
        }

        if (!$this->user->logged($this->getHash(), $this->front, $this->getIp())) {
            $this->error = "Usuario no logeado";
        }

        if (!$this->user->validAction($this->get_class(), $this->get_method())) {
            $this->error = "Sin acceso";
            return false;
        }
        return true;
    }

    /**
     * Carga objeto usuario
     * @return boolean
     */
    private function load_user() {
        $U = new USER($this->conections);
        $rta = $U->load_DB($this->getUser());
        if ($rta != "ok") {
            $this->error = "Usuario o contrase&ntilde;a ivalidos";
            return false;
        }

        if (!$U->check_instance($this->instance->get_prop("nombre"))) {
            $this->error = "Instancia invalida";
            return false;
        }

        if (!$U->check_front($this->front->get_prop("id"))) {
            $this->error = "Front invalido.";
            return false;
        }

        $this->user = $U;
        return true;
    }

    /**
     * Carga objeto instancia
     * @return boolean
     */
    private function load_instance() {
        $I = new INSTANCE($this->conections);
        if ($I->load_DB($this->getInstance()) != "ok") {
            $this->instance = null;
            return false;
        }
        //verificar si existe carpeta
        $this->instance = $I;
        return true;
    }

    /**
     * Carga objeto front
     * @return boolean
     */
    private function load_front() {
        //validar usuario - front - acceso del usr a funcion
        $front = new FRONT($this->conections);
        if ($front->load_DB($this->getFrontName()) != "ok") {
            $this->error = "Error en el origen de la solicitud - #6.1";
            return false;
        }
        $this->front = $front;
        return true;
    }

    /**
     * Ejecuta GO agrega a response
     */
    private function ejectute_request() {
        include 'services/' . strtolower($this->get_class()) . "/" . strtolower($this->get_method()) . ".php";
        $ret = GO($this);
        if ($ret) {
            $this->append_response($ret);
        }
    }

    
    /**
     * Devuelve usuario que ejecuta
     * @return USER
     */
    public function get_User(){
        return $this->user;
    }
    
    /**
     * Devuelve FRONT que ejecuta
     * @return FRONT
     */
    public function get_Front(){
        return $this->front;
    }
    
    /**
     * Devuelve conexiones establecidas
     * @return ConnectionManager
     */
    public function get_Connection(){
        return $this->conections;
    }
    
    /**
     * Devuelve instancia solicitada
     * @return INSTANCE
     */
    public function get_Instance(){
        return $this->instance;
    }
    
}

?>
