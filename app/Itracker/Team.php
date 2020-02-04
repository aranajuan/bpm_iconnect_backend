<?php

namespace Itracker;
use Itracker\Exceptions\ItFunctionalException;
/**
 * Clase para administrar los equipos
 */
class Team extends ITObject {

    private $id;   /* id del equipo */
    private $nombre;   /* nombre del equipo */
    private $t_conformidad; /* tiempo de conformidad luego de solucionado HH:MM */
    private $idlistin; /* id del listin para notificaciones */
    private $listin;   /* objeto listin */
    private $iddireccion;  /* id de la direccion a la que pertenece */
    private $direccion;     /* objeto direccion */
    private $idsequiposderiva; /* equipos a los que puede derivar por fuera del arbol */
    private $equiposderiva; /* equipos a los que puede derivar por fuera del arbol */
    private $idsequiposvisible; /* equipos de los cuales puede ver los tickets sin relacion */
    private $idsequiposreporta; /* equipos de los cuales puede ver como propios */
    private $equiposvisible; /* equipos de los cuales puede ver los tickets sin relacion */
    private $mytkts_vista;  /* vista para tabla de mytkts */
    private $staffhome_vista; /* vista para tabla staff home */
    private $estado;   /* activo / inactivo */
    private $adms = null; /* array de usuarios adms */
    private $idsadmsV = null;

    /**
     * Listar equipos
     * @param string $derive    null|notnull
     * @return null|\Team
     */
    function list_all($derive = "") {

        $condderive = "";

        if ($derive === "null") {
            $condderive = " idequipos_deriva is null and ";
        } elseif ($derive === "notnull") {
            $condderive = " idequipos_deriva is not null and ";
        }

        $ssql = "select id from TBL_EQUIPOS where $condderive estado =" . I_ACTIVE;
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
        $this->dbinstance->loadRS("select * from TBL_EQUIPOS where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            return $this->estado;
        }
        throw new ItFunctionalException('dbobject/load');
    }

    /**
     * Cargar datos de base a propiedades
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
    }

    function load_VEC($tmpU) {
        $this->nombre = trim($tmpU["nombre"]);
        $this->idlistin = trim($tmpU["idlistin"]);
        $this->t_conformidad = trim($tmpU["t_conformidad"]);
        $this->iddireccion = trim($tmpU["iddireccion"]);
        $this->idsequiposderiva = trim($tmpU["idsequipos_deriva"]);
        $this->idsequiposvisible = trim($tmpU["idsequipos_visible"]);
        $this->idsequiposreporta = trim($tmpU["idsequipos_reporta"]);
        $this->mytkts_vista = trim($tmpU["mytkts_vista"]);
        $this->staffhome_vista = trim($tmpU["staffhome_vista"]);
        $this->direccion = null;
        $this->listin = null;
        $this->equiposderiva = null;
        $this->equiposvisible = null;
    }

    /**
     * Carga usuarios administradores
     * @return int cantidad de adms
     */
    private function load_adms() {
        if ($this->adms != null) {
            return count($this->adms);
        }
        $ssql = "select usr from TBL_USUARIOS where idsequiposadm like '%" . intval($this->id) . "%'";
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty) {
            $this->adms = null;
            $this->idsadmsV = null;
            return 0;
        }
        $this->adms = array();
        $this->idsadmsV = array();
        while ($usr = $this->dbinstance->get_vector()) {
            $U = $this->objsCache->get_object("User", $usr["usr"]);
            if ($this->objsCache->get_status("User", $usr["usr"]) === "ok") {
                if ($U->isadm($this->id)) {
                    array_push($this->adms, $U);
                    array_push($this->idsadmsV, $U->get_prop("usr"));
                }
            }
        }
        return count($this->adms);
    }

    /**
     * Verifica dato para insert / update
     */
    function check_data() {
        if (!is_numeric($this->id))
            throw new ItFunctionalException('dbobject/checkdata', 'El id debe ser un numero entero');
        if ($this->nombre == "")
            throw new ItFunctionalException('dbobject/checkdata', 'El campo Nombre es obligatorio');

        if (!is_numeric($this->idlistin))
            throw new ItFunctionalException('dbobject/checkdata', 'Debe seleccionar un listin valido');
        $this->load_listin();
        if (!is_numeric($this->iddireccion))
            throw new ItFunctionalException('dbobject/checkdata', '');
        $this->load_division();

        $this->load_teamsDer();
        if (HsToMin($this->t_conformidad) == -1)
            throw new ItFunctionalException('dbobject/checkdata', 'Tiempo de conformidad invalido, respete el formato HH:MM');
        if ($this->estado == I_DELETED)
            throw new ItFunctionalException('dbobject/checkdata', 'Imposible modificar registro eliminado');
    }

    /**
     * Cargar objeto listin
     * @return boolean ok
     */
    private function load_listin() {
        $this->listin = $this->objsCache->get_object("Listin", $this->idlistin);
    }

    /**
     * Cargar objeto direccion
     * @return boolean
     */
    private function load_division() {
        $this->direccion = $this->objsCache->get_object("Division", $this->iddireccion);
    }

    /**
     * Carga equipos a los que puede derivar, verifica y actualiza IDs
     * @return int Qequipos
     */
    private function load_teamsDer() {
        if (isset($this->equiposderiva)) {
            return count($this->equiposderiva);
        }
        $arrTeam = explode(",", $this->idsequiposderiva);
        $arrTeamIDn = array();
        $i = 0;
        foreach ($arrTeam as $tid) {
            if (is_numeric($tid)) {
                try {
                    $t = $this->objsCache->get_object("Team", $tid);
                    $this->equiposderiva[$i] = $t;
                    $arrTeamIDn[$i] = $tid;
                    $i++;
                } catch (Exceptions\ItDeletedException $e) {
                    
                }
            }
        }
        $this->idsequiposrelacion = implode(",", $arrTeamIDn);
        return $i;
    }

    /**
     * Verifica si puede deivar
     * @param int $id Id a chequear|null(a cualquiera)
     * @return boolean
     */
    public function canDerive($id = null) {
        if ($id) {
            if (!is_numeric($id))
                return false;
            return in_array($id, explode(",", $this->idsequiposderiva));
        }else {
            return $this->idsequiposderiva !== null;
        }
    }

    /**
     * Verifica que las areas esten visibles
     * @param type $id
     * @return boolean
     */
    function canView($id) {
        return in_array($id, explode(",", $this->idsequiposvisible));
    }

    /**
     * Obtener mienbros del equipo del perfil especificado
     * @param int $idprofile
     * @return \User
     */
    function get_users($idprofile = 0) {
        if ($idprofile != 0) {
            $ssql = "select usr,idsequipos from TBL_USUARIOS where estado=" . I_ACTIVE . " and perfil=" . intval($idprofile) . " and idsequipos like '%" . intval($this->id) . "%'";
        } else {
            $ssql = "select usr,idsequipos from TBL_USUARIOS where estado=" . I_ACTIVE . " and idsequipos like '%" . intval($this->id) . "%'";
        }
        $users = array();
        $i = 0;
        $this->dbinstance->loadRS($ssql);
        if ($this->dbinstance->noEmpty) {
            while ($rs = $this->dbinstance->get_vector()) {
                if (in_array($this->id, explode(",", $rs["idsequipos"]))) {
                    try {
                        $u = $this->objsCache->get_object("User", $rs["usr"]);
                        $users[$i] = $u;
                        $i++;
                    } catch (Exceptions\ItDeletedException $e) {
                        
                    }
                }
            }
        }
        return $users;
    }

    function update_DB() {
        $this->check_data();
        $ssql = "update TBL_EQUIPOS set nombre='" . strToSQL($this->nombre) .
                "',t_conformidad='" . strToSQL($this->t_conformidad) .
                "',iddireccion=" . intval($this->iddireccion) .
                ",idsequipos_deriva='" . strToSQL($this->idsequiposderiva) .
                "',idsequipos_visible='" . strToSQL($this->idsequiposvisible) .
                "',idsequipos_reporta='" . strToSQL($this->idsequiposreporta) .
                "', mytkts_vista = '" . strToSQL($this->mytkts_vista) .
                "', staffhome_vista = '" . strToSQL($this->staffhome_vista) .
                "',idlistin=" . intval($this->idlistin) .
                " where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        $this->check_data();
        $ssql = "insert into TBL_EQUIPOS(nombre,t_conformidad,iddireccion,idsequipos_deriva,idsequipos_visible,idsequipos_reporta,idlistin,mytkts_vista,staffhome_vista,estado) values ('" .
                strToSQL($this->nombre) . "','" . strToSQL($this->t_conformidad) . "'," . intval($this->iddireccion) . ",'" . strToSQL($this->idsequiposderiva) . "','" . strToSQL($this->idsequiposvisible) . "','" . strToSQL($this->idsequiposreporta) . "'," . intval($this->idlistin) . ",'" . strToSQL($this->mytkts_vista) . "','" . strToSQL($this->staffhome_vista) . "',0);";
        $this->dbinstance->query($ssql);
        $this->id = $this->dbinstance->get_lastID();
    }

    function delete_DB() {
        if ($this->estado == I_DELETED)
            throw new ItFunctionalException('dbobject/checkdata', 'El equipo ya se encuentra eliminado');
        $ssql = "update TBL_EQUIPOS set estado=1 where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    /**
     * Calcula campos necesarios para generar la vista
     * @param string    parametro getprop del home requerido
     * @return array
     */
    public function getFieldRequired($home) {
        $fields = array();
        $vista = $this->get_prop($home);
        $fieldsDefaults = array("id", "childsc", "origen_json", "status", "critic", "fb", "fa");

        $vistaV = explode(',', $vista);
        foreach ($vistaV as $fv) {
            $fv_exp = explode('=>', $fv);
            if (!strpos($fv_exp[0], ':')) {
                array_push($fields, $fv_exp[0]);
            }
        }
        return array_unique(array_merge($fields, $fieldsDefaults));
    }

    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'nombrefull':
                return $this->get_prop('nombre') .
                        ' -' . $this->get_prop('direccionname');
            case 't_conformidad':
                return $this->t_conformidad;
            case 'idlistin':
                if ($this->listin == null)
                    $this->load_listin();
                return $this->idlistin;
            case 'listinobj':
                if ($this->listin == null)
                    $this->load_listin();
                return $this->listin;
            case 'iddireccion':
                if ($this->direccion == null)
                    $this->load_division();
                return $this->iddireccion;
            case 'idsadms':
                $this->load_adms();
                return implode(",", $this->idsadmsV);
            case 'adms':
                $this->load_adms();
                return $this->adms;
            case 'mytkts_vista':
                return $this->mytkts_vista;
            case 'staffhome_vista':
                return $this->staffhome_vista;
            case 'direccionobj':
                $this->load_division();
                return $this->direccion;
            case 'direccionname':
                if ($this->direccion == null)
                    $this->load_division();
                if ($this->direccion) {
                    return $this->direccion->get_prop("nombre");
                }
                return "Invalida/Error";
            case 'idsequiposderiva':
                return $this->idsequiposderiva;
            case 'equiposderiva':
                if ($this->equiposderiva == null)
                    $this->load_teamsDer();
                return $this->equiposderiva;
            case 'idsequiposvisible':
                return $this->idsequiposvisible;
            case 'idsequiposreporta':
                return $this->idsequiposreporta;
            default:
                throw new ItFunctionalException('prop/getprop');
        }
    }

}

?>
