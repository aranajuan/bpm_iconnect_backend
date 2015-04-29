<?php

/**
 * Clase para administrar listados de notificacion
 */
class LISTIN extends itobject {

    private $id; /* identificado del listado */
    private $nombre; /* nombre del listado */
    private $too; /* cadena para TO del mail */
    private $cc; /* cadena para CC del mail */
    private $estado; /* activo o inactivo */
    private $error = FALSE; /* error al cargar de la base */
    
    /**
     * Lista de listines activos
     * @return null|\LISTIN
     */
    function list_all() {
        $ssql = "select id from TBL_LISTIN where estado =" . I_ACTIVE;
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
        $this->dbinstance->loadRS("select * from TBL_LISTIN where id=".  intval($id));
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
     * Vector de propiedades editables
     * @param type $tmpU
     */
    function load_VEC($tmpU) {
        $this->nombre = trim($tmpU["nombre"]);
        $this->too = trim($tmpU["too"]);
        $this->cc = trim($tmpU["cc"]);
    }

    /**
     * Carga del vector a propiedades // valores unicos db
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
    }

    /**
     * Calida cadena de mails (separados ;)
     * @param type $mails
     * @return boolean
     */
    private function mail_validate($mails) {
        $mV = explode(MAIL_SPLITER, $mails);
        foreach ($mV as $m) {
            if (!filter_var(trim($m), FILTER_VALIDATE_EMAIL))
                return false;
        }
        return true;
    }

    /**
     * Verificar datos ingresados para db
     * @return string|null
     */
    function check_data() {
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero";
        if ($this->nombre == "")
            return "El campo Nombre es obligatorio";
        if ($this->too != "" && !$this->mail_validate($this->too))
            return "El campo TO no es una cadena de mail valida";
        if ($this->cc != "" && !$this->mail_validate($this->cc))
            return "El campo CC no es una cadena de mail valida";
        if ($this->estado == I_DELETED)
            return "Imposible modificar registro eliminado";
        return NULL;
    }

    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_LISTIN set nombre='" . strToSQL($this->nombre) . "', too='" . strToSQL($this->too) . "', cc='" . strToSQL($this->cc) . "' where id=".intval($this->id);
            if ($this->dbinstance->query($ssql))
                return "Listin_update: " . $this->dbinstance->details;
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
            $ssql = "insert into TBL_LISTIN (nombre,too,cc,estado) values ('" . strToSQL($this->nombre) . "','" . strToSQL($this->too) . "','" . strToSQL($this->cc) . "',0);";
            if ($this->dbinstance->query($ssql))
                return "Listin_insert: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }


    function delete_DB() {
        if ($this->estado == I_DELETED)
            return "El listin ya se encuentra eliminado";
        $ssql = "update TBL_LISTIN set estado=1 where id=".intval($this->id);
        if ($this->dbinstance->query($ssql))
            return "Listin_delete: >" . $this->dbinstance->details;
        else
            return "ok";
    }


    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'too':
                return $this->too;
            case 'cc':
                return $this->cc;
            default:
                return "Propiedad invalida.";
        }
    }

}

?>
