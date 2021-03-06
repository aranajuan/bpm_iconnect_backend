<?php

namespace Itracker;
use Itracker\Exceptions\ItFunctionalException;

class Front extends ITObject {

    private $id;
    private $nombre;
    private $ip;
    private $confianza;
    private $accesos;
    private $instancias;
    private $instanciasV;
    private $estado;

    /**
     *
     * @var DB
     */
    private $DBobj;

    function __construct($conn = null) {
        parent::__construct($conn);
        $this->DBobj = new Utils\DB($this->conn, true);
    }

    /**
     * Lista todos los fronts
     * @return array<Front>
     */
    function list_all() {
        $ssql = "select nombre from TBL_FRONTS where estado=" . I_ACTIVE;
        $this->DBobj->loadRS($ssql);
        if (!$this->DBobj->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->DBobj->get_vector()) {
            $list[$i] = $this->objsCache->get_object(get_class(), $idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($name) {
        $this->DBobj->loadRS("select * from TBL_FRONTS where nombre='" . strToSQL($name) . "'");
        if ($this->DBobj->noEmpty && $this->DBobj->cReg == 1) {
            $tmpU = $this->DBobj->get_vector();
            $this->load_DV($tmpU);
             return $this->estado;
        }
        throw new ItFunctionalException('dbobject/load');
    }

    /**
     * Carga vector en propiedades
     * @param type $tmpU
     */
    public function load_VEC($tmpU) {
        $this->nombre = $tmpU["nombre"];
        $this->ip = $tmpU["ip"];
        $this->confianza = $tmpU["confianza"];
        $this->accesos = $tmpU["accesos"];
        $this->instancias = $tmpU["instancias"];
        $this->instanciasV = explode(",", $this->instancias);
    }

    /**
     * Es instancia valida para este front
     * @param string $instanceName
     * @return boolean
     */
    public function is_validInstance($instanceName) {
        return in_array($instanceName, $this->instanciasV);
    }

    /**
     * Valida el acceso al metodo solicitado
     * @param type $class
     * @param type $method
     */
    public function validAction($class, $method) {
        if($this->accesos=='*'){
            return true;
        }
        $valid = explode(",", $this->accesos);
        foreach ($valid as $v) {
            $v = trim($v);
            if (strtolower($GLOBALS["access"][$v][1]) == $class && strtolower($GLOBALS["access"][$v][2]) == $method) {
                return false;
            }
        }
        return false;
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
    public function validip($ip) {
        $ips = explode(",", $this->get_prop("ip"));
        foreach ($ips as $ip_l) {
            $editedip = str_replace('.', '\\.', trim($ip_l));
            $editedip = str_replace('*', '[0-9]{1,3}', $editedip);
            if (preg_match('/^' . $editedip . '$/', $ip)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Devuelve propiedades
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'ip':
                return trim($this->ip);
            default:
                throw new ItFunctionalException('prop/getprop');
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
