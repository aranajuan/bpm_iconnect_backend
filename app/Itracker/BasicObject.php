<?php

namespace Itracker;
use Itracker\Utils;

/*
 * Clase basica con conexion
 */
abstract class BasicObject {

    /**
     *
     * @var Utils\ConnectionManager
     */
    protected $conn;

    /**
     *
     * @var Utils\DB
     */
    protected $dbinstance;

     /**
     *
     * @var ObjectCache
     */
    protected $objsCache;
    
    function __construct($conn = null) {
        if ($conn) {
            $this->conn = $conn;
        } else {
            $this->conn = $this->get_RH()->get_Connection();
        }
        $this->dbinstance = new Utils\DB($this->conn, false);
        //prepara la clase de cache para acceso
        $this->objsCache= ObjectCache::getInstance();
    }

    /**
     * Devuelve controlador
     * @return \Itracker\RController
     */
    protected function get_RH() {
        return $GLOBALS["RH"];
    }

    /**
     * Usuario logueado
     * @return User
     */
    protected function getLogged() {
        return $this->get_RH()->get_User();
    }

    /**
     * Insatncia logueada
     * @return Instance
     */
    protected function getInstance() {
        return $this->get_RH()->get_Instance();
    }

}
