<?php

require_once 'classes/abstract/itobject.php';
require_once 'classes/db.php';

class INSTANCE extends itobject {

    private $nombre;
    private $archivos_externos;
    private $dbhost;
    private $dbuser;
    private $dbpass;

    /**
     *
     * @var DB
     */
    private $DBobj;

    function INSTANCE($conn) {
        $this->DBobj = new DB($conn, true);
    }

    /**
     * Carga desde base el nombre
     * @param type $nombre
     * @return string error/eliminado/ok
     */
    function load_DB($name) {
        $this->DBobj->loadRS("select * from TBL_INSTANCIAS where nombre='" . strToSQL($name) . "'");
        if ($this->DBobj->noEmpty && $this->DBobj->cReg == 1) {
            $tmpU = $this->DBobj->get_vector();
            return $this->load_DV($tmpU);
        }
        else
            $this->error = TRUE;
        return "error";
    }

    /**
     * Carga vector en propiedades
     * @param type $tmpU
     */
    public function load_VEC($tmpU) {
        $this->nombre = $tmpU["nombre"];
        $this->archivos_externos = $tmpU["archivos_externos"];
        $this->dbhost = $tmpU["dbhost"];
        $this->dbuser = $tmpU["dbuser"];
        $this->dbpass = $tmpU["dbpass"];
    }

    /**
     * Carga de base de datos a propiedades
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);
        return "ok";
    }

    /**
     * Alias para instancia
     * @return array
     */
    public function get_alias() {
        return array(
            array("TBL_LISTIN", "itracker_".$this->get_prop("nombre")."_uta.listines"),
            array("TBL_USUARIOS", "itracker_".$this->get_prop("nombre")."_uta.usuarios"),
            array("TBL_SISDIR", "itracker_".$this->get_prop("nombre")."_uta.sisdir"),
            array("TBL_SISTEMAS", "itracker_".$this->get_prop("nombre")."_uta.sistemas"),
            array("TBL_ACCIONES", "itracker_".$this->get_prop("nombre")."_uta.acciones"),
            array("TBL_PREGUNTAS", "itracker_".$this->get_prop("nombre")."_uta.preguntas"),
            array("TBL_OPCIONES", "itracker_".$this->get_prop("nombre")."_uta.opciones"),
            array("TBL_EQUIPOS", "itracker_".$this->get_prop("nombre")."_uta.equipos"),
            array("TBL_DIRECCION", "itracker_".$this->get_prop("nombre")."_uta.direccion"),
            array("TBL_TICKETS_M_DETALLES", "itracker_".$this->get_prop("nombre")."_tkt.tickets_m_detalles"),
            array("TBL_TICKETS_M", "itracker_".$this->get_prop("nombre")."_tkt.tickets_m"),
            array("TBL_TICKETS", "itracker_".$this->get_prop("nombre")."_tkt.tickets"),
            array("TBL_PERFILES_VISTAS", "itracker_".$this->get_prop("nombre")."_uta.prefiles_vistas"),
            array("TBL_PERFILES", "itracker_".$this->get_prop("nombre")."_uta.perfiles"),
        );
    }

    /**
     * Devuelve propiedades
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        switch ($property) {
            case 'nombre':
                return $this->nombre;
            case 'archivos_externos':
                return $this->archivos_externos;
            case 'dbhost':
                return $this->dbhost;
            case 'dbuser':
                return $this->dbuser;
            case 'dbpass':
                return $this->dbpass;
            default:
                return "Propiedad invalida.";
        }
    }

    public function check_data() {
        return "Funcion en desarrollo.";
    }

    public function delete_DB() {
        return "Funcion en desarrollo.";
    }

    public function insert_DB() {
        return "Funcion en desarrollo.";
    }

    public function update_DB() {
        return "Funcion en desarrollo.";
    }

}

?>
