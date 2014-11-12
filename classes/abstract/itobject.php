<?php

require_once 'classes/interfaces/xmlpropinterface.php';
require_once 'classes/interfaces/dbobject.php';

abstract class itobject implements XmlPropInterface, dbobject {

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
        }else{
            $this->conn = $this->get_RH()->get_Connection();
        }
        $this->dbinstance = new DB($this->conn, false);
    }

    /**
     * Devuelve controlador
     * @return Rcontroller
     */
    protected function get_RH(){
        return $GLOBALS["RH"];
    }
    
    /**
     * 
     * @param XMLhandler $doc
     * @param array<string> $props
     * @return DOMElement
     */
    public function getXML($doc, $props) {
        $el = $doc->createElement(get_called_class());
        foreach ($props as $p) {
            $el->appendChild($doc->createElement($p, $this->get_prop($p)));
        }
        return $el;
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

?>
