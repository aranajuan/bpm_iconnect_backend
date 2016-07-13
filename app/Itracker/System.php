<?php

namespace Itracker;
use Itracker\Exceptions\ItException;
/**
 * Clase para cargar y manejar sistemas
 */
class System extends ITObject {

    private $id;   /* id del sistema */
    private $nombre; /* nombre del sistema */
    private $estado; /* estado, eliminado o no */

    /**
     * Lista los sistemas de la base
     * @return null|\System
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

        $this->dbinstance->loadRS("select * from TBL_SISTEMAS where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            return $this->estado;
        }
        throw new ItException('dbobject/load');
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
            throw new ItException('dbobject/checkdata', 'El id debe ser un numero entero');
        if ($this->nombre == "")
            throw new ItException('dbobject/checkdata', 'El campo Nombre es obligatorio');

        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'Imposible modificar registro eliminado');
    }

    /**
     * Actualiza en base de datos
     * @return string
     */
    function update_DB() {
        $this->check_data();
        $ssql = "update TBL_SISTEMAS set nombre='" . strToSQL($this->nombre) . "' where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    /**
     * Inserta sistemas
     * @return string
     */
    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        $this->check_data();
        $ssql = "insert into TBL_SISTEMAS(nombre,estado) values ('" . strToSQL($this->nombre) . "',0);";
        $this->dbinstance->query($ssql);
    }

    /**
     * Elimina de la base de datos
     * @return string
     */
    function delete_DB() {
        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'El sistema ya se encuentra eliminado');
        $ssql = "update TBL_SISTEMAS set estado=1 where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
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
                throw new ItException('prop/getprop');
        }
    }

}

?>
