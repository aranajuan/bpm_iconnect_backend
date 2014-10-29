<?php

require_once 'classes/abstract/itobject.php';
require_once 'classes/team.php';


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
class USER extends itobject {
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
    private $contactLoaded;

    /* instance profile */
    private $idsequipos;
    private $idsequiposV;
    private $equipos;
    private $equiposLoaded;
    private $perfil;
    private $perfilAccess;
    private $perfilLoaded;
    private $debug;
    private $perfil_vista;
    private $hash = null;
    private $dbroot;

    public function __construct($conn) {
        parent::__construct($conn);
        $this->dbroot = new DB($conn, true);
    }

    /**
     * Lista todos los usuarios
     * @return null|\USER
     */
    function list_all() {
        $ssql = "select usr from TBL_USUARIOS";
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->dbinstance->get_vector()) {
            $tmpU = new USER($this->conn);
            if ($tmpU->load_DB($idV[0]) == "ok") {
                $list[$i] = $tmpU;
                $i++;
            }
        }
        return $list;
    }

    /**
     * Carga usuario de ROOT
     * @param type $usr
     * @param boolean $request - si e el usr requiriente (almacena recursos)
     * @return string
     */
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
            return "Usuario invalido #usr-1 ";
        }

        $this->dbroot->loadRS("select * from TBL_USUARIOS where usr='$usr'");
        if ($this->dbroot->noEmpty && $this->dbroot->cReg == 1) {
            $userData = array_merge($userData, $this->dbroot->get_vector());
        } else {
            return "Usuario invalido #usr-2";
        }

        return $this->load_DV($userData);
    }

    public function load_VEC($tmpU) {
        $this->usr = strtoupper($tmpU["usr"]);
        $this->dominio = strtoupper($tmpU["dominio"]);
        $this->pass = $tmpU["pass"];
        $this->fronts = $tmpU["fronts"];
        $this->frontsV = explode(",", $this->fronts);
        $this->instancias = $tmpU["instancias"];
        $this->instanciasV = explode(",", $this->instancias);

        $this->perfil = trim($tmpU["perfil"]);
        $this->idsequipos = trim($tmpU["idsequipos"]);

        $this->mail = null;
        $this->tel = null;
        $this->nombre = null;
        $this->puesto = null;
        $this->ubicacion = null;
        $this->contactLoaded = false;
        $this->equiposLoaded = false;
        $this->perfilLoaded = false;
    }

    /**
     * Carga desde DB a propiedades
     * @param type $tmpU
     * @return type
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);

        if (in_array($this->usr, explode(";", DEBUG_USER))) {
            $this->debug = 1;
        } else {
            $this->debug = 0;
        }
        return "ok";
    }

    /**
     * Cambia datos de contacto
     * @param type $mail
     * @param type $tel
     */
    public function change_contact($mail, $tel) {
        $this->mail = $mail;
        $this->tel = $tel;
        $this->contactLoaded = false;
    }

    /**
     * Carga datos desde UCONTAC
     */
    private function load_contact() {
        if ($this->contactLoaded)
            return;
        $this->contactLoaded = true;

        $ssql = "select * from TBL_UCONTAC where usr='" . strToSQL($this->usr) . "'";
        $this->dbroot->loadRS($ssql);
        if ($this->dbroot->noEmpty) {
            $data = $this->dbroot->get_vector();
            $this->mail = trim($data["mail"]);
            $this->tel = trim($data["tel"]);
            $this->nombre = trim($data["nombre"]);
            $this->puesto = trim($data["puesto"]);
            $this->ubicacion = trim($data["ubicacion"]);
        }
    }

    /**
     * Carga objetos equipos
     * @return string
     */
    private function load_teams() {
        if ($this->equiposLoaded)
            return "ok";
        $this->equiposLoaded = true;
        $this->idsequiposV = NULL;
        $this->equipos = NULL;
        if ($this->idsequipos == "" || $this->idsequipos == NULL) {
            $this->idsequipos = NULL;
            return "ok"; // no se intento cargar ningun equipo
        }

        $tmpT = explode(",", $this->idsequipos);
        $i = 0;
        foreach ($tmpT as $TID) {
            $t = new TEAM($this->conn);
            $rta = $t->load_DB($TID);
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
        return "ok";
    }

    /**
     * Verifica si el usuario se encuentra en el equipo del id solicitado
     * @param type $id
     * @return type
     */
    public function in_team($id) {
        $this->load_teams();
        return in_array($id, $this->idsequiposV);
    }

    /**
     * Devuelve objeto equipo de los que pertenece
     * @param type $id
     * @return TEAM
     */
    public function get_team_obj($id) {
        $this->load_teams();
        return $this->equipos[array_get_key_val($id, $this->idsequiposV)];
    }

    /**
     * Carga datos modificados por el usr
     * @return string
     */
    public function insert_ucontact() {

        if ($this->id <= 0)
            return "Usuario invalido";
        if (!filter_var(trim($this->mail), FILTER_VALIDATE_EMAIL))
            return "Mail invalido";

        $ssql = "delete from TBL_UCONTAC where usr='" . strToSQL($this->usr) . "'";
        $this->dbroot->query($ssql);

        $ssql = "insert into TBL_UCONTAC (usr,mail,tel,nombre,puesto,ubicacion) 
        values ($this->id, '" . strToSQL($this->mail) . "', '" . strToSQL($this->tel) . "','" . strToSQL($this->nombre) . "','" . strToSQL($this->puesto) . "','" . strToSQL($this->ubicacion) . "' )";

        if ($this->dbroot->query($ssql))
            return "Error al guardar datos.";
        else
            return "ok";
    }

    public function check_data() {
        if (!in_array($this->dominio, explode(",", DOMAINS)))
            return "Dominion invalido";
        if (!is_numeric($this->perfil))
            return "El campo perfil es obligatorio";
        return NULL;
    }

    public function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_USUARIOS set perfil=" . $this->get_prop("perfil") . ", idsequipos='" . strToSQL($this->get_prop("idsequipos")) . "' where usr='" . strToSQL($this->usr) . "'";
            if ($this->dbinstance->query($ssql)) {
                return "Error al guardar datos en instancia.";
            } else {
                $ssql = "update TBL_USUARIOS set dominio='" . strToSQL($this->get_prop("dominio")) . "', pass='" . strToSQL($this->get_prop("pass")) . "', fronts='" . strToSQL($this->get_prop("fronts")) . "', instancias='" . strToSQL($this->get_prop("instancias")) . "' where usr='" . strToSQL($this->usr) . "'";
                if ($this->dbroot->query($ssql)) {
                    return "Error al guardar datos en root.";
                }
            }
        }
        else
            return $rta;
    }

    public function insert_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_USUARIOS(usr,dominio,pass,fronts,idsequipos,perfil) 
                values ('" . strToSQL($this->usr) . "','" . strToSQL($this->dominio) . "','" . strToSQL($this->pass) . "','" . strToSQL($this->fronts) . "','" . strToSQL($idteam) . "'," . $this->perfil . ");";
            if ($this->query($ssql))
                return "<b>Error:</b>" . $this->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    public function delete_DB() {
        $ssql = "delete from TBL_USUARIOS where usr='" . strToSQL($this->usr) . "'";
        if ($this->query($ssql))
            return "<b>Error:</b>" . $this->details;
        else {
            $ssql = "delete from TBL_UCONTAC where usr='" . strToSQL($this->usr) . "'";
            $this->query($ssql);
            return "ok";
        }
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
                $this->perfil_vista[$i] = array("nombre" => "*", "costo" => 0, "vista" => $v["vista"], "prioridad" => 0, "tipos_eventos" => explode(",", $v["tipos_eventos"]), "archivo_vistaprevia" => $v["archivo_vistaprevia"], "archivo_descarga" => $v["archivo_descarga"]);
                return;
            } else {
                $rels = explode(",", $v["relacion"]);
                foreach ($rels as $r) {
                    $relDat = get_relation($r["relacion"]); //nombre - costo
                    $this->perfil_vista[$i] = array("nombre" => $relDat[0], "costo" => $relDat[1], "prioridad" => $v["prioridad"], "vista" => $v["vista"], "tipos_eventos" => explode(",", $v["tipos_eventos"]), "archivo_vistaprevia" => $v["archivo_vistaprevia"], "archivo_descarga" => $v["archivo_descarga"]);
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
     * @param TKT $TKT
     */
    public function get_view($TKT) {
        $this->load_profile();
        foreach ($this->perfil_vista as $v) {
            if ($this->check_relation($v["nombre"], $TKT)) {
                return $v;
            }
        }
    }

    /**
     * Verifica si se cumple relacion
     * @param type $rel
     * @param TKT $TKT
     * @return boolean
     */
    public function check_relation($rel, $TKT) {
        switch ($rel) {
            case "*":
                return true;
            case "tomado_por_usuario":
                $uT = $TKT->get_prop("u_tom_o");
                if ($uT && $uT->get_prop("usr") == $this->get_prop("usr"))
                    return true;
                break;
            case "tomado_por_otro_usuario":
                if ($TKT->get_prop("u_tom_o") && $this->in_team($TKT->get_prop("idequipo")))
                    return true;
                break;
            case "sin_tomar":
                if ($TKT->get_prop("u_tom_o") == null && $this->in_team($TKT->get_prop("idequipo")))
                    return true;
                break;
            case "en_equipo":
                if ($this->in_team($TKT->get_prop("idequipo")))
                    return true;
                break;
            case "generado_por_usuario":
                $uT = $TKT->get_prop("usr_o");
                if ($uT && $uT->get_prop("usr") == $this->get_prop("usr"))
                    return true;
                break;
            case "generado_por_equipo_de_usuario":
                $uT = $TKT->get_prop("usr_o");
                if ($uT == null)
                    return false;
                foreach ($uT->get_prop("equiposobj") as $t) {
                    if ($this->in_team($t->get_prop("id")))
                        return true;
                }
                break;
            case "equipo_visible":
                $arrayId = array();
                $uT = $TKT->get_prop("usr_o");
                if ($uT == null)
                    return false;

                foreach ($this->get_prop("equiposobj") as $t) {
                    $arrayId = array_merge($arrayId, explode(",", $t->get_prop("idsequiposvisible")));
                }
                foreach ($uT->get_prop("equiposobj") as $t) {
                    if (in_array($t->get_prop("id"), $arrayId))
                        return true;
                }
                break;
                break;
            case "derivado":
                $THs = $TKT->get_tktHObj();
                foreach ($THs as $TH) {
                    if ($TH->get_prop("accion")->get_prop("nombre") == "ABRIR" || $TH->get_prop("accion")->get_prop("nombre") == "DERIVAR") {
                        if ($this->in_team($TH->get_prop("valoraccion"))) {
                            return true;
                        }
                    }
                }
                break;
            case "master_de_tkt_usr":
                $TKT->load_childs();
                $chs = $TKT->get_prop("childs");
                foreach ($chs as $ch) {
                    if ($this->check_relation("generado_por_usuario", $ch))
                        return true;
                }
                break;
            case "master_de_tkt_equipo":
                $TKT->load_childs();
                $chs = $TKT->get_prop("childs");
                foreach ($chs as $ch) {
                    if ($this->check_relation("generado_por_equipo_de_usuario", $ch))
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
        if ($this->usr == "" || $this->error == true)
            return "Usuario sin cargar";

        if ($front->is_trusted()) {
            return $this->newSession($front, $ipuser);
        }

        switch ($this->dominio) {
            case "ITRACKER":
                if ($passL != $this->pass) {
                    return "Usuario o contrase&ntilde;a invalidos.";
                }
                break;
            case "CCPI":
                //validar pass
                break;
            case "TELECOM":
                //validar pass
                break;
            default:
                return "Usuario o contrase&ntilde;a invalidos.";
        }

        return $this->newSession($front, $ipuser);
    }

    /**
     * Genera sesion
     * @param FRONT $front
     * @param string $ipuser
     * @return string ok
     */
    private function newSession($front, $ipuser) {
        $hash = hash("md2", (string) microtime());

        $this->closeSession();
        $ssql = "insert into TBL_SESIONES (usr,front,ip,hash,fecha) values ('" . strToSQL($this->usr) . "'," . $front->get_prop("id") . ",'" . strToSQL($ipuser) . "','" . $hash . "',now())";
        if ($this->dbroot->query($ssql)) {
            return "Error: imposible loguear usuario";
        }
        $this->hash = $hash;
        return "ok";
    }

    /**
     * Loguea usuario para ejecutar funciones
     * @param type $hash
     * @param type $front
     * @param type $ipuser
     * @return boolean
     */
    public function logged($hash, $front, $ipuser) {
        $ssql = "select usr from TBL_SESIONES where usr='" . strToSQL($this->usr) . "' and front=" . $front->get_prop("id") . " and hash='" . strToSQL($hash) . "' and ip='" . strToSQL($ipuser) . "' ";
        $this->dbroot->loadRS($ssql);
        if ($this->dbroot->cReg == 1)
            return true;
        return false;
    }

    /**
     * Cierra sesion
     */
    private function closeSession() {
        $ssql = "delete from TBL_SESIONES where usr='" . strToSQL($this->usr) . "'";
        $this->dbroot->query($ssql);
    }

    /**
     * Devuelve propiedad solicitada
     * @param type $property
     * @return string
     */
    public function get_prop($property) {
        switch ($property) {
            case 'mail':
                $this->load_contact();
                return $this->mail;
            case 'debug':
                return $this->debug;
            case 'telefono':
                $this->load_contact();
                return $this->tel;
            case 'nombre':
                $this->load_contact();
                return ucwords($this->nombre);
             case 'usr':
                return $this->usr;
            case 'hash':
                return $this->hash;
            case 'dominio':
                return $this->dominio;
            case 'idsequipos':
                $this->load_teams();
                return $this->idsequipos;
            case 'equiposobj':
                $this->load_teams();
                return $this->equipos;
            case 'perfil':
                return $this->perfil;
            case 'perfilT':
                $this->load_profile();
                return $this->perfilAccess["nombre"];
            case 'accessList':
                $this->load_profile();
                return $this->perfilAccess["accesos"];
            case 'instancias':
                return $this->instancias;
            case 'ubicacion':
                $this->load_contact();
                return $this->ubicacion;
            case 'puesto':
                $this->load_contact();
                return $this->puesto;
            default:
                return "Propiedad invalida.";
        }
    }

}

?>