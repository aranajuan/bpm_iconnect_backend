<?php
namespace Itracker;

/**
 * definicion de metodos para exportar a XML y obtener propiedades
 */
interface PropInterface {


    public function getXML();

    /**
     * Devuelve propiedad solicitada
     * <int>,<string>,<itobject>,<float>,array<type>,<date>,<time>
     * 
     * @param type $property
     * @return array<object> tipo
     */
    public function get_prop($property);

        /**
     * Busca propiedad, dos niveles
     * @param string $p
     * @param boolean $hideError ocultarPropnull
     * @return string
     */
    public function get_Subprop($p,$hideError=false);
    
    /**
     * Setea propiedad a valor
     * @param string $property
     * @param mixed $value
     */
    public function set_prop($property,$value);

}

?>
