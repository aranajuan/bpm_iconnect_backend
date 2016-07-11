<?php

namespace Itracker;

abstract class ITObject extends BasicObject implements PropInterface, DBObjectInterface {

    /**
     * @param DOMdocument $doc Documento para crear elementos
     * @param array parametros de get_prop
     * @return DOMNode Objeto en XML
     */
    public function getXML($doc = null, $props = null) {
        if ($doc == null) {
            throw new \Exception('Metodo invalido getxml sin doc itobj');
        }
        $cname = explode("\\", get_called_class());
        $el = $doc->createElement(strtoupper($cname[count($cname) - 1]));
        foreach ($props as $p) {
            $pv = $this->get_Subprop($p, true);
            $el->appendChild($doc->createElement($p, $pv));
        }
        return $el;
    }

    /**
     * Busca propiedad, dos niveles
     * @param string $p
     * @param boolean $hideError ocultarPropnull
     * @return string | variant
     */
    public function get_Subprop($p, $hideError = false) {
        $pparts = explode(".", $p);
        $i = 0;
        $cobj = $this;
        while(1) {
            $rta = $cobj->get_prop($pparts[$i]);
            if (isset($pparts[$i + 1])) {
                if ($rta instanceof PropInterface) {
                    $cobj = $rta;
                } else {
                    /* Error */
                    if ($hideError) {
                        $pv = "";
                    } else {
                        $pv = "ERROR PROPIEDAD $p";
                    }
                    return $pv;
                }
            }else{
                return $rta;
            }
            $i++;
        }
    }

    public function set_prop($property, $value) {
        throw new \Exception('No se pueden setear propiedades en este objeto');
    }

}

?>
