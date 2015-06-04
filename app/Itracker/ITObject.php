<?php

namespace Itracker;

abstract class ITObject extends BasicObject implements XMLPropInterface, DBObjectInterface {

    /**
     * 
     * @param Utils\XMLhandler $doc
     * @param array<string> $props
     * @return DOMElement
     */
    public function getXML($doc, $props) {
        $cname=  explode("\\",get_called_class());
        $el = $doc->createElement(strtoupper($cname[count($cname)-1]));
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
            if ($po instanceof XMLPropInterface) {
                $pv = $po->get_prop($pparts[1]);
            } else {
                $pv = "ERROR PROPIEDAD $p";
            }
        }
        return $pv;
    }

}

?>
