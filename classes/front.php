<?php

require_once 'classes/abstract/itobject.php';
require_once 'classes/db.php';

class FRONT extends itobject {

    private $id;
    private $nombre;
    private $ip;
    private $confianza;
    private $instancias;
    private $instanciasV;
    private $estado;
    /**
     *
     * @var DB
     */
    private $DBobj;
    
    function  __construct($conn=null){
        parent::__construct($conn);
        $this->DBobj = new DB($this->conn, true);
    }
    
    /**
     * Lista todos los fronts
     * @return array<FRONT>
     */
    function list_all(){
        $ssql = "select nombre from TBL_FRONTS";
        $this->DBobj->loadRS($ssql);
        if (!$this->DBobj->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->DBobj->get_vector()) {
            $list[$i] = new FRONT($this->conn);
            $list[$i]->load_DB($idV[0]);
            $i++;
        }
        return $list;
    }
    
    /**
     * Carga desde base el nombre
     * @param type $nombre
     * @return string error/eliminado/ok
     */
    function load_DB($name) {
        $this->DBobj->loadRS("select * from TBL_FRONTS where nombre='" . strToSQL($name) . "'");
        if ($this->DBobj->noEmpty && $this->DBobj->cReg == 1) {
            $tmpU = $this->DBobj->get_vector();
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
     * Carga vector en propiedades
     * @param type $tmpU
     */
    public function load_VEC($tmpU) {
        $this->nombre = $tmpU["nombre"];
        $this->ip = $tmpU["ip"];
        $this->confianza = $tmpU["confianza"];
        $this->instancias = $tmpU["instancias"];
        $this->instanciasV = explode(",",$this->instancias);
    }

    /**
     * Es instancia valida para este front
     * @param string $instanceName
     * @return boolean
     */
    public function is_validInstance($instanceName){
        return in_array($instanceName, $this->instanciasV);
    }
    
    /**
     * Carga de base de datos a propiedades
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
        $this->load_VEC($tmpU);
    }

    /**
     * Es de confianza, no validar pass de usuario
     * @return boolean
     */
    public function is_trusted() {

        return $this->confianza > 0;
    }

    /**
     * Verifica la ip contra la lista habilitada
     * @return boolean la ip es valida para el front
     */
    public function validip($ip){
        $ips=explode(",",$this->get_prop("ip"));
        return in_array($ip, $ips);
    }
    
    /**
     * Devuelve propiedades
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'ip':
                return $this->ip;
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
