<?php

namespace Itracker;

/*
 * Variables de la vista
 */

function get_relation($relationID) {
    return $GLOBALS["relations"][$relationID];
}

/**
 * Ordenar vector de visualizacion para mas velocidad de calculo
 * @param type $el1
 * @param type $el2
 * @return type
 */
function orderProfile($el1, $el2) {
    if ($el1["prioridad"] != $el2["prioridad"])
        return $el1["prioridad"] > $el2["prioridad"];

    if ($el1["vista"] != $el2["vista"])
        return $el1["vista"] < $el2["vista"];

    return $el1["costo"] > $el2["costo"];
}

/**
 * Clase usuario
 */
class User extends ITObject implements Utils\ScriptFunctionsInterface {
    /* tabla usuarios */

    /* root */

    private $usr;
    private $dominio;
    private $pass;
    private $fronts;
    private $frontsV;
    private $instancias;
    private $instanciasV;


    /* tabla ucontac */
    private $puesto;
    private $ubicacion;
    private $mail;
    private $tel;
    private $nombre;

    /* instance profile */
    private $dbteams;
    private $idsequipos;
    private $idsequiposV;
    private $idsequiposadm;
    private $idsequiposadmV;
    private $equiposadm;
    private $equipos;
    private $equiposLoaded;
    private $equiposAdmLoaded;
    private $idsequiposvista;
    private $idsequiposreporta;
    private $perfil;
    private $perfilAccess;
    private $perfilLoaded;
    private $debug;
    private $superuser;
    private $perfil_vista;
    private $hash;
    private $dbroot;
    private $estado;

    function __construct($conn = null) {
        parent::__construct($conn);
        $this->hash = null;
        $this->dbroot = new Utils\DB($this->conn, true);
    }

    /**
     * Lista todos los usuarios
     * @return null|User
     */
    function list_all() {
        $usr = $this->getLogged();
        $teams = $usr->get_prop("equiposadmobj");
        $ulist = array();
        foreach ($teams as $t) {
            $users = $t->get_users();
            if (count($ulist)) {
                foreach ($users as $ut) {
                    if (!objinarray($ut, $ulist, "usr")) {
                        array_push($ulist, $ut);
                    }
                }
            } else {
                $ulist = $users;
            }
        }

        return $ulist;
    }

    /**
     * Lista de perfiles
     * @return array
     */
    function list_allprofiles() {
        $ssql = "select id,nombre from TBL_PERFILES";
        $this->dbinstance->loadRS($ssql);
        $arr = array();
        while ($p = $this->dbinstance->get_vector()) {
            array_push($arr, $p);
        }
        return $arr;
    }

    /**
     * Lista dominios
     * @return array
     */
    function list_alldomains() {
        return $this->getContext()->get_GlobalConfig()->getArray('domains');
    }

    public function load_DB($usr) {

        if ($usr == "") {
            return "Error: Id invalido";
        }
        $usr = strtoupper(strToSQL($usr));

        //cargar en vector la info de las dos tablas.
        $userData = array();

        $this->dbinstance->loadRS("select * from TBL_USUARIOS where usr='$usr'");
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $userData = $this->dbinstance->get_vector();
        } else {
            return "Error usuario invalido #usr-1"; // error evaluado no cambiar
        }
        $this->usr = $usr;

        $arrRoot = $this->load_root($this->usr);
        if ($arrRoot) {
            $userData = array_merge($userData, $arrRoot);
        } else {
            $this->estado = I_DELETED;
            return "Error usuario invalido #usr-2"; // error evaluado no cambiar    
        }

        return $this->load_DV($userData);
    }

    /**
     * Devuelve vector desde UCONTAC
     * @return array   datos de contacto
     */
    private function load_contact($usr) {
        $ssql = "select * from TBL_UCONTAC where usr='" . strToSQL($usr) . "'";
        $this->dbroot->loadRS($ssql);
        if ($this->dbroot->noEmpty) {
            $data = $this->dbroot->get_vector();
            return $data;
        }
        return null;
    }

    /**
     * Carga datos del root
     * @param type $usr
     * @return array/null
     */
    private function load_root($usr) {
        $this->dbroot->loadRS("select * from TBL_USUARIOS where usr='$usr'");
        if ($this->dbroot->noEmpty && $this->dbroot->cReg == 1) {
            return $this->dbroot->get_vector();
        } else {
            return null;
        }
    }

    /**
     * Carga vector
     * @param type $tmpU
     */
    public function load_VEC($tmpU) {
        $this->usr = strtoupper($tmpU["usr"]);
        $this->dominio = strtoupper($tmpU["dominio"]);
        $this->pass = $tmpU["pass"];
        $this->fronts = $tmpU["fronts"];
        $this->frontsV = explode(",", $this->fronts);
        if ($tmpU["perfil"] > 1 && $this->perfil != 1) {
            $this->perfil = trim($tmpU["perfil"]);
        }
        $this->mail = trim($tmpU["mail"]);

        $this->tel = trim($tmpU["tel"]);

        $this->nombre = trim($tmpU["nombre"]);

        $this->puesto = trim($tmpU["puesto"]);

        $this->ubicacion = trim($tmpU["ubicacion"]);


        $this->perfilLoaded = false;
    }

    /**
     * Carga desde DB a propiedades
     * @param type $tmpU
     * @return type
     */
    private function load_DV($tmpU) {
        $contactD = $this->load_contact($tmpU["usr"]);
        if ($contactD) {
            $tmpU = array_merge($tmpU, $contactD);
        }

        $this->load_VEC($tmpU);
        $this->perfil = trim($tmpU["perfil"]); // carga por si es adm que no se permite por vec
        $this->instancias = $tmpU["instancias"];
        $this->instanciasV = explode(",", $this->instancias);
        $this->estado = trim($tmpU["estado"]);
        $this->dbteams = trim(space_delete($tmpU["idsequipos"], array("\t", "\n", "\0", "\x0B", " ")));
        $this->idsequipos = $this->dbteams;
        $this->idsequiposadm = trim(space_delete($tmpU["idsequiposadm"], array("\t", "\n", "\0", "\x0B", " ")));
        $this->equiposLoaded = false;
        if (in_array($this->usr, $this->getContext()->get_GlobalConfig()->getArray('debug/user'))) {
            $this->debug = 1;
        } else {
            $this->debug = 0;
        }
        if (in_array($this->usr, $this->getContext()->get_GlobalConfig()->getArray('configs/superusers'))) {
            $this->superuser = 1;
        } else {
            $this->superuser = 0;
        }

        if ($this->estado == I_ACTIVE)
            return "ok";
        return "eliminado";
    }

    /**
     * Actualiza los equipos en dbteams
     * @param array $teamList   ids de equipos a guardar (se cruza con los que 
     * tiene y los que administra el usuario)
     * @return int  cantidad de equipos
     */
    public function change_teams($teamList) {
        $usr = $this->getLogged();
        $result = array();
        $dbteamsV = explode(",", $this->dbteams);
        $equiposAdm = explode(",", $usr->get_prop("idsequiposadm"));

        $finalAdmTeams = array_intersect($teamList, $equiposAdm);

        foreach ($dbteamsV as $tV) {
            if (!in_array($tV, $equiposAdm)) {
                array_push($result, $tV);
            }
        }

        $resultF = array_merge($result, $finalAdmTeams);

        $this->dbteams = implode(",", $resultF);
        if (!is_numeric($resultF[0]) && count($resultF) == 1)
            return 0;
        return count($resultF);
    }

    /**
     * Elimina fisicamente de instancia
     * @return string
     */
    public function hardDelete() {
        if ($this->estado == I_DELETED) {
            $ssql = "delete from TBL_USUARIOS where usr ='" . strToSQL($this->usr) . "'";
            if ($this->dbinstance->query($ssql))
                return $this->dbinstance->details;
            return "ok";
        }
        return "No se puede restaurar usuario";
    }

    /**
     * Actualiza en root
     * @return string
     */
    private function update_root() {
        // actualiza todos los datos del root menos contacto
        $instancia = $this->getInstance()->get_prop("nombre");
        $rootD = $this->load_root($this->usr);
        if ($rootD) {
            $instancias = explode(",", $rootD["instancias"]);
            $ok = false;
            foreach ($instancias as $ins) {
                if ($ins == $instancia) {
                    $ok = true;
                    break;
                }
            }
            if (!$ok) {
                array_push($instancias, $instancia);
            }
            $rootD["instancias"] = implode(",", $instancias);
            $rootD["fronts"] = $this->fronts;
            $rootD["dominio"] = $this->dominio;
            $ssql = "update TBL_USUARIOS set dominio='" . strToSQL($rootD["dominio"]) . "', fronts='" . strToSQL($rootD["fronts"]) . "', instancias='" . strToSQL($rootD["instancias"]) . "' where usr='" . strToSQL($this->usr) . "';";
        } else {
            $rootD = array();
            $rootD["instancias"] = $instancia;
            $rootD["usr"] = $this->usr;
            $rootD["fronts"] = $this->fronts;
            $rootD["dominio"] = $this->dominio;
            $ssql = "insert into TBL_USUARIOS (usr,dominio,pass,fronts,instancias) values ('" . strToSQL($this->usr) . "','" . strToSQL($rootD["dominio"]) . "',NULL,'" . strToSQL($rootD["fronts"]) . "','" . strToSQL($rootD["instancias"]) . "');";
        }

        if ($this->dbroot->query($ssql)) {
            return $this->dbroot->details;
        }
        return "ok";
    }

    /**
     * Cambia datos de contacto //utilizada por usuario no ADM
     * @param type $mail
     * @param type $tel
     */
    public function change_contact($mail, $tel) {
        $this->mail = $mail;
        $this->tel = $tel;
    }

    /**
     * Devuelve los equipos de una direccion por nombre o id
     * @param int|string $division
     * @return array<Team>
     */
    public function getDivisionTeams($division) {
        if (is_numeric($division)) {
            $pread = 'iddireccion';
        } else {
            $pread = 'direccionname';
        }
        $td = array();
        foreach ($this->get_prop('equiposobj') as $t) {
            if ($t->get_prop($pread) == $division) {
                array_push($td, $t);
            }
        }
        return $td;
    }

    /**
     * Verifica si esta en la direccion
     * @param Division $division
     * @return array<Team>
     */
    public function in_division($division) {
        $this->load_teams();
        foreach ($this->equipos as $t) {
            if ($t->get_prop('iddireccion') == $division->get_prop('id')) {
                return true;
            }
        }
        return false;
    }

    /**
     * Carga objetos equipos
     * @return int q de equipos
     */
    private function load_teams() {
        if ($this->equiposLoaded)
            return count($this->idsequiposV);

        $tmpT = explode(",", $this->idsequipos);
        if ($this->hash == null) { // no es el logueado
            $usr = $this->getLogged();
            $teamsL = array_merge($usr->get_prop("equiposview"), explode(",", $usr->get_prop("idsequiposadm")), explode(",", $usr->get_prop("idsequipos")));
            $tmpT = array_intersect($tmpT, $teamsL);
        }

        $this->equiposLoaded = true;
        $this->idsequiposV = NULL;
        $this->equipos = NULL;
        if ($this->idsequipos == "" || $this->idsequipos == NULL) {
            $this->idsequipos = NULL;
            return 0; // no se intento cargar ningun equipo
        }

        $i = 0;
        foreach ($tmpT as $TID) {
            $t = $this->objsCache->get_object("Team", $TID);
            $rta = $this->objsCache->get_status("Team", $TID);
            if ($rta == "ok") {
                $this->equipos[$i] = $t;
                $this->idsequiposV[$i] = $TID;
                $i++;
            }
        }
        if ($i)
            $this->idsequipos = implode(",", $this->idsequiposV);
        else
            $this->idsequipos = NULL;
        return $i;
    }

    /**
     * Carga objetos equipos que administra
     * @return int q de equipos
     */
    private function load_teamsAdm() {
        if ($this->equiposAdmLoaded)
            return count($this->idsequiposadmV);
        $this->equiposAdmLoaded = true;
        $this->idsequiposadmV = NULL;
        $this->equiposadm = NULL;
        if ($this->idsequiposadm == "" || $this->idsequiposadm == NULL) {
            $this->idsequiposadm = NULL;
            return 0; // no se intento cargar ningun equipo
        }

        $tmpT = explode(",", $this->idsequiposadm);
        $i = 0;
        foreach ($tmpT as $TID) {
            $t = $this->objsCache->get_object("Team", $TID);
            $rta = $this->objsCache->get_status("Team", $TID);
            if ($rta == "ok") {
                $this->equiposadm[$i] = $t;
                $this->idsequiposadmV[$i] = $TID;
                $i++;
            }
        }
        if ($i)
            $this->idsequiposadm = implode(",", $this->idsequiposadmV);
        else
            $this->idsequiposadm = NULL;
        return $i;
    }

    /**
     * Devuelve lista de usuarios que reporta, incluidos los propios
     */
    private function get_ReportingTeamsObj() {
        $final = array();
        $this->load_teams();
        $arr = $this->idsequiposV;
        $arr2 = $this->get_ReportingTeams();
        if (is_array($arr2)) {
            $arr = array_merge($arr, $arr2);
        }
        array_unique($arr);

        foreach ($arr as $tid) {
            if (is_numeric($tid)) {
                $t = $this->objsCache->get_object("Team", $tid);
                if ($this->objsCache->get_status("Team", $tid) == "ok") {
                    array_push($final,$t);
                }
            }
        }

        return $final;
    }

    /**
     * Devuelve todas las direcciones a las que pertenece
     * @return array<Division>
     */
    public function get_divisions() {
        $arr = array();
        $teams = $this->get_prop("equiposobj");
        foreach ($teams as $t) {
            $div = $t->get_prop("direccionobj");
            if (!objinarray($div, $arr)) {
                array_push($arr, $div);
            }
        }
        return $arr;
    }

    /**
     * Verifica si administra equipo
     * @param int $idteam
     * @return boolean
     */
    public function isadm($idteam) {
        return in_array($idteam, explode(",", $this->get_prop("idsequiposadm")));
    }

    /**
     * Agrega como administrador a equipo
     * @param type $idteam
     */
    public function add_adm($idteam) {
        if (!$this->isadm($idteam)) {
            if (!is_array($this->idsequiposadmV)) {
                $this->idsequiposadmV = array();
            }
            array_push($this->idsequiposadmV, $idteam);
        }
        $this->update_adms();
    }

    /**
     * Elimina administracion de equipo
     * @param type $idteam
     */
    public function remove_adm($idteam) {
        $arr = array();
        if ($this->isadm($idteam)) {
            foreach ($this->idsequiposadmV as $t) {
                if ($t != $idteam) {
                    array_push($arr, $t);
                }
            }
        } else {
            return;
        }
        $this->idsequiposadmV = $arr;
        $this->update_adms();
    }

    /**
     * impacta cambios de adm en base de datos
     */
    private function update_adms() {
        $ssql = "update TBL_USUARIOS set idsequiposadm = '" . strToSQL(implode(",", $this->idsequiposadmV)) .
                "' where usr = '" . strToSQL($this->get_prop("usr")) . "'";
        $this->dbinstance->query($ssql);
    }

    /**
     * Verifica si el usuario se encuentra en el equipo del id solicitado
     * @param type $id
     * @param bool  $reporting
     * @return type
     */
    public function in_team($id, $reporting = FALSE) {
        $this->load_teams();
        $arr = $this->idsequiposV;
        if ($reporting) {
            $arr2 = $this->get_ReportingTeams();
            if (is_array($arr2)) {
                $arr = array_merge($arr, $arr2);
            }
        }
        return in_array($id, $arr);
    }

    /**
     * Devuelve objeto equipo de los que pertenece
     * @param type $id
     * @return Team
     */
    public function get_team_obj($id) {
        $this->load_teams();
        return $this->equipos[array_get_key_val($id, $this->idsequiposV)];
    }

    /**
     * Carga datos modificados por el usr
     * @return string
     */
    private function insert_ucontact() {

        $ssql = "delete from TBL_UCONTAC where usr='" . strToSQL($this->usr) . "'";
        $this->dbroot->query($ssql);

        $ssql = "insert into TBL_UCONTAC (usr,mail,tel,nombre,puesto,ubicacion) 
        values ('" . $this->usr . "', '" . strToSQL($this->mail) . "', '" . strToSQL($this->tel) . "','" . strToSQL($this->nombre) . "','" . strToSQL($this->puesto) . "','" . strToSQL($this->ubicacion) . "' )";

        if ($this->dbroot->query($ssql))
            return "Error al guardar datos.";
        else
            return "ok";
    }

    /**
     * Verifica datos para update e insert
     * @return string|null
     */
    public function check_data() {
        if ($this->usr == "" || $this->usr == null)
            return "El usuario es obligatorio";

        if (!in_array($this->dominio, $this->getContext()->get_GlobalConfig()->getArray('domains')))
            return "Dominion invalido";
        if (!is_numeric($this->perfil))
            return "El campo perfil es obligatorio";
        if (!filter_var(trim($this->mail), FILTER_VALIDATE_EMAIL) && trim($this->mail) != "")
            return "Mail invalido";
        if ($this->dbteams == "" || $this->dbteams == null) {
            return "Seleccione al menos un equipo";
        }
        return NULL;
    }

    /**
     * Actualiza en db
     * @return string
     */
    public function update_DB() {
        if (($rta = $this->check_data())) {
            return $rta;
        }
        $ssql = "update TBL_USUARIOS set perfil=" . intval($this->get_prop("perfil")) .
                ", idsequipos='" . strToSQL($this->dbteams) .
                "' where usr='" . strToSQL($this->usr) . "'";

        if ($this->dbinstance->query($ssql)) {
            return "User_update: " . $this->dbinstance->details;
        }

        $this->insert_ucontact();
        return $this->update_root();
    }

    /**
     * Inserta en instancia, acutaliza contact y root
     * @return string
     */
    public function insert_DB() {
        if (($rta = $this->check_data())) {
            return $rta;
        }
        $ssql = "insert into TBL_USUARIOS(usr,idsequipos,idsequiposadm,perfil,estado) 
                values ('" . strToSQL($this->usr) . "','" . strToSQL($this->dbteams) . "',null," . intval($this->perfil) . ",0);";

        if ($this->dbinstance->query($ssql)) {
            return "User_insert: " . $this->dbinstance->details;
        }

        $this->insert_ucontact();
        return $this->update_root();
    }

    /**
     * Desactiva acceso a la instancia
     * @return string
     */
    public function delete_DB() {
        $ssql = "update TBL_USUARIOS set estado=" . I_DELETED . " where usr='" . strToSQL($this->usr) . "'";
        if ($this->dbinstance->query($ssql)) {
            return "User_delete:" . $this->dbinstance->details;
        }
        return "ok";
    }

    public function load_profile() {
        if ($this->perfilLoaded)
            return;
        $ssql = "select * from TBL_PERFILES where id=" . $this->get_prop("perfil");
        $this->dbinstance->loadRS($ssql);
        $this->perfilAccess = $this->dbinstance->get_vector();
        $this->load_viewProfile();
        $this->perfilLoaded = true;
    }

    /**
     * Carga las vistas del perfil segun relacion a los tickets
     */
    private function load_viewProfile() {
        $ssql = "select * from TBL_PERFILES_VISTAS where perfil=" . $this->get_prop("perfil");
        $this->dbinstance->loadRS($ssql);
        $this->perfil_vista = array();
        $i = 0;
        while ($v = $this->dbinstance->get_vector()) {
            if ($v["relacion"] == "*") {
                $this->perfil_vista[$i] = array("nombre" => "*", "costo" => 0, "vista" => $v["vista"], "prioridad" => 0, "tipos_eventos" => explode(",", $v["tipos_eventos"]), "archivo_descarga" => $v["archivo_descarga"]);
                return;
            } else {
                $rels = explode(",", $v["relacion"]);
                foreach ($rels as $r) {
                    $relDat = get_relation($r["relacion"]); //nombre - costo
                    $this->perfil_vista[$i] = array("nombre" => $relDat[0], "costo" => $relDat[1], "prioridad" => $v["prioridad"], "vista" => $v["vista"], "tipos_eventos" => explode(",", $v["tipos_eventos"]), "archivo_descarga" => $v["archivo_descarga"]);
                    $i++;
                }
            }
        }
        usort($this->perfil_vista, 'orderProfile'); //ordena segun prioridad costo y vista de los perfiles
    }

    /**
     * Valida el acceso al metodo solicitado
     * @param type $class
     * @param type $method
     */
    public function validAction($class, $method) {
        $this->load_profile();
        $valid = explode(",", $this->perfilAccess["accesos"]);
        foreach ($valid as $v) {
            $v = trim($v);
            if (strtolower($GLOBALS["access"][$v][1]) == $class && strtolower($GLOBALS["access"][$v][2]) == $method) {
                return true;
            }
        }
        return false;
    }

    /**
     * 
     * @return array vista,eventos,thumb,download
     * @param Tkt $TKT
     */
    public function get_view($TKT) {
        $this->load_profile();
        foreach ($this->perfil_vista as $v) {
            if ($this->check_relation($v["nombre"], $TKT, true)) {
                return $v;
            }
        }
        return null;
    }

    /**
     * Array de equipos que ve el usuario
     * @return array
     */
    private function get_viewTeams() {
        if (is_array($this->idsequiposvista)) {
            return $this->idsequiposvista;
        }
        $arr = array();
        foreach ($this->get_prop("equiposobj") as $t) {
            $arr = array_merge($arr, explode(",", $t->get_prop("idsequiposvisible")));
        }
        $this->idsequiposvista = $arr;
        return $this->idsequiposvista;
    }

    /**
     * Array de equipos que ve el usuario
     * @return array
     */
    private function get_ReportingTeams() {
        if (is_array($this->idsequiposreporta)) {
            return $this->idsequiposreporta;
        }
        $arr = array();
        foreach ($this->get_prop("equiposobj") as $t) {
            $arr = array_merge($arr, explode(",", $t->get_prop("idsequiposreporta")));
        }
        $this->idsequiposreporta = $arr;
        return $this->idsequiposreporta;
    }

    /**
     * Puede ver eventos de usuario
     * @param User $U
     * @return boolean
     */
    public function cansee($U) {
        $uteams = explode(",", $U->get_prop("idsequipos"));
        $mytview = $this->get_viewTeams();
        foreach ($uteams as $tid) {
            if ($this->in_team($tid, true)) {
                return true;
            }
            if (in_array($tid, $mytview)) {
                return true;
            }
        }
    }

    /**
     * Verifica si se cumple relacion
     * @param type $rel
     * @param Tkt $TKT
     * @param bool  $reporting
     * @return boolean
     */
    public function check_relation($rel, $TKT, $reporting) {
        switch ($rel) {
            case "*":
                return true;
            case "tomado_por_usuario":
                $uT = $TKT->get_prop("u_tom_o");
                if ($uT && $uT->get_prop("usr") == $this->get_prop("usr"))
                    return true;
                break;
            case "tomado_por_otro_usuario":
                if ($TKT->get_prop("u_tom_o") && $this->in_team($TKT->get_prop("idequipo"), $reporting))
                    return true;
                break;
            case "sin_tomar":
                if ($TKT->get_prop("u_tom_o") == null && $this->in_team($TKT->get_prop("idequipo"), $reporting))
                    return true;
                break;
            case "en_equipo":
                if ($this->in_team($TKT->get_prop("idequipo"), $reporting))
                    return true;
                break;
            case "generado_por_usuario":
                $uT = $TKT->get_prop("usr_o");
                if ($uT && $uT->get_prop("usr") == $this->get_prop("usr"))
                    return true;
                break;
            case "generado_por_equipo_de_usuario_dir_propia":
                if ($this->in_division($TKT->get_division()) == false) {
                    return false;
                }
                $uT = $TKT->get_prop("usr_o");
                if ($uT == null)
                    return false;
                foreach ($uT->get_prop("equiposobj") as $t) {
                    if ($this->in_team($t->get_prop("id"), $reporting))
                        return true;
                }
                break;
            case "generado_por_equipo_de_usuario_todas_direc":
                $uT = $TKT->get_prop("usr_o");
                if ($uT == null)
                    return false;
                foreach ($uT->get_prop("equiposobj") as $t) {
                    if ($this->in_team($t->get_prop("id"), $reporting))
                        return true;
                }
                break;
            case "generado_equipo_visible":

                $uT = $TKT->get_prop("usr_o");
                if ($uT == null)
                    return false;

                $arrayId = $this->get_viewTeams();

                foreach ($uT->get_prop("equiposobj") as $t) {
                    if (in_array($t->get_prop("id"), $arrayId))
                        return true;
                }
                break;
            case "derivado":
                $THs = $TKT->get_tktHObj();
                foreach ($THs as $TH) {
                    if ($TH->get_prop("accion")->get_prop("ejecuta") == "open" || $TH->get_prop("accion")->get_prop("ejecuta") == "derive") {
                        if ($this->in_team($TH->get_prop("objadj_id"), $reporting)) {
                            return true;
                        }
                    }
                }
                break;
            case "master_de_tkt_usr":
                $TKT->load_childs();
                $chs = $TKT->get_prop("childs");
                foreach ($chs as $ch) {
                    if ($this->check_relation("generado_por_usuario", $ch, $reporting))
                        return true;
                }
                break;
            case "master_de_tkt_equipo":
                $TKT->load_childs();
                $chs = $TKT->get_prop("childs");
                foreach ($chs as $ch) {
                    if ($this->check_relation("generado_por_equipo_de_usuario", $ch, $reporting))
                        return true;
                }
                break;
            case "similar_a_uno_del_usr":
                return false; //pendiente
                break;
            case "similar_a_uno_del_equipo":
                return false; //pendiente
                break;
        }
        return false;
    }

    /**
     * Usuario puede acceder por front id
     * @param int $id
     * @return boolean
     */
    public function check_front($id) {
        return in_array($id, $this->frontsV);
    }

    /**
     * Usuario puede acceder a la instancia
     * @param string $name
     * @return boolean
     */
    public function check_instance($name) {
        return in_array($name, $this->instanciasV);
    }

    /**
     * Loguea usuario
     * @param string $pass
     * @param FRONT $front
     * @param string $ipuser
     */
    public function login($passL, $front, $ipuser) {
        if ($this->estado != I_ACTIVE)
            return "Usuario invalido";

        if ($this->dominio == "BLOQUEADO") {
            return "Acceso deshabilitado apra el usuario";
        }

        if ($this->usr == "" || $this->error == true)
            return "Usuario sin cargar";

        $maxsessions = $this->getContext()->get_GlobalConfig()
                ->getInt('configs/sessionmax');

        if ($maxsessions != 1) {
            $sessionC = $this->sessionCount();
        } else {
            $sessionC = -1;
        }

        if ($front->is_trusted()) {
            if ($sessionC >= $maxsessions) {
                return 'Limite de sesiones alcanzado. Cierre una sesion.';
            }
            if ($maxsessions == 1) {
                $this->sessionCloseAll();
            }
            return $this->sessionCreate($front, $ipuser);
        }

        if ($passL == "" || $this->error == true)
            return "Usuario o contrase&ntilde;a invalidos.2";

        switch ($this->dominio) {
            case "ITRACKER":
                if ($passL != $this->pass) {
                    return "Usuario o contrase&ntilde;a invalidos.";
                }
                break;
            case "CCPI":
                $ldap = new \ExternalWs\LdapWs();
                $rta = $ldap->check_user($this->get_prop("usr"), $passL);
                if ($rta["status"] === "ok") {
                    if ($rta["response"] != "true")
                        return "Usuario o contrase&ntilde;a invalidos.";
                }else {
                    return "Error en servicio de logeo" . $rta["description"];
                }
                break;
            case "TELECOM":
                $ldap = new \ExternalWs\LdapWs();
                $rta = $ldap->check_user($this->get_prop("usr"), $passL);
                if ($rta["status"] === "ok") {
                    if ($rta["response"] != "true")
                        return "Usuario o contrase&ntilde;a invalidos.";
                }else {
                    return "Error en servicio de logeo";
                }
                break;
            case "SHAREPOINT":
                $SPF = new Front();
                $SPF->load_DB("SHAREPOINT");
                $ssql = "select fecha from TBL_SESIONES where "
                        . "usr='" . strToSQL($this->get_prop("usr")) . "' "
                        . "and front=" . $SPF->get_prop("id") . " and hash='" . strToSQL($passL) . "'"
                        . " ";
                $this->dbroot->loadRS($ssql);
                if ($this->dbroot->cReg != 1) {
                    return "SP::Usuario o contrase&ntilde;a invalidos.";
                }
                $v = $this->dbroot->get_vector();
                $f1 = strtotime($v["fecha"]);
                if ($f1 == false) {
                    return "SP::fecha invalida " . $v["fecha"];
                }
                $f2 = strtotime('now');
                if ($f2 == false) {
                    return "SP::fecha invalida";
                }
                if (($f2 - $f1) > 60) {
                    return "SP::Usuario o contrase&ntilde;a invalidos. timeout" . ($f2 - $f1);
                }
                break;
            default:
                return "Usuario o contrase&ntilde;a invalidos.";
        }
        if ($sessionC >= $maxsessions) {
            return 'Limite de sesiones alcanzado. Cierre una sesion.';
        }
        if ($maxsessions == 1) {
            $this->sessionCloseAll();
        }
        return $this->sessionCreate($front, $ipuser);
    }

    /**
     * Actualiza la fecha de actividad
     */
    public function sessionActivity() {
        if (!$this->hash) {
            return;
        }
        $ssql = "update TBL_SESIONES set fecha_actividad = now() where hash='" . strToSQL($this->hash) . "'";
        $this->dbroot->query($ssql);
    }

    /**
     * Genera sesion
     * @param Front $front
     * @param string $ipuser
     * @return string ok
     */
    private function sessionCreate($front, $ipuser) {

        $hash = hash("sha1", (string) microtime());
        /** clear and check max * */
        $ssql = "insert into TBL_SESIONES (usr,front,ip,hash,fecha,fecha_actividad) values
            ('" . strToSQL($this->usr) .
                "'," . $front->get_prop("id") . ",'"
                . strToSQL($ipuser) . "','" . $hash . "',now(),now())";
        if ($this->dbroot->query($ssql)) {
            return "Error: imposible loguear usuario" . mysql_error();
        }
        $this->hash = $hash;
        return "ok";
    }

    /**
     * Cantidad de sesiones abiertas del usuario
     * @return int
     */
    public function sessionCount() {
        $this->sessionClear();
        $ssql = 'select count(*) from TBL_SESIONES where  usr=\'' . strToSQL($this->usr) . '\'';
        $this->dbroot->loadRS($ssql);
        $c = $this->dbroot->get_vector();
        return $c[0];
    }

    /**
     * Limpia sesiones vencidas
     */
    private function sessionClear() {
        $desde = date(DBDATE_WRITE, strtotime('-' .
                        $this->getContext()->get_GlobalConfig()->getInt('configs/sessiontimeout')
                        . ' minute'));
        $ssql = 'delete from TBL_SESIONES where  usr=\'' . strToSQL($this->usr) . '\'' .
                ' and fecha_actividad < \'' . $desde . '\'';
        $this->dbroot->query($ssql);
    }

    /**
     * Loguea usuario para ejecutar funciones
     * @param type $hash
     * @param type $front
     * @param type $ipuser
     * @return boolean
     */
    public function sessionValidate($hash, $front, $ipuser) {
        if ($this->estado != I_ACTIVE)
            return false;
        $desde = date(DBDATE_WRITE, strtotime('-' .
                        $this->getContext()->get_GlobalConfig()->getInt('configs/sessiontimeout')
                        . ' minute'));
        $ssql = "select usr from TBL_SESIONES where usr='" . strToSQL($this->usr) .
                "' and front=" . $front->get_prop("id") .
                " and hash='" . strToSQL($hash) .
                "' and ip='" . strToSQL($ipuser) . "'" .
                " and fecha_actividad between '" . $desde . "' and now()";
        $this->dbroot->loadRS($ssql);
        if ($this->dbroot->cReg == 1) {
            $this->hash = $hash;
            return true;
        }
        $this->hash = null;
        return false;
    }

    /**
     * Cierra sesiones del usuario
     */
    public function sessionCloseAll() {
        $ssql = "delete from TBL_SESIONES where usr='" . strToSQL($this->usr) . "'";
        $this->dbroot->query($ssql);
    }

    /**
     * Cierra sesion
     */
    public function sessionClose() {
        $ssql = "delete from TBL_SESIONES where hash='" . strToSQL($this->hash) . "'";
        $this->dbroot->query($ssql);
    }

    /**
     * Devuelve vista del primer equipo
     * @param string $type tipo de vista (staff o my)
     * @return array(vista,campos)
     */
    private function getView($type) {
        $equipos = $this->get_prop("equiposobj");
        if (count($equipos)) {
            return array($equipos[0]->get_prop($type), $equipos[0]->getFieldRequired($type));
        } else {
            return array('', '');
        }
    }

    /**
     * Devuelve vista del primer equipo my
     * @return array(vista,campos)
     */
    public function getMyView() {
        return $this->getView("mytkts_vista");
    }

    /**
     * Devuelve propiedad solicitada
     * @param type $property
     * @return string
     */
    public function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'mail':
                return $this->mail;
            case 'debug':
                return $this->debug;
            case 'superuser':
                return $this->superuser;
            case 'telefono':
                return $this->tel;
            case 'nombre':
                return ucwords($this->nombre);
            case 'usr':
                return $this->usr;
            case 'hash':
                return $this->hash;
            case 'dominio':
                return $this->dominio;
            case 'iddirecciones':
                $arr = $this->get_divisions();
                return implode(',', makeproparr($arr, 'id'));
            case 'idsequipos':
                $this->load_teams();
                return $this->idsequipos;
            case 'equiposobj':
                $this->load_teams();
                return $this->equipos;
            case 'equiposname':
                if ($this->load_teams() == 0)
                    return "";
                $ret = "";
                foreach ($this->equipos as $t) {
                    $ret.=$t->get_prop("nombre") . "; ";
                }
                return substr($ret, 0, (strlen($ret) - 2));
            case 'idsequiposadm':
                $this->load_teamsAdm();
                return $this->idsequiposadm;
            case 'equiposadmobj':
                $this->load_teamsAdm();
                return $this->equiposadm;
            case 'equiposreportaobj':
                return $this->get_ReportingTeamsObj();
            case 'equiposview':
                return $this->get_viewTeams();
            case 'perfil':
                return $this->perfil;
            case 'fulladm':
                return $this->get_prop('perfilt') == 'admin_full';
            case 'fronts':
                return $this->fronts;
            case 'perfilt':
                $this->load_profile();
                return $this->perfilAccess["nombre"];
            case 'accesslist':
                $this->load_profile();
                return $this->perfilAccess["accesos"];
            case 'instancias':
                return $this->instancias;
            case 'ubicacion':
                return $this->ubicacion;
            case 'puesto':
                return $this->puesto;
            default:
                return "Propiedad invalida.";
        }
    }

    public function scriptEjecute($function, $params) {
        $function = trim(strtolower($function));
        switch ($function) {
            case 'division_teams':
                return makeproparr($this->getDivisionTeams($params[0]), 'id');
            default:
                return "Funcion invalida. $function";
        }
    }

}

?>