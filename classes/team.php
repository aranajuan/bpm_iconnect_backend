<?php

require_once 'classes/db.php';
require_once 'classes/listin.php';
require_once 'classes/division.php';

/**
 * Clase para administrar los equipos
 */
class TEAM extends itobject {

    public static $TIPOS = array(/* tipos de equipos */
        1 => "GRUPO_IT",
        2 => "GRUPO_NOIT",
        3 => "GRUPO_OPERACION"
    );

    /**
     * Devuelve ID de nombre de tipo
     * @param string $name
     * @return int
     */
    public static function GetTipo_id($name) {
        $name = strtoupper($name);
        foreach (TEAM::$TIPOS as $ID => $T) {
            if ($T == $name)
                return $ID;
        }
    }

    private $id;   /* id del equipo */
    private $nombre;   /* nombre del equipo */
    private $t_conformidad; /* tiempo de conformidad luego de solucionado HH:MM */
    private $idlistin; /* id del listin para notificaciones */
    private $listin;   /* objeto listin */
    private $iddireccion;  /* id de la direccion a la que pertenece */
    private $direccion;     /* objeto direccion */
    private $tipo; /* tipo de grupo */
    private $idsequiposrelacion; /* equipos a los que puede derivar por fuera del arbol */
    private $equiposrelacion; /* equipos a los que puede derivar por fuera del arbol */
    private $idsequiposvisible; /* equipos de los cuales puede ver los tickets sin relacion */
    private $equiposvisible; /* equipos de los cuales puede ver los tickets sin relacion */
    private $estado;   /* activo / inactivo */
    private $error = FALSE;  /* error al cargar de la base */

    /**
     * Listar equipos del tipo especifico y oculando los que corresponda
     * @param int $tipo
     * @param int $hide
     * @return null|\TEAM
     */
    function list_all($tipo = "", $hide = "") {
        if ($tipo != "") {
            $tipo = " tipo in ($tipo) and ";
        }
        if ($hide != "") {
            $hide = " id not in ($hide) and ";
        }
        $ssql = "select id from TBL_EQUIPOS where $tipo $hide estado =" . I_ACTIVE;
        $this->loadRS($ssql);
        if (!$this->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->get_vector()) {
            $list[$i] = new TEAM();
            $list[$i]->load_DB($idV[0]);
            $i++;
        }
        return $list;
    }

    /**
     * Devuelve equipos relacionados del tipo solicitado
     * @param type $type
     * @return array TEAM
     */
    function get_teamsREL($type=""){
        if($type==""){
            return $this->get_prop("equiposrelacion");
        }
        $result=array();
        $i=0;
        foreach($this->get_prop("equiposrelacion") as $t){
            if($t->get_prop("tipoTXT")==$type){
                $result[$i]=$t;
                $i++;
            }
        }
        return $result;
    }
    
    /**
     * Verifica que las areas esten relacionadas
     * @param type $id
     * @param type $type
     * @return boolean
     */
    function check_REL($id,$type=""){
        foreach($this->get_teamsREL($type) as $t){
            if ($t->get_prop("id") == $id) {
                return true;
            }
        }
        return false;
        
    }
    
     /**
     * Devuelve equipos visibles del tipo solicitado
     * @param type $type
     * @return array TEAM
     */
    function get_teamsVIEW($type=""){
        if($type==""){
            return $this->get_prop("equiposvista");
        }
        $result=array();
        $i=0;
        foreach($this->get_prop("equiposvista") as $t){
            if($t->get_prop("tipoTXT")==$type){
                $result[$i]=$t;
                $i++;
            }
        }
        return $result;
    }
    
    /**
     * Verifica que las areas esten visibles
     * @param type $id
     * @param type $type
     * @return boolean
     */
    function check_VIEW($id,$type=""){
        foreach($this->get_teamsVIW($type) as $t){
            if ($t->get_prop("id") == $id) {
                return true;
            }
        }
        return false;
        
    }
    
    
    function load_DB($id) {
        $this->error = FALSE;
        $this->loadRS("select * from TBL_EQUIPOS where id=$id");
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
        $this->idlistin = trim($tmpU["idlistin"]);
        $this->t_conformidad = trim($tmpU["t_conformidad"]);
        $this->iddireccion = trim($tmpU["iddireccion"]);
        $this->tipo = trim($tmpU["tipo"]);
        $this->idsequiposrelacion = trim($tmpU["idequipos_relacion"]);
        $this->idsequiposvisible = trim($tmpU["idequipos_visible"]);
        $this->direccion = null;
        $this->listin = null;
        $this->equiposderivar = null;
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
        $this->load_teamsRel();
        $this->load_teamsVIEW();
        if (!$division)
            return "Debe seleccionar una direccion valida";
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
        $this->listin = new LISTIN();
        if ($this->listin->load_DB($this->idlistin) == "ok")
            return TRUE;
        $this->listin = NULL;
        return FALSE;
    }

    /**
     * Cargar objeto direccion
     * @return boolean
     */
    private function load_division() {
        $this->direccion = new DIVISION();
        if ($this->direccion->load_DB($this->iddireccion) == "ok")
            return TRUE;
        $this->direccion = NULL;
        return FALSE;
    }

    /**
     * Carga equipos a los que puede derivar, verifica y actualiza IDs
     * @return int Qequipos
     */
    private function load_teamsRel() {
        $arrTeam = explode(",", $this->idsequiposrelacion);
        $arrTeamIDn = array();
        $i = 0;
        foreach ($arrTeam as $tid) {
            if (is_numeric($tid)) {
                $t = new TEAM();
                if ($t->load_DB($tid) == "ok") {
                    $this->equiposrelacion[$i] = $t;
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
    private function load_teamsVIEW() {
        $arrTeam = explode(",", $this->idsequiposvisible);
        $arrTeamIDn = array();
        $i = 0;
        foreach ($arrTeam as $tid) {
            if (is_numeric($tid)) {
                $t = new TEAM();
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
     * Obtener mienbros del equipo del perfil especificado
     * @param type $profile
     * @return \USER
     */
    function get_users($profile = "") {
        if ($profile != "") {
            $idprof = get_profileId($profile);
            if ($idprof == "-1")
                return array();
            $ssql = "select id,idsequipos from TBL_USUARIOS where perfil=$idprof and idsequipos like '%" . $this->id . "%'";
        }
        else {
            $ssql = "select id,idsequipos from TBL_USUARIOS where idsequipos like '%" . $this->id . "%'";
        }
        $users = array();
        $i = 0;
        $this->loadRS($ssql);
        if ($this->noEmpty) {
            while ($rs = $this->get_vector()) {
                if (in_array($this->id, explode(",", $rs["idsequipos"]))) {
                    $u = new USER();
                    if ($u->load_DB($rs["id"]) == "ok") {
                        $users[$i] = $u;
                        $i++;
                    }
                }
            }
        }
        return $users;
    }

    /**
     *  Datos para el robot
     */
    function get_toSimplit() {

        /*
          select WO.* ,
          (
          select count(SO.id) from tickets_m as SO
          where SO.idtkt=WO.idtkt and
          SO.idaccion=25 and
          SO.FA>WO.FA
          ) as tktAfter
          from tickets_m as WO
          where WO.idaccion=2 order by WO.idtkt,WO.FA;

         *           */
    }


    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_EQUIPOS set nombre='" . strToSQL($this->nombre) . "',t_conformidad='" . $this->t_conformidad . "',iddireccion=" . $this->iddireccion . ",idequipos_relacion='" . strToSQL($this->idsequiposrelacion) . "',idequipos_visible='" . strToSQL($this->idsequiposvisible) ."',idlistin=" . $this->idlistin . ",tipo=" . $this->tipo . " where id=$this->id";
            if ($this->query($ssql))
                return "<b>Error:</b>" . $this->details;
            else
                return "ok";
        }
        return $rta;
    }


    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_EQUIPOS(nombre,t_conformidad,iddireccion,idequipos_relacion,idequipos_visible,idlistin,tipo,estado) values ('" . strToSQL($this->nombre) . "','" . $this->t_conformidad . "'," . $this->iddireccion . ",'" . strToSQL($this->idsequiposrelacion) . "','" . strToSQL($this->idsequiposvisible) . "'," . $this->idlistin . "," . $this->tipo . ",0);";
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
            return "El equipo ya se encuentra eliminado";
        $ssql = "update TBL_EQUIPOS set estado=1 where id=$this->id";
        if ($this->query($ssql))
            return "<b>Error:</b>" . $this->details;
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
            case 'idsequiposrelacion':
                if ($this->equiposrelacion == null)
                    $this->load_teamsRel();
                return $this->idsequiposrelacion;
            case 'equiposrelacion':
                if ($this->equiposrelacion == null)
                    $this->load_teamsRel();
                return $this->equiposrelacion;
            case 'idsequiposvisible':
                if ($this->equiposvisible == null)
                    $this->load_teamsVIEW();
                return $this->idsequiposvisible;
            case 'equiposvisible':
                if ($this->equiposvisible == null)
                    $this->load_teamsVIEW();
                return $this->equiposvisible;
            case 'tipo':
                return $this->tipo;
            case 'tipoTXT':
                return TEAM::$TIPOS[$this->tipo];
            default:
                return "Propiedad invalida.";
        }
    }

}

?>
