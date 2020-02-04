<?php

namespace Itracker;

/**
 * Clase para administrar listados de notificacion
 */
class Listin extends ITObject {

    private $id; /* identificado del listado */
    private $nombre; /* nombre del listado */
    private $too; /* cadena para TO del mail */
    private $cc; /* cadena para CC del mail */
    private $estado; /* activo o inactivo */

    /**
     * Lista de listines activos
     * @return null|\Listin
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
        $this->dbinstance->loadRS("select * from TBL_LISTIN where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            return $this->estado;
        } else {
            throw new ItException('dbobject/load');
        }
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
        $mV = explode(
                $this->getContext()->get_GlobalConfig()->getString('mail/splitter'), $mails);
        foreach ($mV as $m) {
            if (!filter_var(trim($m), FILTER_VALIDATE_EMAIL)) {
                $this->getContext()->getLogger()->notice("Mail invalido en listin", array($this->id, $m));
                return false;
            }
        }
        return true;
    }

    /**
     * Verificar datos ingresados para db
     * @return string|null
     */
    function check_data() {
        if (!is_numeric($this->id))
            throw new ItException('dbobject/checkdata', 'El id debe ser un numero entero');
        if ($this->nombre == "")
            throw new ItException('dbobject/checkdata', 'El campo Nombre es obligatorio');
        if ($this->too != "" && !$this->mail_validate($this->too))
            throw new ItException('dbobject/checkdata', 'El campo TO no es una cadena de mail valida');
        if ($this->cc != "" && !$this->mail_validate($this->cc))
            throw new ItException('dbobject/checkdata', 'El campo CC no es una cadena de mail valida');
        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'Imposible modificar registro eliminado');
    }

    function update_DB() {
        $this->check_data();
        $ssql = "update TBL_LISTIN set nombre='" . strToSQL($this->nombre) . "', too='" . strToSQL($this->too) . "', cc='" . strToSQL($this->cc) . "' where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        $this->check_data();
        $ssql = "insert into TBL_LISTIN (nombre,too,cc,estado) values ('" . strToSQL($this->nombre) . "','" . strToSQL($this->too) . "','" . strToSQL($this->cc) . "',0);";
        $this->dbinstance->query($ssql);
    }

    function delete_DB() {
        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'El listin ya se encuentra eliminado');
        $ssql = "update TBL_LISTIN set estado=1 where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
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
                throw new ItException('prop/getprop');
        }
    }

}

?>
