<?php

require_once 'classes/itobject.php';

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
        $this->loadRS($ssql);
        if (!$this->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->get_vector()) {
            $list[$i] = new SYSTEM();
            $list[$i]->load_DB($idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($id) {
        $this->error = FALSE;
        $this->loadRS("select * from TBL_SISTEMAS where id=$id");
        if ($this->noEmpty && $this->cReg == 1) {
            $tmpU = $this->get_vector();
            $this->load_DV($tmpU);
            if ($this->estado == I_DELETED)
                return "eliminado";
            return "ok";
        }
        else
            $this->error = TRUE;
        return "error";
    }


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


    function check_data() {
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero";
        if ($this->nombre == "")
            return "El campo Nombre es obligatorio";

        if ($this->estado == I_DELETED)
            return "Imposible modificar registro eliminado";
        return NULL;
    }


    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_SISTEMAS set nombre='" . strToSQL($this->nombre) . "' where id=$this->id";
            if ($this->query($ssql))
                return "<b>Error:</b>" . $this->details;
            else
                return "ok";
        }
        else
            return $rta;
    }


    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_SISTEMAS(nombre,estado) values ('" . strToSQL($this->nombre) . "',0);";
            if ($this->query($ssql))
                return "<b>Error:</b>" . $this->details;
            else
                return "ok";
        }
        else
            return $rta;
    }


    function delete_DB() {
        if ($this->estado == I_DELETED)
            return "La direccion ya se encuentra eliminada";
        $ssql = "update TBL_SISTEMAS set estado=1 where id=$this->id";
        if ($this->query($ssql))
            return "<b>Error:</b>" . $this->details;
        else
            return "ok";
    }


    function get_prop($property) {
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
