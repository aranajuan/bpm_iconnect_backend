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
    private $comentario_u; /* comentario cargado por el usuario */
    private $comentario_valid; /* comentario valido para DB */
    private $tkt_hOBJ;  /* objeto tkt H */
    private $childs;    /* tickets adjuntos */
    private $view;  /* vista para el usuario */
    private static $priorities = array(
        array("ALTA", "MEDIA", "BAJA"),
        array("RED", "BLUE", "BLACK"),
        array(3, 6, 9)
    );

    /**
     * Carga de base de datos
     * @param type $id
     * @return string
     */
    function load_DB($id) {
        start_measure("OBJ:TKT:DB:$id");
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
        return ACTION::load_filtered($this);
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
                $TKT = new TKT($this->conn);
                if ($TKT->load_DB($tc["id"]) === "ok") {
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
     * @return int cantidad de eventos cargados
     */
    private function load_tktH() {

        $this->tkt_hOBJ = array();

        $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . $this->id . " and estado = " . I_ACTIVE . "
        ";
        $db = new DATOS();
        $db->loadRS($ssql);
        $i = 0;
        if ($db->noEmpty) {
            while ($TH = $db->get_vector()) {
                $THO = new TKT_H();
                if ($THO->load_DB($TH[0], $this) == "ok") {
                    $this->tkt_hOBJ[$i] = $THO;
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
            $status = "Cerrado (" . $this->get_prop("FB") . ")";
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
                    if ($TKTHF->get_prop("accion")->get_prop("nombre") == "DERIVAR")
                        $status = "Derivado";
                    else
                        $status = "Pendiente";
                } else {
                    if ($this->u_tom)
                        $status = "En analisis";
                    else
                    if ($TKTHF->get_prop("accion")->get_prop("nombre") == "DERIVAR")
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
        if (is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ))
            return $this->tkt_hOBJ[count($this->tkt_hOBJ) - 1];
        $ssql = "
            select id from TBL_TICKETS_M where idtkt=" . $this->id . " and estado = " . I_ACTIVE . " and UB is null order by FA
        ";
        $db = new DATOS();
        $db->loadRS($ssql);
        if ($db->noEmpty) {
            $THO = new TKT_H();
            $THID = $db->get_vector();
            if ($THO->load_DB($THID[0], $this) == "ok")
                return $THO;
            return NULL;
        }
        return NULL;
    }

    /**
     * Devuelve el primer evento / apertura
     * @return \TKT_H|null
     */
    public function get_first_tktH() {
        if (is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ))
            return $this->tkt_hOBJ[0];
        $ssql = "
            select TH.id from TBL_TICKETS_M as TH inner join TBL_ACCIONES as A on ( TH.idaccion = A.id) where TH.idtkt=" . $this->id . " and A.nombre='ABRIR' order by FA
        ";
        $db = new DATOS();
        $db->loadRS($ssql);
        if ($db->noEmpty) {
            $THO = new TKT_H();
            $THID = $db->get_vector();
            if ($THO->load_DB($THID[0], $this) == "ok")
                return $THO;
            return NULL;
        }
        return NULL;
    }

    /**
     * Devuelve eventos
     * @return array<TKT_H>
     */
    function get_tktHObj() {
        if (!(is_array($this->tkt_hOBJ) && count($this->tkt_hOBJ)))
            $this->load_tktH();
        return $this->tkt_hOBJ;
    }

    /**
     * Genera HTML de eventos
     * @return string
     */
    function get_tktH() {
        if (!(is_array($this->get_tktHObj()) && count($this->tkt_hOBJ)))
            return "No hay datos para mostrar";
        $HTMLR = "";
        foreach ($this->tkt_hOBJ as $TH) {
            start_measure("OBJ:TKT:action_show");
            $HTMLR.=$TH->get_html();
            show_measure("OBJ:TKT:action_show");
        }
        return $HTMLR;
    }

    /*
     * return array ( string insertresult, TH)
     */

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
        $t = new TEAM();
        $rta = $t->load_DB($this->idequipo);
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
            $t = new TKT();
            if ($t->load_DB($this->idmaster) == "error" && $this->UB == NULL) {
                $this->idmaster = NULL;
                $this->master = NULL;
                $this->un_join();
                return;
            }
            if (($t->get_prop("idequipo") != $this->get_prop("idequipo") || $t->get_prop("UB")) && $this->UB == NULL) {
                $this->un_join();
                return;
            }
            $this->master = $t;
        }
    }

    /**
     * Carga usuarios intervinientes
     */
    private function load_users() {
        // si no coincide usr con equipo se libera (funcion para liberar)
        if ($this->u_tom) {

            $u = new USER();
            $u->load_DB($this->u_tom);

            if ($u->get_prop('enbase') == 1) { // existe
                if ($u->in_team($this->get_prop("idequipo"))) { // usuario pertenece al equipo
                    $this->u_tom_o = $u;
                    $u = new USER();
                    $u->load_DB($this->u_asig);
                    $this->u_asig_o = $u;
                } else {
                    $this->free();
                }
            } else {
                $this->free();
            }
        }
        if ($this->usr) {
            $u = new USER();
            $u->load_DB($this->usr);
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
     * Agrega comentario conformidad
     * @return string result
     */
    function agree() {

        return $this->add_tktH("CONFORMIDAD");
    }

    /**
     * Re-abre todos los adjuntos con desconformidad
     * @return string result
     */
    function disagree() {
        $rta = $this->re_open();
        if ($rta != "ok")
            return $rta;
        if (is_numeric($this->get_prop("idmaster")))
            $this->set_master(); // se lleva el comentario

        $this->load_childs();
        foreach ($this->childs as $c)
            $c->re_open();
        return $this->add_tktH("NO_CONFORMIDAD");
    }

    /**
     * Re abre ticket
     * @return string result
     */
    private function re_open() {
        $ssql = "update TBL_TICKETS set UB=NULL, FB=NULL where id=" . $this->id;
        if ($this->query($ssql))
            return "<b>Error (TKT - reopen):</b>" . $this->details;
        $this->UB = NULL;
        $this->FB = NULL;
        return "ok";
    }

    /**
     * Agrega ticket externo
     * @param string $type IM;SD;RQ
     * @param int $id
     * @return string result
     */
    function add_ext($type, $id) {
        return $this->add_tktH("EXT_" . strtoupper($type), $id);
    }

    /**
     * Nombre de la accion para agregar comentario
     * @param string $action default COMENTARIO
     * @return type
     */
    function comment($action = "COMENTARIO") {
        return $this->add_tktH($action);
    }

    /**
     * Cierra el ticket y sus hijos
     * @return type
     */
    function close() {

        $l = $GLOBALS[UL];
        $UB = $l->get_prop("usr");
        $this->load_childs();

        /* Cerrar en tabla tkts */
        $ssql = "update TBL_TICKETS set UB=" . strToSQL($UB) . ", FB=now() where id=" . $this->id;
        if ($this->query($ssql))
            return "<b>Error (TKT - close):</b>" . $this->details;
        $this->UB = $UB;
        $this->FB = date(DBDATE_READ);

        /*  Cerrar adjuntos y generar detalles de cierre */

        /* Cerrar con WI */
        if ($data["IDWI"]) {
            if ($this->is_master()) {
                foreach ($this->childs as $c)
                    $c->close($type, $data);
            }
            return $this->add_tktH("CERRAR_WI", $data["IDWI"]);
        }

        /* Cerrar con tkt externo */
        if ($data["EXTTKT"]) {
            if ($this->is_master()) {
                $MasterCloseTH = $this->add_tktH("CERRAR_EXTTKT_" . $data["EXTTYPE"], $data["EXTTKT"], 1);
                foreach ($this->childs as $c)
                    $c->close($type, array_merge($data, array("MASTERTH" => $MasterCloseTH[1])));
                return $MasterCloseTH[0];
            }
            if ($data["MASTERTH"] == NULL)
                return $this->add_tktH("CERRAR_EXTTKT_" . $data["EXTTYPE"], $data["EXTTKT"]); // error tkts hijos no se pueden cerrar solos
            return $this->add_tktH("CERRAR", $data["MASTERTH"]->get_prop("id"));
        }

        /* Cerrar los demas casos no contemplados */
        if ($this->idmaster == NULL) {
            $MasterCloseTH = $this->add_tktH("CERRAR", 0, 1);
            if ($data == null)
                $data = array();
            foreach ($this->childs as $c)
                $c->close($type, array_merge($data, array("MASTERTH" => $MasterCloseTH[1])));
            return $MasterCloseTH[0];
        } else {
            if ($data["MASTERTH"] == NULL)
                return $this->add_tktH("CERRAR"); // error tkts hijos no se pueden cerrar solos
            return $this->add_tktH("CERRAR", $data["MASTERTH"]->get_prop("id"));
        }
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
            if (!$actual->check_REL($equipo->get_prop("id"), "GRUPO_IT")) {
                return "Imposible derivar al area. Sin relacion.";
            }
        }
        $this->load_childs();
        $ssql = "update TBL_TICKETS set idequipo=" . $equipo->get_prop("id") . ",u_tom= NULL , u_asig= NULL, prioridad=NULL where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;


        if ($this->idmaster == NULL) {
            foreach ($this->childs as $c)
                $c->derive($equipo);
        }

        $this->idequipo = $equipo->get_prop("id");
        $this->equipo = $equipo;
        $this->u_asig = NULL;
        $this->u_tom = NULL;
        $this->u_tom_o = NULL;
        $this->u_asig_o = NULL;

        return $this->add_tktH("DERIVAR", $equipo->get_prop("id"));
    }

    /**
     * Establece prioridad al ticket
     * @param int $idP
     * @return string
     */
    function set_priority($idP) {
        if (!is_numeric($idP))
            return "Prioridad invalida";


        $ssql = "update TBL_TICKETS set prioridad=" . $idP . " where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->prioridad = $idP;
        return $this->add_tktH("PRIORIZAR", $idP);
    }

    /**
     * Toma el ticket para el usuario logueado
     * @return string
     */
    function take() {

        if ($this->idmaster)
            return "No se puede tomar estando anexado a otro tkt, realize esta accion en el master";

        $l = $GLOBALS[UL];
        $ssql = "update TBL_TICKETS set u_tom='" . strToSQL($l->get_prop("usr")) . "', u_asig=NULL where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->u_tom = $l->get_prop("usr");
        $this->u_tom_o = $l;
        $this->u_asig = NULL;
        $this->u_asig_o = NULL;
        return $this->add_tktH("TOMAR");
    }

    /**
     * Asiga a $tou por el usuario logueado
     * @param USER $tou
     * @return string rta
     */
    function asign($tou) {
        $l = $GLOBALS[UL];
        if (!$tou->in_team($this->idequipo))
            return "No se puede asignar a este usuario, no pertenece al equipo donde esta el tkt";

        $ssql = "update TBL_TICKETS set u_tom='" . strToSQL($tou->get_prop("usr")) . "',u_asig='" . strToSQL($l->get_prop("usr")) . "' where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->u_tom = $tou->get_prop("usr");
        $this->u_asig = $l->get_prop("usr");
        $this->u_tom_o = $tou;
        $this->u_asig_o = $l;
        return $this->add_tktH("ASIGNAR", $tou->get_prop("usr"));
    }

    /**
     * MArca liberado por el usuario logueado
     * @return string rta
     */
    function free() {

        // solo verifica que sea del area. se debe controlar en la accion post que sea supervisor
        if ($this->idmaster)
            return "No se puede liberar estando anexado a otro tkt";
        $l = $GLOBALS[UL];
        if (!$l->in_team($this->get_prop("idequipo")))
            return "Este tkt ya no esta asignado a su equipo";
        $ssql = "update TBL_TICKETS set u_tom=NULL ,u_asig='" . strToSQL($l->get_prop("usr")) . "' where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->u_tom = NULL;
        $this->u_asig = $l->get_prop("usr");
        $this->u_tom_o = NULL;
        $this->u_asig_o = $l;
        return $this->add_tktH("LIBERAR");
    }

    /**
     * Setea master del grupo
     * @return string   rta
     */
    function set_master() {
        //bakup de comentarios / detalles
        $detallesBCK = $this->comentario_valid;
        $this->comentario_valid = NULL;

        $lastMaster = $this->master;
        /* elimina el master actual y marca como tomado por el usuario del master */
        $ssql = "update TBL_TICKETS set idmaster=NULL, u_tom='" . strToSQL($lastMaster->get_prop("u_tom")) . "' where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->idmaster = NULL;
        $this->master = NULL;
        $lastMaster->join($this);
        $rta = $this->add_tktH("SET_MASTER");

        //reestablece detalles
        $this->comentario_valid = $detallesBCK;
        return $rta;
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

        if ($master->get_prop("idequipo") != $this->get_prop("idequipo")) {
            $rta = $this->derive($master->get_prop("equipo"));
            if ($rta != "ok")
                return $rta;
        }

        $ssql = "update TBL_TICKETS set idmaster=" . $master->get_prop("id") . " where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->idmaster = $master->get_prop("id");
        $this->master = $master;
        foreach ($this->childs as $c)
            $c->join($master);

        return $this->add_tktH("UNIR", $master->get_prop("id"));
    }

    /**
     * Separa ticket del master
     * @return string
     */
    function un_join() {

        $ssql = "update TBL_TICKETS set idmaster=NULL where id=" . $this->id;
        if ($rta = $this->query($ssql))
            return $rta;
        $this->idmaster = NULL;
        $this->master = NULL;
        return $this->add_tktH("SEPARAR");
    }

    public function delete_DB() {
        return "Funcion en desarrollo.";
    }

    public function insert_DB() {
        if (($rta = $this->check_data())) {
            return $rta;
        }
        $ssql = "insert into TBL_TICKETS(usr,idequipo,idmaster,origen,u_tom,u_asig,FA,UA,FB,UB)".
             "values ('" . strToSQL($this->get_prop("usr")) . "'," . $this->get_prop("idequipo") . ",NULL,'" . strToSQL($this->get_path()) . "',NULL,NULL,now(),'" . strToSQL($this->get_prop("usr")) . "',NULL,NULL);";

        
        if ($this->dbinstance->query($ssql)){
            return "TKT_Open: " . $this->dbinstance->details;
        }
        else {
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
            case 'childs':
                return $this->childs;
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