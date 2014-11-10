<?php

require_once 'classes/interfaces/xmlpropinterface.php';
require_once 'classes/interfaces/dbobject.php';

abstract class itobject  implements XmlPropInterface, dbobject {

    /**
     *
     * @var ConnectionManager 
     */
    protected  $conn;
    
    /**
     *
     * @var DB 
     */
    protected  $dbinstance;
            
    function __construct($conn){
        $this->conn=$conn;
        $this->dbinstance = new DB($conn, false);
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

}

?>
