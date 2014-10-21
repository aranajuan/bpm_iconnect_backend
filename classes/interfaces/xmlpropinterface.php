<?php

/**
 * definicion de metodos para exportar a XML y obtener propiedades
 */
interface XmlPropInterface {

    /**
     * @param DOMdocument $doc Documento para crear elementos
     * @param array parametros de get_prop
     * @return DOMNode Objeto en XML
     */
    public function getXML($doc, $props);

    /**
     * Devuelve propiedad solicitada
     * <int>,<string>,<itobject>,<float>,array<type>,<date>,<time>
     * 
     * @param type $property
     * @return array<object> tipo
     */
    public function get_prop($property);


}

?>
