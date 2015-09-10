<?php

namespace Itracker;

abstract class ITObject extends BasicObject implements XMLPropInterface, DBObjectInterface {

    /**
     * @param DOMdocument $doc Documento para crear elementos
     * @param array parametros de get_prop
     * @return DOMNode Objeto en XML
     */
    public function getXML($doc=null, $props=null) {
        if($doc==null){
            throw new \Exception('Metodo invalido getxml sin doc itobj');
        }
        $cname=  explode("\\",get_called_class());
        $el = $doc->createElement(strtoupper($cname[count($cname)-1]));
        foreach ($props as $p) {
            $pv=$this->get_Subprop($p,true);
            $el->appendChild($doc->createElement($p, $pv));
        }
        return $el;
    }

    
    /**
     * Busca propiedad, dos niveles
     * @param string $p
     * @param boolean $hideError ocultarPropnull
     * @return string
     */
    public function get_Subprop($p,$hideError=false) {
        $pparts = explode(".", $p);
        if (count($pparts) == 1) {
            $pv = $this->get_prop($p);
        } else {
            $po = $this->get_prop($pparts[0]);
            if ($po instanceof XMLPropInterface) {
                $pv = $po->get_prop($pparts[1]);
            } else {
                if($hideError){
                    $pv="";
                }else{
                    $pv = "ERROR PROPIEDAD $p";
                }
            }
        }
        return $pv;
    }

    public function set_prop($property, $value) {
        throw new \Exception('No se pueden setear propiedades en este objeto');
    }

}

?>
