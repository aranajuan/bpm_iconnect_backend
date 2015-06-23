<?php
namespace Itracker;

class Instance extends ITObject {

    private $nombre;
    private $archivos_externos;
    private $dbhost;
    private $dbuser;
    private $dbpass;
    private $dbroot;


    function __construct($conn = null) {
        $this->dbroot = new Utils\DB($this->getContext()->get_Connection(), true);
    }
    
    function load_DB($name) {
        $this->dbroot->loadRS("select * from TBL_INSTANCIAS where nombre='" . strToSQL($name) . "'");
        if ($this->dbroot->noEmpty && $this->dbroot->cReg == 1) {
            $tmpU = $this->dbroot->get_vector();
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
        $prefix = $this->getContext()->get_GlobalConfig()
                ->getString('database/prefix');
        return array(
            array("TBL_LISTIN", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."listines"),
            array("TBL_USUARIOS", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."usuarios"),
            array("TBL_SISDIR", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."sisdir"),
            array("TBL_SISTEMAS", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."sistemas"),
            array("TBL_ACCIONES", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."acciones"),
            array("TBL_PREGUNTAS", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."preguntas"),
            array("TBL_OPCIONES", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."opciones"),
            array("TBL_EQUIPOS", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."equipos"),
            array("TBL_DIRECCION", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."direccion"),
            array("TBL_TICKETS_M_DETALLES", "itracker_".$this->get_prop("nombre")."_tkt.".$prefix."tickets_m_detalles"),
            array("TBL_TICKETS_M", "itracker_".$this->get_prop("nombre")."_tkt.".$prefix."tickets_m"),
            array("TBL_TICKETS", "itracker_".$this->get_prop("nombre")."_tkt.".$prefix."tickets"),
            array("TBL_PERFILES_VISTAS", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."prefiles_vistas"),
            array("TBL_PERFILES", "itracker_".$this->get_prop("nombre")."_uta.".$prefix."perfiles"),
        );
    }

    /**
     * Devuelve propiedades
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'nombre':
                return $this->nombre;
            case 'archivos_externos':
                return $this->archivos_externos;
            case 'dbhost':
                return $this->dbhost;
            case 'dbuser':
                if($this->dbuser=='' || $this->dbuser==null)
                    return $this->getContext()->get_GlobalConfig()
                ->getString('database/user');
                return $this->dbuser;
            case 'dbpass':
                if($this->dbuser=='' || $this->dbuser==null)
                    return $this->getContext()->get_GlobalConfig()
                ->getString('database/pass');
                return $this->dbpass;
            default:
                return "Propiedad invalida.";
        }
    }

    /**
     * Devuelve ruta a la instancia
     * @return string Path a instancia
     */
    public function get_instancepath(){
        return "instances/".$this->get_prop("nombre");
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
