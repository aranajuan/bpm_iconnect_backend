<?php

namespace Itracker;

use Itracker\Exceptions\ItFunctionalException;
use Itracker\Exceptions\ItDeletedException;

class Tkt extends Tree {

    private $id;    /* id del ticket */
    private $usr;   /* id usuario que reclama */
    private $usr_o; /* usuario que reclama */
    private $idequipo;  /* id del equipo asignado */
    private $equipos_tratan;  /* equipos por los que se derivo el tkt */
    private $equipo;    /* equipo asignado */
    /* Fue cargado el equipo */
    private $teamLoaded;
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
    private $working;
    private $variables;

    /**
     * Variables de ticket
     * @var \Itracker\Utils\Vars
     */
    private $vars;

    /**
     * Accion que se esta ejecutando
     * @var Action
     */
    private $ejecutingAction;
    private $tkthActionsLoaded; // lista de acciones cargadas en tkth * | array

    function load_DB($id) {
        start_measure("OBJ:TKT:DB:$id");
        $this->working = false;
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_TICKETS where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            return $this->load_DV($tmpU);
        }
        throw new ItFunctionalException('dbobject/load');
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
        $this->variables = trim($tmpU["variables"]);
        if ($this->variables != '' && $this->variables != '<?xml version="1.0"?>') {
            $this->vars = new \Itracker\Utils\Vars();
            $this->vars->setRootTag('tkt');
            $this->vars->loadXML($this->variables);
        } else {
            $this->vars = new Utils\Vars();
            $this->vars->setRootTag('tkt');
            $this->vars->clean();
        }
        $this->FA = $tmpU["FA"];
        $this->UA = $tmpU["UA"];
        $this->FB = $tmpU["FB"];
        $this->UB = $tmpU["UB"];
        $this->u_tom = $tmpU["u_tom"];
        $this->u_asig = $tmpU["u_asig"];
        $this->prioridad = $tmpU["prioridad"];
        $this->idmaster = $tmpU["idmaster"];
        $this->idequipo = $tmpU["idequipo"];
        $this->equipos_tratan = trim($tmpU["equipos_tratan"]);
        $this->teamLoaded = false;
        $this->load_VEC($tmpU, true);
        $usr = $this->getLogged();
        $this->load_users();
        $this->view = $usr->get_view($this);
        show_measure("OBJ:TKT:DB:" . $this->id);
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
        $this->load_path($this->origen, !$fromdb);
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
     * Accion ejecutandose
     * @param Action $action
     */
    public function setEjecutingAction($action) {
        $this->ejecutingAction = $action;
    }

    /**
     * Accion ejecutandose
     * @return Action
     */
    public function getEjecutingAction() {
        return $this->ejecutingAction;
    }

    /**
     *  devuelve lista de acciones validas - vector de la db
     * @return array<Action>
     */
    function valid_actions() {
        $A = new Action();
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
                $TKT = $this->objsCache->get_object("Tkt", $tc["id"]);
                $this->childs[$i] = $TKT;
                $i++;
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
            $this->tkthActionsLoaded = "*";
            $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . intval($this->id) . " and UB is null
                order by id
            ";
        } else {
            $actions.=",LINK";
            $actionsV = explode(",", $actions);
            $this->tkthActionsLoaded = $actionsV;
            foreach ($actionsV as &$av) {
                $av = "'" . strToSQL($av) . "'";
            }
            $actionsT = implode(",", $actionsV);
            $ssql = "
            select TH.id from TBL_TICKETS_M as TH inner join TBL_ACCIONES as TA on (TA.id=TH.idaccion) 
            where TH.idtkt=" . intval($this->id) . " and TH.UB is null and TA.nombre in (" . $actionsT . ")
                order by id
            ";
        }
        $this->dbinstance->loadRS($ssql);
        $i = 0;
        $idteam = null;
        if ($this->dbinstance->noEmpty) {
            while ($TH = $this->dbinstance->get_vector()) {
                try {
                    $THO = $this->objsCache->get_object("TktH", $TH[0]);

                    $THO->set_view($this->view);
                    $this->tkt_hOBJ[$i] = $THO;
                    $eje = $THO->get_prop('accion')->get_prop("ejecuta");
                    if ($eje === "open") {
                        $idteam = $THO->get_prop("objadj_id");
                    }
                    $THO->set_idteam($idteam);
                    if ($eje === "derive") {
                        $idteam = $THO->get_prop("objadj_id");
                    }
                    $i++;
                } catch (ItDeletedException $e) {
                    
                }
            }
        }
        return $i;
    }

    /**
     * Devuelve variables del ticket
     * @return \Itracker\Utils\Vars
     */
    public function getVars() {
        if (!$this->vars) {
            $this->vars = new Utils\Vars();
            $this->vars->setRootTag('tkt');
            $this->vars->clean();
        }
        return clone $this->vars;
    }

    /**
     * Setea variables de ticket
     * @param \Itracker\Utils\Vars $vars
     * @return string se pudo guardar
     */
    public function setVars($vars) {
        if (!($vars instanceof Utils\Vars)) {
            throw new ItFunctionalException('vars/load', 'Parametro invalido setVars');
        }
        $ssql = "variables='" . strToSQL($vars->getXml()->saveXML())."'";
        $this->update_sql($ssql);
        $this->vars = $vars;
    }

    /**
     * Estado largo
     * @return string
     */
    public function get_LargeStatus() {
        if ($this->getVars()->getValue('largestatus')) {
            return $this->vars->getValue('largestatus');
        }
        return '';
    }

    /**
     * Setea status en var
     * @param String $status
     */
    public function set_status($status) {
        $v = $this->getVars();
        $v->set_prop('status', $status);
        return $this->setVars($v);
    }

    /*
     * devuelve el estado del tkt
     * @return  string
     */

    public function get_status() {

        if ($this->getVars()->getValue('status')) {
            return $this->vars->getValue('status');
        }

        $TKTHF = $this->get_last_tktH();
        if ($this->UB) {
            $status = "Cerrado";
        } else {
            if ($TKTHF) {
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
        return $status . '*';
    }

    /**
     * Devuelve el ultimo evento del tkt
     * @return \TktH|null
     */
    public function get_last_tktH() {
        if (is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ) && $this->tkthActionsLoaded == "*")
            return $this->tkt_hOBJ[count($this->tkt_hOBJ) - 1];
        $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . intval($this->id) . " and FB is null order by FA
        ";
        $this->dbinstance->loadRS($ssql);
        if ($this->dbinstance->noEmpty) {
            $THID = $this->dbinstance->get_vector();
            $THO = $this->objsCache->get_object("TktH", $THID[0]);
            $THO->set_view($this->view);
            if ($THO->get_prop("accion")->get_prop("ejecuta") === "abrir") {
                $THO->set_idteam($THO->get_prop("objadj_id"));
            }
            return $THO;
        }
        return NULL;
    }

    /**
     * Verifica si la accion esta cargada TKTH
     * @param String $action    Separados por coma (tienen que estar todas)
     * @return boolean
     */
    private function isloadedaction($action) {
        if ($this->tkthActionsLoaded == "*")
            return true;
        if ($action == "*")
            return false;
        $actionsV = explode(",", $action);
        foreach ($actionsV as $av) {
            if ($this->tkthActionsLoaded == null || !in_array($av, $this->tkthActionsLoaded))
                return false;
        }
        return true;
    }

    /**
     * Devuelve el primer evento / apertura
     * @return \TktH|null
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
            $THO = $this->objsCache->get_object("TktH", $THID[0]);
            $THO->set_view($this->view);
            if ($THO->get_prop("accion")->get_prop("ejecuta") === "abrir") {
                $THO->set_idteam($THO->get_prop("objadj_id"));
            }
            return $THO;
        }
        return NULL;
    }

    /**
     * Devuelve eventos
     * @param String $actions    Separados por coma
     * @return array<TktH>
     */
    function get_tktHObj($actions = "*") {
        if (!$this->isloadedaction($actions)) {
            $this->load_tktH($actions);
            return $this->tkt_hOBJ;
        } else {
            if ($actions == "*")
                return $this->tkt_hOBJ;
            $actionsV = explode(",", $actions);
            $THL = array();
            foreach ($this->tkt_hOBJ as $TH) {
                if (in_array($TH->get_prop("accion")->get_prop("nombre"), $actionsV)) {
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
        if ($this->teamLoaded) {
            return;
        }
        $this->teamLoaded = true;
        if($this->idequipo ==0){
        	return;
        }
        $t = $this->objsCache->get_object("Team", $this->idequipo, false, true);
        $rta = $this->objsCache->get_status("Team", $this->idequipo);
        if ($rta == I_DELETED) {
            $this->can_edit = 0;
            $this->detail_can_edit = "El equipo asignado ya no existe " . $this->id . " ->" . $this->idequipo;
            $this->equipo = $t;
            return;
        }
        $this->can_edit = 1;
        $this->detail_can_edit = "";
        $this->equipo = $t;
    }

    /**
     * Carga objeto master
     */
    private function load_master() {
        // si esta cerrado no se puede editar este tkt, si no existe este se independiza
        if ($this->idmaster && $this->master == NULL) {
            try {
                $t = $this->objsCache->get_object("Tkt", $this->idmaster);
                if (($t->get_prop("idequipo") != $this->get_prop("idequipo") || $t->get_prop("UB")) && $this->UB == NULL) {
                    $this->getContext()->getLogger()->warning("Separado ticket por master en otro equipo", array($this->id, $this->idmaster));
                    $this->ejecute_action("SEPARAR");
                    return;
                }
                $this->master = $t;
            } catch (ItFunctionalException $e) {
                $this->idmaster = NULL;
                $this->master = NULL;
                $this->getContext()->getLogger()->warning("Separado ticket por master con error", array($this->id, $this->idmaster));
                $this->ejecute_action("SEPARAR");
                return;
            }
        }
    }

    /**
     * Ejecuta accion con valores solicitados
     * @param string $action
     * @param array $values
     * @param string $objadj_id
     * @return string
     */
    public function ejecute_action($action, $values = null, $objadj_id = null) {
        //lanzar error!
        $this->getContext()->getLogger()->info('Ejecutando', array(
            'accion' => $action,
            'values' => print_r($values, true),
            'objID' => $objadj_id
        ));
        $A = $this->objsCache->get_object("Action", $action, true);

        $A->loadTKT($this);
        if ($values) {
            $A->loadFormValues($values);
        }
        if ($objadj_id) {
            $A->loadObjadjId($objadj_id);
        }
        return $A->ejecute();
    }

    /**
     * Carga usuarios intervinientes
     */
    private function load_users() {
        // si no coincide usr con equipo se libera (funcion para liberar)
        if ($this->u_tom) {
            try {
                $u = $this->objsCache->get_object("User", $this->u_tom);
                if ($u->in_team($this->get_prop("idequipo"))) { // usuario pertenece al equipo
                    $this->u_tom_o = $u;
                    $u = null;
                    if ($this->u_asig) {
                        $u = $this->objsCache->get_object("User", $this->u_asig);
                        $this->u_asig_o = $u;
                    }
                } else {
                    $lu = $this->getLogged();
                    if ($lu->in_team($this->get_prop("idequipo"))) {
                        $this->getContext()->getLogger()->warning("Ticket liberado usuario fuera del equipo", array($this->id, $this->u_tom));
                        $this->ejecute_action("LIBERAR");
                    }
                }
            } catch (ItFunctionalException $e) {
                $this->getContext()->getLogger()->warning("Ticket liberado por error en usurio", array($this->id, $this->u_tom, $rta));
                $this->ejecute_action("LIBERAR");
            }
        }

        try {
            $u = $this->objsCache->get_object("User", $this->usr);
            $this->usr_o = $u;
        } catch (ItFunctionalException $e) {
            throw new ItFunctionalException('dbobject/load', 'Ticket con usuario generador invalido');
        }
    }

    /**
     * Verifica datos para insertar o actualizar
     * @return string|null
     */
    public function check_data() {
        if (!$this->can_edit)
            throw new ItFunctionalException('dbobject/checkdata', $this->detail_can_edit);
        if (!is_numeric($this->id))
            throw new ItFunctionalException('dbobject/checkdata', 'El id debe ser un numero entero');
        if (trim($this->usr) == "")
            throw new ItFunctionalException('dbobject/checkdata', 'El usuario es obligatorio');
        if (!is_numeric($this->idequipo))
            throw new ItFunctionalException('dbobject/checkdata', 'El equipo debe ser un numero entero');
        if (!is_numeric($this->idmaster)) {
            $this->idmaster = NULL;
        }
        $this->origen = trim($this->origen);
        if ($this->origen == "")
            throw new ItFunctionalException('dbobject/checkdata', 'Origen de tkt invalido');
    }

    /**
     *  Inserta nuevo registro y carga ID en el objeto
     * @param int   id del equipo destino
     * @return string result
     */
    function open($idequipo) {
        // can open /is active
        $this->id = I_NEWID;
        $this->u_tom = NULL;
        $this->u_asig = NULL;
        $this->idequipo = $idequipo;
        $this->equipos_tratan = ',' . $idequipo . ',';
        $this->teamLoaded = false;
        $this->load_team();
        $this->insert_DB();
    }

    /**
     * Re abre ticket y los unidos
     * @return string result
     */
    public function re_open() {
        if ($this->get_prop("minFromClose") > HsToMin($this->get_prop("equipo")->get_prop("t_conformidad"))) {
            throw new ItFunctionalException('tkt/update',"Se supero el maximo tiempo de reapertura "
                    . "(" . $this->get_prop("equipo")->get_prop("t_conformidad") . ") para este equipo. ");
         }

        $ssql = "UB=NULL, FB=NULL";
        $this->update_sql($ssql);
        $this->UB = NULL;
        $this->FB = NULL;

        if ($this->is_master()) {
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->re_open();
            }
        } elseif ($this->isWorking()) {
            $this->ejecute_action("SET_MASTER");
            $this->clear_childs();
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->re_open();
            }
        }
    }

    /**
     * Cierra el ticket y sus hijos
     * @return type
     */
    function close() {

        $UB = $this->getLogged()->get_prop("usr");
        $this->load_childs();

        /* Cerrar en tabla tkts */
        $ssql = "UB='" . strToSQL($UB) . "', FB=now()";
        $this->update_sql($ssql);

        $this->UB = $UB;
        $this->FB = date(DBDATE_READ);

        if ($this->is_master()) {
            $ch = $this->get_prop("childs");
            foreach ($ch as $c) {
                $c->close();
            }
        }
    }

    /**
     * 
     * deriva a otro equipo, si es master tambien deriva a sus hijos
     * libera y limpia prioridad
     * @param Team equipo a derivar
     * @return string rta
     */
    function derive($equipo) {

        $actual = $this->get_prop("equipo");
        if ($actual != null) {
            if (!$actual->canDerive($equipo->get_prop("id"))) {
                throw new ItFunctionalException('tkt/update','Imposible derivar al area. Sin relacion.');
            }
        }
        $this->load_childs();
        $tmpTratan = $this->equipos_tratan . $equipo->get_prop("id") . ',';
        $ssql = "idequipo=" . $equipo->get_prop("id") .
                ", equipos_tratan='" . $tmpTratan .
                "', u_tom= NULL , u_asig= NULL, prioridad=NULL";
        $this->update_sql($ssql);

        if ($this->is_master()) {
            foreach ($this->get_prop("childs") as $c) {
                $c->derive($equipo);
            }
        }
        $this->equipos_tratan = $tmpTratan;
        $this->idequipo = $equipo->get_prop("id");
        $this->equipo = $equipo;
        $this->u_asig = NULL;
        $this->u_tom = NULL;
        $this->u_tom_o = NULL;
        $this->u_asig_o = NULL;

    }

    /**
     * Establece prioridad al ticket
     * @param int $idP
     * @return string
     */
    function set_priority($idP) {
        $idP = intval($idP);
        if (!is_numeric($idP)){
            throw new ItFunctionalException('tkt/update','Prioridad invalida');
        }

        $ssql = "prioridad=" . intval($idP) ;
        $this->update_sql($ssql);
        $this->prioridad = $idP;

        if ($this->is_master()) {
            foreach ($this->get_prop("childs") as $c) {
                $c->set_priority($idP);
            }
        }

    }

    /**
     * Toma el ticket para el usuario logueado
     * @return string
     */
    function take() {

        $ssql = "u_tom='" . strToSQL($this->getLogged()->get_prop("usr")) .
                "', u_asig=NULL";
        $this->update_sql($ssql);

        $this->u_tom = $this->getLogged()->get_prop("usr");
        $this->u_tom_o = $this->getLogged();
        $this->u_asig = NULL;
        $this->u_asig_o = NULL;

        if ($this->is_master()) {
            foreach ($this->get_prop("childs") as $c) {
                $c->take();
            }
        }

    }

    /**
     * Asiga a $tou por el usuario logueado
     * @param User $tou
     * @return string rta
     */
    function asign($tou) {
        if (!$tou->in_team($this->idequipo)){
            throw new ItFunctionalException('tkt/update','No se puede asignar a este usuario, no pertenece al equipo donde esta el tkt');   
        }

        $ssql = "u_tom='" . strToSQL($tou->get_prop("usr")) .
                "',u_asig='" . strToSQL($this->getLogged()->get_prop("usr")) . "'";

        $this->update_sql($ssql);
        $this->u_tom = $tou->get_prop("usr");
        $this->u_asig = $this->getLogged()->get_prop("usr");
        $this->u_tom_o = $tou;
        $this->u_asig_o = $this->getLogged();

        if ($this->is_master()) {
            foreach ($this->get_prop("childs") as $c) {
                $c->asign($tou);
            }
        }

    }

    /**
     * MArca liberado por el usuario logueado
     * @return string rta
     */
    function free() {
        $l = $this->getLogged();
        $ssql = "u_tom=NULL ,u_asig='" . strToSQL($l->get_prop("usr")). "'";
        $this->update_sql($ssql);
        
        $this->u_tom = NULL;
        $this->u_asig = $l->get_prop("usr");
        $this->u_tom_o = NULL;
        $this->u_asig_o = $l;

        if ($this->is_master()) {
            foreach ($this->get_prop("childs") as $c) {
                $c->free();
            }
        }
    }

    /**
     * Setea master del grupo
     * @return string   rta
     */
    function set_master() {

        if ($this->is_master()) {
            return;
        }

        $lastMaster = $this->master;

        /* elimina el master actual y marca como tomado por el usuario del master */
        if ($lastMaster->get_prop("u_tom")) {
            $utom = "'" . strToSQL($lastMaster->get_prop("u_tom")) . "'";
        } else {
            $utom = "null";
        }
        $ssql = "idmaster=NULL, u_tom=" . $utom;

        $this->update_sql($ssql);

        $this->idmaster = NULL;
        $this->master = NULL;

        $lastMaster->join($this);

        $this->childs = null;

    }

    /**
     * Une al master
     * @param Tkt $master
     * @return string
     */
    function join($master) {
        $childs = $this->get_prop("childs");
        if (trim($master->get_prop("id")) == trim($this->id)) {
            throw new ItFunctionalException('tkt/update','No se puede adjuntar al mismo ticket');
        }

        if ($master->get_prop("FB") != NULL){
            throw new ItFunctionalException('tkt/update','No se puede adjuntar a este tkt, ya se encuentra cerrado.');
        }

        if (!$master->is_master()){
            throw new ItFunctionalException('tkt/update',"Este ticket esta anexado al tkt:" . 
                    $master->get_prop("idmaster") . ". Debe anexarlo a este.");
        }

        /* ADECUACION EQUIPO */
        if ($master->get_prop("idequipo") != $this->get_prop("idequipo")) {
            $this->ejecute_action("DERIVAR", array(
                array("id" => "idequipo", "value" => $master->get_prop("idequipo")),
                array("id" => "comment", "value" => "Derivado para unir a master"),
            ));
        }

        /* ADECUACION USUARIO TOMADO */
        $utomM = $master->get_prop("u_tom");
        $utom = $this->get_prop("u_tom");
        $ul = $this->getLogged()->get_prop("usr");

        if ($utomM == null && $utom != null) {
            if ($utom == $ul) {
                $master->ejecute_action("TOMAR");
            } else {
                $master->ejecute_action("ASIGNAR", array(array("id" => "idusr", "value" => $utom)));
            }
        } elseif ($utomM) {
            if ($utom == null) {
                if ($utomM == $ul) {
                    $this->ejecute_action("TOMAR");
                } else {
                    $this->ejecute_action("ASIGNAR", array(array("id" => "idusr", "value" => $utomM)));
                }
            } elseif ($utomM != $utom) {
                throw new ItFunctionalException('tkt/update','El master esta tomado por otro usuario');
            }
        }

        $ssql = "idmaster=" . intval($master->get_prop("id"));
        $this->update_sql($ssql);

        $this->idmaster = $master->get_prop("id");
        $this->master = $master;
        $this->clear_childs();

        /* ADECUACION STATUS */
        if ($this->isWorking() &&
                $this->get_status() != $master->get_status()) {
            $tv = $this->getEjecutingAction()->getITS()->getObject('TKTVAR');
            if ($tv instanceof Utils\Vars) {
                $tv->set_prop('status', $master->get_status());
                $this->getEjecutingAction()->getITS()->addObject('TKTVAR', $tv);
            }
        }

        foreach ($childs as $c) {
            $c->join($master);
        }

    }

    /**
     * Separa ticket del master
     * @return string
     */
    function un_join() {
        $ssql = "idmaster=NULL";
        
        $this->update_sql($ssql);

        $this->idmaster = NULL;
        $this->master = NULL;
    }

    /**
     * Vector de TKTS similares
     * @return array<Tkt>|null 
     */
    public function get_similar() {

        $critico = $this->get_critic();

        if ($critico == null) {
            return null;
        }

        $criticVC = explode(",", $critico);
        $ssql = "
            select id,origen from TBL_TICKETS where idmaster is null and FB is null 
            and origen like 'D%,S" . intval($this->get_system()->get_prop("id")) . ",%'"; // todos los tkts del sistema abiertos
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty) {
            return NULL;
        }
        $i = 0;
        $tktV = array();
        while ($tm = $this->dbinstance->get_vector()) {
            //verificar textos criticos y comparar con actual
            $TKTc = new TKT();
            $TKTc->load_path($tm["origen"], 0);
            $countC = count(array_intersect($criticVC, explode(",", $TKTc->get_critic())));
            if ($countC) {
                $tkt = $this->objsCache->get_object("Tkt", $tm["id"]);
                if ($this->objsCache->get_status("Tkt", $tm["id"]) == "ok") {
                    $tktV[$i] = $tkt;
                    $i++;
                }
            }
        }

        if (count($tktV) != 0) {
            return $tktV;
        } else {
            return NULL;
        }
    }

    public function delete_DB() {
        return "Funcion en desarrollo.";
    }

    public function insert_DB() {
        $this->check_data();

        $ssql = "insert into TBL_TICKETS(usr,idequipo,equipos_tratan,idmaster,origen,u_tom,u_asig,FA,UA,FB,UB)" .
                "values ('" . strToSQL($this->get_prop("usr")) . "'," .
                $this->get_prop("idequipo") . ",'" . $this->get_prop("equipostratan") . "',NULL,'" . strToSQL($this->get_path()) .
                "',NULL,NULL,now(),'" . strToSQL($this->get_prop("usr")) . "',NULL,NULL);";


        $this->dbinstance->query($ssql);

        $this->UA = $this->usr;
        $this->id = $this->dbinstance->get_lastID();
    }

    public function update_sql($ssql) {
        $this->check_data();
        $this->dbinstance->query('update TBL_TICKETS set '.$ssql.
                ' where id=' . intval($this->id));
    }
    
    public function update_DB() {
	    
    }

    function get_prop($property) {
        $property = strtolower($property);
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
            case 'vars':
                return $this->getVars();
            case 'idequipo':
                $this->load_team();
                return $this->idequipo;
            case 'equipostratan':
                return $this->equipos_tratan;
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
            case 'origenpath':
                return $this->get_path();
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
            case 'childs':
                $this->load_childs();
                return $this->childs;
            case 'origen_json':
                return json_encode($this->get_tree_history());
            case 'tipificacion':
                $treeh = $this->get_tree_history();
                $tipif = array();
                foreach ($treeh as $opt) {
                    array_push($tipif, $opt["ans"]);
                }
                return $tipif;
            case 'childsc':
                return $this->load_childs();
            case 'critic':
                return $this->get_critic();
            case 'status':
                return $this->get_status();
            case 'ua':
                return $this->UA;
            case 'ub':
                return $this->UB;
            case 'fa':
                return STRdate_format($this->FA, DBDATE_READ, USERDATE_READ);
            case 'fb':
                if ($this->FB == NULL)
                    return NULL;
                return STRdate_format($this->FB, DBDATE_READ, USERDATE_READ);
            case 'minfromclose':
                return DiffBetweenDates($this->get_prop("FB"), "NOW");
            default:
                throw new ItFunctionalException('prop/getprop');
        }
    }

}

?>