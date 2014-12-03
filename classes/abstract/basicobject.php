<?php

/*
 * Clase basica con conexion
 */
abstract class basicobject {

    /**
     *
     * @var ConnectionManager 
     */
    protected $conn;

    /**
     *
     * @var DB 
     */
    protected $dbinstance;

    function __construct($conn = null) {
        if ($conn) {
            $this->conn = $conn;
        } else {
            $this->conn = $this->get_RH()->get_Connection();
        }
        $this->dbinstance = new DB($this->conn, false);
    }

    /**
     * Devuelve controlador
     * @return Rcontroller
     */
    protected function get_RH() {
        return $GLOBALS["RH"];
    }

    /**
     * Usuario logueado
     * @return USER
     */
    protected function getLogged() {
        return $this->get_RH()->get_User();
    }

    /**
     * Insatncia logueada
     * @return INSTANCE
     */
    protected function getInstance() {
        return $this->get_RH()->get_Instance();
    }

}
