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
     * 
     * @param XMLhandler $doc
     * @param array<string> $props
     * @return DOMElement
     */
    public function getXML($doc, $props) {
        $el = $doc->createElement(get_called_class());
        foreach ($props as $p) {
            $pparts = explode(".", $p);
            if (count($pparts) == 1) {
                 $pv=$this->get_prop($p);
            }else{
                $po=$this->get_prop($pparts[0]);
                if($po){
                    $pv=$po->get_prop($pparts[1]);
                }else{
                    $pv="";
                }
            }
            $el->appendChild($doc->createElement($p,$pv));
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
