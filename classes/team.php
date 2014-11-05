<?php

require_once 'classes/listin.php';
require_once 'classes/division.php';

/**
 * Clase para administrar los equipos
 */
class TEAM extends itobject {

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
    private $equiposvisible; /* equipos de los cuales puede ver los tickets sin relacion */
    private $estado;   /* activo / inactivo */
    private $error = FALSE;  /* error al cargar de la base */

    /**
     * Listar equipos
     * @param string $derive    null|notnull
     * @return null|\TEAM
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
            $list[$i] = new TEAM($this->conn);
            $list[$i]->load_DB($idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_EQUIPOS where id=" . intval($id));
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
        $this->tipo = trim($tmpU["tipo"]);
        $this->idsequiposderiva = trim($tmpU["idsequipos_deriva"]);
        $this->idsequiposvisible = trim($tmpU["idsequipos_visible"]);
        $this->direccion = null;
        $this->listin = null;
        $this->equiposderiva = null;
        $this->equiposvisible = null;
    }

    function check_data() {
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero";
        if ($this->nombre == "")
            return "El campo Nombre es obligatorio";
        if (!is_numeric($this->idlistin))
            return "Debe seleccionar un listin valido";
        $listin = $this->load_listin();
        if (!$listin)
            return "Debe seleccionar un listin valido";
        if (!is_numeric($this->iddireccion))
            return "Debe seleccionar una direccion valida";
        $division = $this->load_division();
        if (!$division)
            return "Debe seleccionar una direccion valida";
        $this->load_teamsDer();
        $this->load_teamsView();
        if (HsToMin($this->t_conformidad) == -1)
            return "Tiempo de conformidad invalido, respete el formato HH:MM";
        if ($this->estado == I_DELETED)
            return "Imposible modificar registro eliminado";
        return NULL;
    }

    /**
     * Cargar objeto listin
     * @return boolean ok
     */
    private function load_listin() {
        $this->listin = new LISTIN($this->conn);
        if ($this->listin->load_DB($this->idlistin) == "ok")
            return TRUE;
        $this->listin = NULL;
        $this->idlistin= NULL;
        return FALSE;
    }

    /**
     * Cargar objeto direccion
     * @return boolean
     */
    private function load_division() {
        $this->direccion = new DIVISION($this->conn);
        if ($this->direccion->load_DB($this->iddireccion) == "ok")
            return TRUE;
        $this->direccion = NULL;
        return FALSE;
    }

    /**
     * Carga equipos a los que puede derivar, verifica y actualiza IDs
     * @return int Qequipos
     */
    private function load_teamsDer() {
        $arrTeam = explode(",", $this->idsequiposderiva);
        $arrTeamIDn = array();
        $i = 0;
        foreach ($arrTeam as $tid) {
            if (is_numeric($tid)) {
                $t = new TEAM($this->conn);
                
                if ($t->load_DB($tid) == "ok") {
                    
                    $this->equiposderiva[$i] = $t;
                    $arrTeamIDn[$i] = $tid;
                    $i++;
                }
            }
        }
        $this->idsequiposrelacion = implode(",", $arrTeamIDn);
        return $i;
    }

    /**
     * Carga equipos a los que puede ver y actualiza IDs
     * @return int Qequipos
     */
    private function load_teamsView() {
        $arrTeam = explode(",", $this->idsequiposvisible);
        $arrTeamIDn = array();
        $i = 0;
        foreach ($arrTeam as $tid) {
            if (is_numeric($tid)) {
                $t = new TEAM($this->conn);
                if ($t->load_DB($tid) == "ok") {
                    $this->equiposvisible[$i] = $t;
                    $arrTeamIDn[$i] = $tid;
                    $i++;
                }
            }
        }
        $this->idsequiposvisible = implode(",", $arrTeamIDn);
        return $i;
    }

    /**
     * Verifica si puede deivar
     * @param int $id Id a chequear|null(a cualquiera)
     * @return boolean
     */
    public function canDerive($id=null){
        if($id){
            if(!is_numeric($id)) return false;
            return in_array($id,explode(",",$this->idsequiposderiva));
        }else{
            return $this->idsequiposderiva!==null;
        }
    }
    
    /**
     * Verifica que las areas esten visibles
     * @param type $id
     * @return boolean
     */
    function canView($id) {
        return in_array($id,explode(",",$this->idsequiposvisible));
    }

    /**
     * Obtener mienbros del equipo del perfil especificado
     * @param type $profile
     * @return \USER
     */
    function get_users($profile = "") {
        if ($profile != "") {
            $idprof = get_profileId($profile);
            if ($idprof == "-1")
                return array();
            $ssql = "select id,idsequipos from TBL_USUARIOS where perfil=".intval($idprof)." and idsequipos like '%" . intval($this->id) . "%'";
        }
        else {
            $ssql = "select id,idsequipos from TBL_USUARIOS where idsequipos like '%" . intval($this->id) . "%'";
        }
        $users = array();
        $i = 0;
        $this->dbinstance->loadRS($ssql);
        if ($this->noEmpty) {
            while ($rs = $this->dbinstance->get_vector()) {
                if (in_array($this->id, explode(",", $rs["idsequipos"]))) {
                    $u = new USER($this->conn);
                    if ($u->load_DB($rs["id"]) == "ok") {
                        $users[$i] = $u;
                        $i++;
                    }
                }
            }
        }
        return $users;
    }

    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_EQUIPOS set nombre='" . strToSQL($this->nombre) . "',t_conformidad='" . strToSQL($this->t_conformidad) . "',iddireccion=" . intval($this->iddireccion) . ",idsequipos_deriva='" . strToSQL($this->idsequiposderiva) . "',idsequipos_visible='" . strToSQL($this->idsequiposvisible) . "',idlistin=" . intval($this->idlistin) . " where id=".intval($this->id);
            if ($this->dbinstance->query($ssql))
                return "Team_update: " . $this->dbinstance->details;
            else
                return "ok";
        }
        return $rta;
    }

    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_EQUIPOS(nombre,t_conformidad,iddireccion,idsequipos_deriva,idsequipos_visible,idlistin,estado) values ('" . strToSQL($this->nombre) . "','" . strToSQL($this->t_conformidad) . "'," . intval($this->iddireccion) . ",'" . strToSQL($this->idsequiposderiva) . "','" . strToSQL($this->idsequiposvisible) . "'," . intval($this->idlistin) . ",0);";
            if ($this->dbinstance->query($ssql))
                return "Team_insert: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    function delete_DB() {
        if ($this->estado == I_DELETED)
            return "El equipo ya se encuentra eliminado";
        $ssql = "update TBL_EQUIPOS set estado=1 where id=".intval($this->id);
        if ($this->dbinstance->query($ssql))
            return "Team_delete: " . $this->dbinstance->details;
        else
            return "ok";
    }

    function get_prop($property) {
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
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
            case 'direccionobj':
                if ($this->direccion == null)
                    $this->load_division();
                return $this->direccion;
            case 'direccionname':
                if ($this->direccion == null)
                    $this->load_division();
                if($this->direccion){
                    return $this->direccion->get_prop("nombre");
                }
                return "Invalida/Error";
            case 'idsequiposderiva':
                if ($this->equiposderiva == null)
                    $this->load_teamsDer();
                return $this->idsequiposderiva;
            case 'equiposderiva':
                if ($this->equiposderiva == null)
                    $this->load_teamsDer();
                return $this->equiposderiva;
            case 'idsequiposvisible':
                if ($this->equiposvisible == null)
                    $this->load_teamsView();
                return $this->idsequiposvisible;
            case 'equiposvisible':
                if ($this->equiposvisible == null)
                    $this->load_teamsView();
                return $this->equiposvisible;
            default:
                return "Propiedad invalida.";
        }
    }

}

?>
