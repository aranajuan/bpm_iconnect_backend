<?php

namespace Itracker;


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
            $this->conn = $this->getContext()->get_Connection();
        }
        $this->dbinstance = new Utils\DB($this->conn, false);
        //prepara la clase de cache para acceso
        $this->objsCache= ObjectCache::getInstance();
    }

    /**
     * Devuelve contexto
     * @return Context
     */
    protected function getContext() {
        return Context::getContext();
    }

    /**
     * Usuario logueado
     * @return User
     */
    protected function getLogged() {
        return $this->getContext()->get_User();
    }

    /**
     * Insatncia logueada
     * @return Instance
     */
    protected function getInstance() {
        return $this->getContext()->get_Instance();
    }
    
}
