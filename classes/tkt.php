<?php

require_once 'classes/action.php';
require_once 'classes/abstract/tree.php';

require_once 'classes/tkt_h.php';

class TKT extends TREE {

    private $id;    /* id del ticket */
    private $usr;   /* id usuario que reclama */
    private $usr_o; /* usuario que reclama */
    private $idequipo;  /* id del equipo asignado */
    private $equipo;    /* equipo asignado */
    private $idmaster;  /* id del ticket master */
    private $master;    /* ticket master */
    private $origen;    /* ruta origen */
    private $u_tom; /* id usuario tomado */
    private $u_tom_o;   /* usuario tomado */
    private $u_asig;    /* id usuario asigno */
    private $u_asig_o;  /* usuario asigno */
    private $prioridad; /* prioridad establecida */
    private $FA;    /* fecha alta */
    private $UA;    /* usuario alta */
    private $FB;    /* fecha baja */
    private $UB;    /* usuario baja */
    private $can_edit; /* 1 se puede editar, 0 no se puede editar. usuarios eliminados tkt cerrado */
    private $detail_can_edit;   /* id del ticket */
    private $tkt_hOBJ;  /* objeto tkt H */
    private $childs;    /* tickets adjuntos */
    private $view;  /* vista para el usuario */
    public static $priorities = array(
        array("ALTA", "MEDIA", "BAJA"),
        array("RED", "BLUE", "BLACK"),
        array(3, 6, 9)
    );
    private $working;
    
    private $tkthActionsLoaded; // lista de acciones cargadas en tkth * | array

    /**
     * Carga tickets aplicando filtros
     * @param array $filter open - open/close
     *                              cfrom y cto para close
     *                      openby - lista de usuarios separado por coma
     *                      opento - id equipo
     *                      taken - * / lista usuarios separado por coma 
     *                      master - seteado y 'null' (sin master) / idmaster
     *                      origin  - filtro especifico de origen %xxxxx% separado por coma
     */
    public function list_fiter($filter) {
        $openfilter = "";
        if ($filter["open"] == "open") {
            $openfilter = "and UB is null";
        } elseif ($filter["open"] == "closed" && $filter["cfrom"] != "" && $filter["cto"] != "") {
            $fecha_d = @STRdate_format($filter["cfrom"], USERDATE_READ, DBDATE_WRITE);
            $fecha_h = @STRdate_format($filter["cto"], USERDATE_READ, DBDATE_WRITE);
            $openfilter = "and FB between '" . $fecha_d . "' and '" . $fecha_h . "'";
        }

        $openbyfilter = "";
        if ($filter["openby"]) {
            $arr = explode(",", $filter["openby"]);
            foreach ($arr as &$a) {
                $a = "'" . strToSQL($a) . "'";
            }
            $openbyfilter = "and UA in (" . implode(",", $arr) . ")";
        }

        $opentotaken = "";
        if ($filter["opento"]) {
            $opentotaken = "and idequipo=" . $filter["opento"];
            if ($filter["taken"]) {
                if ($filter["taken"] == "*") {
                    $opentotaken.=" and u_tom is not null";
                } else {
                    $listv = explode(",", $filter["taken"]);
                    $arr = array();
                    $null = "";
                    foreach ($listv as $v) {
                        if ($v != "null") {
                            array_push($arr, "'" . $v . "'");
                        } else {
                            $null = "u_tom is null";
                        }
                    }
                    if (count($arr)) {
                        if ($null != "") {
                            $null = "or " . $null;
                        }
                        $opentotaken.=" and ( u_tom in(" . implode(",", $arr) . ") $null ) ";
                    } else {
                        $opentotaken.=" and $null ";
                    }
                }
            }
        }

        $ismaster = "";
        if (isset($filter["master"])) {
            if ($filter["master"] == "null") {
                $ismaster = "and idmaster is null";
            } else {
                $ismaster = "and idmaster=" . $filter["master"];
            }
        }

        if ($openbyfilter == "" && $opentotaken == "") {
            return null;
        }

        $originfilter = "";
        if ($filter["origin"]) {
            $originslst = explode(',', $filter["origin"]);
            $originfilter = " and (";
            foreach ($originslst as $o) {
                $originfilter.= " origen like '%" . strToSQL($o) . "%' or";
            }
            $originfilter = substr($originfilter, 0, strlen($originfilter) - 2) . ") ";
        }

        $ssql = "select id from TBL_TICKETS where id is not null " . $originfilter . " " . $openfilter . " " . $openbyfilter . " " . $opentotaken . " " . $ismaster;
        $this->dbinstance->loadRS($ssql);
        $i = 0;
        $list = array();
        while ($idV = $this->dbinstance->get_vector()) {
            $list[$i] = $this->objsCache->get_object(get_class(), $idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($id) {
        start_measure("OBJ:TKT:DB:$id");
        $this->working = false;
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_TICKETS where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            return $this->load_DV($tmpU);
        }

        $this->error = TRUE;
        return "error";
    }

    /**
     * Setea como ticket en trabajo
     */
    public function setWorking() {
        $this->working = true;
    }

    /**
     *  Elimina seteo de ticket en trabajo
     */
    public function unsetWorking() {
        $this->working = false;
    }

    /**
     * Ticket llamado para trabajarlo
     * @return boolean
     */
    public function isWorking() {
        return $this->working;
    }

    /**
     * Carga datos de la base a propiedades y la vista del usuario
     * @param type $tmpU
     * @return string
     */
    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->FA = $tmpU["FA"];
        $this->UA = $tmpU["UA"];
        $this->FB = $tmpU["FB"];
        $this->UB = $tmpU["UB"];
        $this->u_tom = $tmpU["u_tom"];
        $this->u_asig = $tmpU["u_asig"];
        $this->prioridad = $tmpU["prioridad"];
        $this->idmaster = $tmpU["idmaster"];
        $this->idequipo = $tmpU["idequipo"];
        $rta = $this->load_VEC($tmpU, true);
        $usr = $this->getLogged();
        $this->view = $usr->get_view($this);
        show_measure("OBJ:TKT:DB:" . $this->id);
        return $rta;
    }

    /**
     * Carga ruta
     * @param type $tmpU
     * @fromdb  boolean cargado desde base de datos  
     * @return string
     */
    function load_VEC($tmpU, $fromdb = false) {
        $this->usr = $tmpU["usr"];
        $this->origen = $tmpU["origen"];
        return $this->load_path($this->origen, !$fromdb);
    }

    /**
     * Es master?
     * @return boolean
     */
    public function is_master() {
        $this->load_master();
        return $this->idmaster == NULL;
    }

    /**
     * Esta abierto?
     * @return boolean
     */
    public function is_open() {
        return $this->FB == NULL;
    }

    /**
     *  devuelve lista de acciones validas - vector de la db
     * @return array<ACTION>
     */
    function valid_actions() {
        $A = new ACTION();
        $A->loadTKT($this);
        return $A->load_filtered();
    }

    /**
     * Elimina los childs cargados de la propiedad
     */
    function clear_childs() {
        $this->childs = NULL;
    }

    /**
     * Carga los childs en la propiedad
     * @return  int cantidad cargada
     */
    function load_childs() {
        if ($this->childs) {
            return count($this->childs);
        }

        $this->clear_childs();
        if ($this->idmaster) {
            return 0;
        }
        $ssql = "select id from TBL_TICKETS where idmaster=" . intval($this->id) . " and idequipo=" . intval($this->get_prop("idequipo")) . " order by FA";
        $this->dbinstance->loadRS($ssql);
        $i = 0;

        if ($this->dbinstance->noEmpty) {
            while ($tc = $this->dbinstance->get_vector()) {
                $TKT = $this->objsCache->get_object("TKT", $tc["id"]);
                if ($this->objsCache->get_status("TKT", $tc["id"]) === "ok") {
                    $this->childs[$i] = $TKT;
                    $i++;
                }
            }
            return $i;
        }
        return 0;
    }

    /**
     * Cantidad de childs
     * Metodo rapido, no carga objetos de base
     * @return int
     */
    function get_count_childs() {
        if ($this->childs) {
            return count($this->childs);
        } else {
            $ssql = "select id from TBL_TICKETS where idmaster=" . intval($this->id) . " and idequipo=" . intval($this->get_prop("idequipo"));
            $this->dbinstance->loadRS($ssql);
            return $this->dbinstance->cReg;
        }
    }

    /**
     * Carga eventos historicos
     * @param string $actions ALL | Lista de acciones (ABRIR,CERRAR_EXT...)
     * @return int cantidad de eventos cargados
     */
    private function load_tktH($actions = "*") {

        $this->tkt_hOBJ = array();
        if ($actions == "*") {
            $this->tkthActionsLoaded="*";
            $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . intval($this->id) . " and estado = " . I_ACTIVE . "
                order by id
            ";
        }else{
            $actionsV = explode(",",$actions);
            $this->tkthActionsLoaded=$actionsV;
            foreach($actionsV as &$av){
                $av="'".strToSQL($av)."'";
            }
            $actionsT=  implode(",", $actionsV);
            $ssql = "
            select TH.id from TBL_TICKETS_M as TH inner join TBL_ACCIONES as TA on (TA.id=TH.idaccion) 
            where TH.idtkt=" . intval($this->id) . " and TH.estado = " . I_ACTIVE . " and TA.nombre in (".$actionsT.")
                order by id
            ";
        }
        $this->dbinstance->loadRS($ssql);
        $i = 0;
        $idteam = null;
        if ($this->dbinstance->noEmpty) {
            while ($TH = $this->dbinstance->get_vector()) {
                $THO = $this->objsCache->get_object("TKT_H", $TH[0]);
                if ($this->objsCache->get_status("TKT_H", $TH[0]) == "ok") {
                    $THO->set_view($this->view);
                    $this->tkt_hOBJ[$i] = $THO;
                    $eje = $THO->get_prop('accion')->get_prop("ejecuta");
                    if ($eje === "open") {
                        $idteam = $THO->get_prop("valoraccion");
                    }
                    $THO->set_idteam($idteam);
                    if ($eje === "derive") {
                        $idteam = $THO->get_prop("valoraccion");
                    }
                    $i++;
                }
            }
        }
        return $i;
    }

    /*
      retorna el ultimo objeto TKT_H
     */
    /*
     * devuelve el estado del tkt
     * array(TKTHLAST , TEXTO)
     */

    public function get_status() {
        $TKTHF = $this->get_last_tktH();
        if ($this->UB)
            $status = "Cerrado";
        else
        if ($TKTHF) {
            if ($TKTHF->get_prop("accion")->get_prop("nombre") == "SOLICITUD_INFO")
                $status = "Se requiere de tu accion (" . $TKTHF->get_prop("FA") . ")";
            else {
                //verificar estado del master
                if ($this->idmaster) {
                    $this->load_master();
                }
                if ($this->master) {
                    if ($this->master->get_prop("u_tom"))
                        $status = "En analisis";
                    else
                    if ($TKTHF->get_prop("accion")->get_prop("ejecuta") == "derive")
                        $status = "Derivado";
                    else
                        $status = "Pendiente";
                } else {
                    if ($this->u_tom)
                        $status = "En analisis";
                    else
                    if ($TKTHF->get_prop("accion")->get_prop("ejecuta") == "derive")
                        $status = "Derivado";
                    else
                        $status = "Pendiente";
                }
            }
        }
        return array($TKTHF, $status);
    }

    /**
     * Devuelve el ultimo evento del tkt
     * @return \TKT_H|null
     */
    public function get_last_tktH() {
        if (is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ) && $this->tkthActionsLoaded=="*")
            return $this->tkt_hOBJ[count($this->tkt_hOBJ) - 1];
        $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . intval($this->id) . " and estado = " . I_ACTIVE . " and UB is null order by FA
        ";
        $this->dbinstance->loadRS($ssql);
        if ($this->dbinstance->noEmpty) {
            $THID = $this->dbinstance->get_vector();
            $THO = $this->objsCache->get_object("TKT_H", $THID[0]);
            if ($this->objsCache->get_status("TKT_H", $THID[0]) == "ok") {
                $THO->set_view($this->view);
                if ($THO->get_prop("accion")->get_prop("ejecuta") === "abrir") {
                    $THO->set_idteam($THO->get_prop("valoraccion"));
                }
                return $THO;
            }
            return NULL;
        }
        return NULL;
    }

    /**
     * Verifica si la accion esta cargada TKTH
     * @param String $action    Separados por coma (tienen que estar todas)
     * @return boolean
     */
    private function isloadedaction($action){
        if($this->tkthActionsLoaded=="*") return true;
        if($action=="*") return false;
        $actionsV = explode(",",$action);
        foreach($actionsV as $av){
          if(!in_array($av, $this->tkthActionsLoaded))
                return false;
        }
        return true;
    }
    
    /**
     * Devuelve el primer evento / apertura
     * @return \TKT_H|null
     */
    public function get_first_tktH() {
        if (is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ) && $this->isloadedaction("ABRIR"))
            return $this->tkt_hOBJ[0];
        $ssql = "
            select TH.id from TBL_TICKETS_M as TH inner join TBL_ACCIONES as A on ( TH.idaccion = A.id) where TH.idtkt=" . $this->id . " and A.nombre='ABRIR' order by FA
        ";
        $this->dbinstance->loadRS($ssql);
        if ($this->dbinstance->noEmpty) {
            $THID = $this->dbinstance->get_vector();
            $THO = $this->objsCache->get_object("TKT_H", $THID[0]);
            if ($this->objsCache->get_status("TKT_H", $THID[0]) == "ok") {
                $THO->set_view($this->view);
                if ($THO->get_prop("accion")->get_prop("ejecuta") === "abrir") {
                    $THO->set_idteam($THO->get_prop("valoraccion"));
                }
                return $THO;
            }
            return NULL;
        }
        return NULL;
    }

    /**
     * Devuelve eventos
     * @param String $actions    Separados por coma
     * @return array<TKT_H>
     */
    function get_tktHObj($actions="*") {
        if(!$this->isloadedaction($actions)){
            $this->load_tktH($actions);
            return $this->tkt_hOBJ;
        }else{
            if($actions=="*") return $this->tkt_hOBJ;
            $actionsV=explode(",",$actions);
            $THL = array();
            foreach($this->tkt_hOBJ as $TH){
                if(in_array($TH->get_prop("action")->get_prop("nombre"),$actionsV)){
                    array_push($THL, $TH);
                }
            }
            return $THL;
        }
    }

    /**
     * Carga equipo owner
     */
    private function load_team() {
        // si el equipo no existe o no es valido no se puede editar
        if (!is_numeric($this->idequipo)) {
            $this->can_edit = 0;
            $this->detail_can_edit = "Equipo sin asignar";
            $this->idequipo = NULL;
            $this->equipo = NULL;
            return;
        }
        $t = $this->objsCache->get_object("TEAM", $this->idequipo);
        $rta = $this->objsCache->get_status("TEAM", $this->idequipo);
        switch ($rta) {
            case "eliminado":
                $this->can_edit = 0;
                $this->detail_can_edit = "El equipo asignado ya no existe " . $this->id . " ->" . $this->idequipo;
                $this->equipo = $t;
                break;
            case "error":
                $this->can_edit = 0;
                $this->detail_can_edit = "Error al cargar el equipo " . $this->id . "->" . $this->idequipo;
                $this->idequipo = NULL;
                $this->equipo = NULL;
                break;
            default:
                $this->can_edit = 1;
                $this->detail_can_edit = "";
                $this->equipo = $t;
        }
    }

    /**
     * Carga objeto master
     */
    private function load_master() {
        // si esta cerrado no se puede editar este tkt, si no existe este se independiza
        if ($this->idmaster && $this->master == NULL) {
            $t = $this->objsCache->get_object("TKT", $this->idmaster);
            if ($this->objsCache->get_status("TKT", $this->idmaster) == "error" && $this->UB == NULL) {
                $this->idmaster = NULL;
                $this->master = NULL;
                $this->ejecute_action("SEPARAR");
                return;
            }
            if (($t->get_prop("idequipo") != $this->get_prop("idequipo") || $t->get_prop("UB")) && $this->UB == NULL) {
                $this->ejecute_action("SEPARAR");
                return;
            }
            $this->master = $t;
        }
    }

    /**
     * Ejecuta accion con valores solicitados
     * @param string $action
     * @param array $values
     * @return string
     */
    public function ejecute_action($action, $values = null) {
        $A = $this->objsCache->get_object("ACTION", $action,true);
        if ($this->objsCache->get_status("ACTION", $action) != "ok") {
            return "no se puede cargar accion";
        }
        $A->loadTKT($this);
        $A->loadFormValues($values);
        return $A->ejecute();
    }

    /**
     * Carga usuarios intervinientes
     */
    private function load_users() {
        // si no coincide usr con equipo se libera (funcion para liberar)
        if ($this->u_tom) {

            $u = $this->objsCache->get_object("USER", $this->u_tom);
            $rta = $this->objsCache->get_status("USER", $this->u_tom);

            if ($rta == "ok") { // existe
                if ($u->in_team($this->get_prop("idequipo"))) { // usuario pertenece al equipo
                    $this->u_tom_o = $u;
                    $u = null;
                    if ($this->u_asig) {
                        $u = $this->objsCache->get_object("USER", $this->u_asig);
                        $this->u_asig_o = $u;
                    }
                } else {
                    $this->ejecute_action("LIBERAR");
                }
            } else {
                $this->ejecute_action("LIBERAR");
            }
        }
        if ($this->usr) {
            $u = null;
            $u = $this->objsCache->get_object("USER", $this->usr);
            $this->usr_o = $u;
        }
    }

    /**
     * Retorna colore y texto de la prioridad 
     * @param int prioridad opcional sino carga la de la propiedad
     * @return  array<String> (texto,color)
     */
    function get_priority_textcolor($prioridad = NULL) {
        if (!$prioridad)
            $prioridad = $this->prioridad;
        $idV = array_get_key_val($prioridad, self::$priorities[2]);
        if ($idV == -1)
            return array("-", "BLACK");
        return array(self::$priorities[0][$idV], self::$priorities[1][$idV]);
    }

    /**
     * Verifica datos para insertar o actualizar
     * @return string|null
     */
    public function check_data() {
        if (!$this->can_edit)
            return $this->detail_can_edit;
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero";
        if (trim($this->usr) == "")
            return "El usuario es obligatorio";
        if (!is_numeric($this->idequipo))
            return "El equipo debe ser un numero entero";
        if (!is_numeric($this->idmaster)) {
            $this->idmaster = NULL;
        }
        $this->origen = trim($this->origen);
        if ($this->origen == "")
            return "Origen de tkt invalido";
        if (!is_numeric($this->u_tom) && $this->u_tom != NULL)
            return "Usuario invalido, no puede tomar tkt (" . $this->u_tom . ")";
        if (!is_numeric($this->u_asig) && $this->u_asig != NULL)
            return "Usuario invalido, no puede asignar tkt (" . $this->u_asig . ")";
        return NULL;
    }

    /**
     *  Inserta nuevo registro y carga ID en el objeto
     * @return string result
     */
    function open() {
        $this->id = I_NEWID;
        $this->u_tom = NULL;
        $this->u_asig = NULL;
        $this->usr = $this->getLogged()->get_prop("usr");
        $l = $this->getLogged();
        $this->idequipo = $this->get_last()->equipo_destino($l);
        $this->load_team();
        return $this->insert_DB();
    }

    /**
     * Re abre ticket y los unidos
     * @return string result
     */
    public function re_open() {
        if ($this->get_prop("minFromClose") > HsToMin($this->get_prop("equipo")->get_prop("t_conformidad"))) {
            return "Se supero el maximo tiempo de reapertura "
                    . "(" . $this->get_prop("equipo")->get_prop("t_conformidad") . ") para este equipo. ";
        }

        $ssql = "update TBL_TICKETS set UB=NULL, FB=NULL where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql))
            return "Ticket_reabrir: " . $this->dbinstance->details;
        $this->UB = NULL;
        $this->FB = NULL;
        if ($this->is_master()) {
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->ejecute_action("REABRIR", array(array("id" => "comment", "value" => "Master(" . $this->id . ") reabierto")));
            }
        } elseif ($this->isWorking()) {
            $this->ejecute_action("SET_MASTER");
            $this->clear_childs();
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->ejecute_action("REABRIR", array(array("id" => "comment", "value" => "Master(" . $this->id . ") reabierto")));
            }
        }
        return "ok";
    }

    /**
     * Cierra el ticket y sus hijos
     * @return type
     */
    function close() {

        $UB = $this->getLogged()->get_prop("usr");
        $this->load_childs();

        /* Cerrar en tabla tkts */
        $ssql = "update TBL_TICKETS set UB='" . strToSQL($UB) . "', FB=now() where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_cerrar: " . $this->dbinstance->details;
        }
        $this->UB = $UB;
        $this->FB = date(DBDATE_READ);
        if ($this->is_master()) {
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->ejecute_action("CERRAR", array(array("id" => "comment", "value" => "Master(" . $this->id . ") cerrado")));
            }
        }
        return "ok";
    }

    /**
     * 
     * deriva a otro equipo, si es master tambien deriva a sus hijos
     * libera y limpia prioridad
     * @param TEAM equipo a derivar
     * @return string rta
     */
    function derive($equipo) {

        $actual = $this->get_prop("equipo");
        if ($actual != null) {
            if (!$actual->canDerive($equipo->get_prop("id"))) {
                return "Imposible derivar al area. Sin relacion.";
            }
        }
        $this->load_childs();
        $ssql = "update TBL_TICKETS set idequipo=" . $equipo->get_prop("id") . ",u_tom= NULL , u_asig= NULL, prioridad=NULL where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_derivar: " . $this->dbinstance->details;
        }

        if ($this->is_master()) {
            foreach ($this->childs as $c)
                $c->ejecute_action("DERIVAR", array(
                    array("id" => "idteam", "value" => $equipo->get_prop("id")),
                    array("id" => "comment", "value" => "Master(" . $this->id . ") derivado")
                        )
                );
        }

        $this->idequipo = $equipo->get_prop("id");
        $this->equipo = $equipo;
        $this->u_asig = NULL;
        $this->u_tom = NULL;
        $this->u_tom_o = NULL;
        $this->u_asig_o = NULL;

        return "ok";
    }

    /**
     * Establece prioridad al ticket
     * @param int $idP
     * @return string
     */
    function set_priority($idP) {
        $idP = intval($idP);
        if (!is_numeric($idP))
            return "Prioridad invalida";

        $ssql = "update TBL_TICKETS set prioridad=" . intval($idP) . " where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_priorizar: " . $this->dbinstance->details;
        }
        $this->prioridad = $idP;
        return "ok";
    }

    /**
     * Toma el ticket para el usuario logueado
     * @return string
     */
    function take() {

        if (!$this->is_master())
            return "No se puede tomar estando anexado a otro tkt, realize esta accion en el master";

        if (!$this->getLogged()->in_team($this->idequipo)) {
            return "El ticket no esta asignado a tu equipo";
        }

        $ssql = "update TBL_TICKETS set u_tom='" . strToSQL($this->getLogged()->get_prop("usr")) . "', u_asig=NULL where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_tomar: " . $this->dbinstance->details;
        }
        $this->u_tom = $this->getLogged()->get_prop("usr");
        $this->u_tom_o = $this->getLogged();
        $this->u_asig = NULL;
        $this->u_asig_o = NULL;
        return "ok";
    }

    /**
     * Asiga a $tou por el usuario logueado
     * @param USER $tou
     * @return string rta
     */
    function asign($tou) {
        if (!$tou->in_team($this->idequipo))
            return "No se puede asignar a este usuario, no pertenece al equipo donde esta el tkt";

        $ssql = "update TBL_TICKETS set u_tom='" . strToSQL($tou->get_prop("usr")) . "',u_asig='" . strToSQL($this->getLogged()->get_prop("usr")) . "' where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_asignar: " . $this->dbinstance->details;
        }
        $this->u_tom = $tou->get_prop("usr");
        $this->u_asig = $this->getLogged()->get_prop("usr");
        $this->u_tom_o = $tou;
        $this->u_asig_o = $this->getLogged();
        return "ok";
    }

    /**
     * MArca liberado por el usuario logueado
     * @return string rta
     */
    function free() {

        // solo verifica que sea del area. se debe controlar en la accion post que sea supervisor
        if (!$this->is_master())
            return "No se puede liberar estando anexado a otro tkt";
        $l = $this->getLogged();
        if (!$l->in_team($this->get_prop("idequipo")))
            return "Este tkt no esta asignado a su equipo";
        $ssql = "update TBL_TICKETS set u_tom=NULL ,u_asig='" . strToSQL($l->get_prop("usr")) . "' where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_liberar: " . $this->dbinstance->details;
        }
        $this->u_tom = NULL;
        $this->u_asig = $l->get_prop("usr");
        $this->u_tom_o = NULL;
        $this->u_asig_o = $l;
        return "ok";
    }

    /**
     * Setea master del grupo
     * @return string   rta
     */
    function set_master() {

        if ($this->is_master()) {
            return "El ticket ya es master";
        }

        $lastMaster = $this->master;

        /* elimina el master actual y marca como tomado por el usuario del master */
        if($lastMaster->get_prop("u_tom")){
            $utom="'".strToSQL($lastMaster->get_prop("u_tom"))."'";
        }  else {
            $utom = "null";
        }
        $ssql = "update TBL_TICKETS set idmaster=NULL, u_tom=" . $utom . " where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_setmaster: " . $this->dbinstance->details;
        }

        $this->idmaster = NULL;
        $this->master = NULL;

        $lastMaster->ejecute_action("UNIR", array(array("id" => "idmaster", "value" => $this->id)));

        $this->childs = null;
        //reestablece detalles

        return "ok";
    }

    /**
     * Une al master
     * @param TKT $master
     * @return string
     */
    function join($master) {
        $this->load_childs();
        if (trim($master->get_prop("id")) == trim($this->id)) {
            return "No se puede adjuntar al mismo ticket";
        }

        if ($master->get_prop("FB") != NULL)
            return "No se puede adjuntar a este tkt, ya se encuentra cerrado.";

        if ($master->get_prop("idmaster"))
            return "Este ticket esta anexado al tkt:" . $master->get_prop("idmaster") . ". Debe anexarlo a este.";

        /* Deriva si el master esta en otro equipo */
        if ($master->get_prop("idequipo") != $this->get_prop("idequipo")) {
            $rta = $this->ejecute_action("DERIVAR", array(
                array("id" => "idequipo", "value" => $master->get_prop("idequipo")),
                array("id" => "comment", "value" => "Derivado para unir a master"),
            ));
            if ($master->get_prop("idequipo") != $this->get_prop("idequipo")) {
                return "TKT_derive_join: " . $rta["msj"];
            }
        }

        $ssql = "update TBL_TICKETS set idmaster=" . intval($master->get_prop("id")) . " where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_join: " . $this->dbinstance->details;
        }

        $this->idmaster = $master->get_prop("id");
        $this->master = $master;

        foreach ($this->childs as $c) {
            $c->ejecute_action("UNIR", array(array("id" => "idmaster", "value" => $master->get_prop("id"))));
        }

        return "ok";
    }

    /**
     * Separa ticket del master
     * @return string
     */
    function un_join() {
        $ssql = "update TBL_TICKETS set idmaster=NULL where id=" . intval($this->id);
        if ($this->dbinstance->query($ssql)) {
            return "TKT_separar: " . $this->dbinstance->details;
        }
        $this->idmaster = NULL;
        $this->master = NULL;
        return "ok";
    }

    public function delete_DB() {
        return "Funcion en desarrollo.";
    }

    public function insert_DB() {
        if (($rta = $this->check_data())) {
            return $rta;
        }
        $ssql = "insert into TBL_TICKETS(usr,idequipo,idmaster,origen,u_tom,u_asig,FA,UA,FB,UB)" .
                "values ('" . strToSQL($this->get_prop("usr")) . "'," . $this->get_prop("idequipo") . ",NULL,'" . strToSQL($this->get_path()) . "',NULL,NULL,now(),'" . strToSQL($this->get_prop("usr")) . "',NULL,NULL);";


        if ($this->dbinstance->query($ssql)) {
            return "TKT_Open: " . $this->dbinstance->details;
        } else {
            $this->UA = $this->usr;
            $this->id = $this->dbinstance->get_lastID();
            return "ok";
        }
    }

    public function update_DB() {
        return "Funcion en desarrollo.";
    }

    function get_prop($property) {
        switch ($property) {
            case 'id':
                return $this->id;
            case 'usr':
                $this->load_users();
                return $this->usr;
            case 'view':
                return $this->view;
            case 'usr_o':
                $this->load_users();
                return $this->usr_o;
            case 'idequipo':
                $this->load_team();
                return $this->idequipo;
            case 'equipo':
                $this->load_team();
                return $this->equipo;
            case 'idmaster':
                $this->load_master();
                return $this->idmaster;
            case 'master':
                $this->load_master();
                return $this->master;
            case 'origen':
                return trim($this->origen);
            case 'u_tom':
                $this->load_users();
                return $this->u_tom;
            case 'u_tom_o':
                $this->load_users();
                return $this->u_tom_o;
            case 'u_asig':
                $this->load_users();
                return $this->u_asig;
            case 'u_asig_o':
                $this->load_users();
                return $this->u_asig_o;
            case 'prioridad':
                return $this->prioridad;
            case 'prioridadtext':
                $ar = $this->get_priority_textcolor();
                return $ar[0];
            case 'childs':
                $this->load_childs();
                return $this->childs;
            case 'origen_json':
                return json_encode($this->get_tree_history());
            case 'childsc':
                return $this->load_childs();
            case 'critic':
                return $this->get_critic();
            case 'status':
                $ar = $this->get_status();
                ;
                return $ar[1];
            case 'UA':
                return $this->UA;
            case 'UB':
                return $this->UB;
            case 'FA':
                return STRdate_format($this->FA, DBDATE_READ, USERDATE_READ);
            case 'FB':
                if ($this->FB == NULL)
                    return NULL;
                return STRdate_format($this->FB, DBDATE_READ, USERDATE_READ);
            case 'minFromClose':
                return DiffBetweenDates($this->get_prop("FB"), "NOW");
            default:
                return "Propiedad invalida.";
        }
    }

}

?>