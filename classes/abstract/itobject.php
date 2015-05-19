<?php

require_once 'classes/abstract/basicobject.php';
require_once 'classes/interfaces/xmlpropinterface.php';
require_once 'classes/interfaces/dbobject.php';

abstract class itobject extends basicobject implements XmlPropInterface, dbobject {

    /**
     * 
     * @param XMLhandler $doc
     * @param array<string> $props
     * @return DOMElement
     */
    public function getXML($doc, $props) {
        $el = $doc->createElement(get_called_class());
        foreach ($props as $p) {
            $pv=$this->get_Subprop($p);
            $el->appendChild($doc->createElement($p, $pv));
        }
        return $el;
    }

    
    /**
     * Busca propiedad, dos niveles
     * @param string $p
     * @return string
     */
    public function get_Subprop($p) {
        $pparts = explode(".", $p);
        if (count($pparts) == 1) {
            $pv = $this->get_prop($p);
        } else {
            $po = $this->get_prop($pparts[0]);
            if ($po instanceof XmlPropInterface) {
                $pv = $po->get_prop($pparts[1]);
            } else {
                $pv = "ERROR PROPIEDAD $p";
            }
        }
        return $pv;
    }

}

?>
