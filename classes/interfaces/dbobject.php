<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author u548391
 */
interface dbobject {
    
     /**
     * Carga datos desde DB
     * @param string $ID
     * @return string
     */
    public function load_DB($id);

    /**
     * Carga datos a propiedades
     * @param array $tmpU
     * @return type
     */
    public function load_VEC($tmpU);

    /**
     * Verifica datos para dar alta o update
     * @return string|null
     */
    public function check_data();

    /**
     * Actualiza datos en base
     * @return string
     */
    public function update_DB();

    /**
     * Insertar en la tabla usuario
     * @return string
     */
    public function insert_DB();
    
    /**
     * Elimina de la base de datos
     * @return string
     */
    public function delete_DB();
}

?>
