<?php

require_once 'classes/abstract/itobject.php';

/**
 * Clase para cargar y manejar sistemas
 */
class SYSTEM extends itobject {

    private $id;   /* id del sistema */
    private $nombre; /* nombre del sistema */
    private $estado; /* estado, eliminado o no */
    private $error = FALSE; /* error al cargar */

    /**
     * Lista los sistemas de la base
     * @return null|\SYSTEM
     */
    function list_all() {
        $ssql = "select id from TBL_SISTEMAS where estado =" . I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->dbinstance->get_vector()) {
            $list[$i] = $this->objsCache->get_object(get_class(), $idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_SISTEMAS where id=".  intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->estado == I_DELETED)
                return "eliminado";
            return "ok";
        }
        else
            $this->error = TRUE;
        return "error";
    }


    /**
     * Carga array de propiedades editables
     * @param string $tmpU
     */
    function load_VEC($tmpU) {
        $this->nombre = trim($tmpU["nombre"]);
    }

    /**
     * Carga vector en propiedades de DB, no cargadas por el usr
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
    }


    /**
     * Verifica datos para update / insert
     * @return string|null
     */
    function check_data() {
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero ->".$this->id;
        if ($this->nombre == "")
            return "El campo Nombre es obligatorio";

        if ($this->estado == I_DELETED)
            return "Imposible modificar registro eliminado";
        return NULL;
    }

    /**
     * Actualiza en base de datos
     * @return string
     */
    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_SISTEMAS set nombre='" . strToSQL($this->nombre) . "' where id=".intval($this->id);
            if ($this->dbinstance->query($ssql))
                return "System_update: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    /**
     * Inserta sistemas
     * @return string
     */
    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_SISTEMAS(nombre,estado) values ('" . strToSQL($this->nombre) . "',0);";
            if ($this->dbinstance->query($ssql))
                return "System_insert: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    /**
     * Elimina de la base de datos
     * @return string
     */
    function delete_DB() {
        if ($this->estado == I_DELETED)
            return "Els sistema ya se encuentra eliminado";
        $ssql = "update TBL_SISTEMAS set estado=1 where id=".intval($this->id);
        if ($this->dbinstance->query($ssql))
            return "<b>Error:</b>" . $this->dbinstance->details;
        else
            return "ok";
    }

    /**
     * Devuelve propiedad solicitada
     * @param string $property
     * @return string
     */
    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return $this->id;
            case 'nombre':
                return ucwords($this->nombre);
            default:
                return "Propiedad invalida.";
        }
    }

}

?>
