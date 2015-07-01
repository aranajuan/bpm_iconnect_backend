<?php

namespace Itracker;

/**
 * Clase de administracion de acciones
 * Ejecucion, vita html, validaciones
 */
class Action extends ITObject {

    private $id;    /* id del elemento */
    private $nombre;    /* nombre de la accion */
    private $tipo;  /* tipo de accion, agrupador // ver perfiles */
    private $formulario;    /* requiere formulario o es de ejecucion directa */
    private $ejecuta;
    private $estadotkt;
    private $alias;

    /*
      Habilitadores: 0: DC 1: Si 2: NO
     */
    private $habilita_t_propio; /* tomado por el usuario */
    private $habilita_tomado;   /* tomado por cuaklquier usuario -> menos el logueado (marcar tambien la anterior) */
    private $habilita_perfiles; /* perfiles habilitados (separados por coma) */
    private $habilita_equipos;   /* equipo habilitados para esta accion */
    private $habilita_a_propio; /* abierto por el usuario */
    private $habilita_abierto;  /* abierto */
    private $habilita_equipo;   /* equipo del usuario */
    private $habilita_master;   /* es master */

    /* notificaciones */
    private $notificacion_param;    /* Usuarios a notificar ver notify */
    private $notificacion_texto;    /* Texto para el TO, CC usa texto standar */
    private $descripcion;   /* descripcion de la accion */
    private $estado;    /* activo o no activo */
    private $form; /* formulario para cargar accion */
    private $files; /* archivos */
    private $objadj_id; //id del objeto adjunto
    private $forceEveRta; // respuesta de evento forzado

    /**
     *
     * @var ITForm
     */
    private $itf;

    /**
     *  ticket evaluado
     * @var Tkt 
     */
    private $TKT;

    /**
     * Primer accion trabajada
     * @var boolean 
     */
    private $working;
    
    /**
     * Hijos a notificar
     * @var array<Tkt>
     */
    private $childsPaste;
    
    /**
     * Se setearon hijos forzadamente
     * @var boolean
     */
    private $childsSeted;
    /**
     * Filtra acciones segun filtros en array - devuelve array de objetos
     * @return array acciones validas
     */
    public function load_filtered() {
        $l = $this->getLogged();

        //datos a validar -> cargar del master si corresponde

        if ($this->TKT->get_prop("idmaster")) {
            $master_tkt = $this->TKT->get_prop("master");
            $utom = $master_tkt->get_prop("u_tom");
            $master = "habilita_master in (0,2)"; //desactivar todas las opciones para childs
        } else {
            $utom = $this->TKT->get_prop("u_tom");
            $master = "habilita_master in (0,1)"; // activa opciones para masters
        }

        if ($utom) {
            $tomado = "habilita_tomado in (0,1)"; //acciones para tickets tomados
            if ($l->get_prop("usr") == $utom)
                $t_propio = "habilita_t_propio in (0,1)"; //opciones para tomado por el logueado
            else
                $t_propio = "habilita_t_propio in (0,2)"; // opciones para tomados por otro
        }else {
            $tomado = "habilita_tomado in (0,2)";   //acciones para tickets no tomados
            $t_propio = "habilita_t_propio in (0,1,2)"; // todas, bloquea las acciones el "tomado"
        }

        if ($l->get_prop("usr") == $this->TKT->get_prop("usr"))
            $a_propio = "habilita_a_propio in (0,1)";  //generado por el usuario logueado
        else
            $a_propio = "habilita_a_propio in (0,2)"; //generado por otro usuario

        $perfil = "(habilita_perfiles like '%" . $l->get_prop("perfil") . ",%' or habilita_perfiles like '*%')";

        $equipos = "(habilita_equipos like '%" . $this->TKT->get_prop("idequipo") . ",%' or habilita_equipos like '*%')";

        if ($l->in_team($this->TKT->get_prop("idequipo")))
            $equipo = "habilita_equipo in (0,1)"; // ticket en el equipo del usuario logueado
        else
            $equipo = "habilita_equipo in (0,2)"; // ticket fuera del equipo del usuario logueado

        if ($this->TKT->get_prop("UB") || $this->TKT->get_prop("id") == NULL)
            $abierto = "habilita_abierto in (0,2)";
        else
            $abierto = "habilita_abierto in (0,1)";

        $ssql = "select id from TBL_ACCIONES where $t_propio and $a_propio and $tomado and $perfil and $equipos and $equipo and $abierto and $master and estado=" . I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        $i = 0;
        $ret = array();
        while ($actV = $this->dbinstance->get_vector()) {
            $ret[$i] = $this->objsCache->get_object('Action', $actV["id"]);
            $i++;
        }
        return $ret;
    }

    public function load_DB($id) {
        $idInt = intval($id);
        $this->childsPaste=null;
        $this->childsSeted=false;
        if (is_int($idInt) && $idInt > 0) {
            return $this->loadDB_id($idInt);
        } else {
            return $this->loadDB_name($id);
        }
    }

    /**
     * Carga ticket para ejecutar accion o consultar
     * @param Tkt $TKT
     * @return  boolean se pudo cargar
     */
    public function loadTKT($TKT) {
        $this->TKT = $TKT;
        if ($this->nombre == "ABRIR") {
            $to = $TKT->get_last();
            if ($to) {
                //cambia el form por el de la opcion
                $this->itf = $to->get_prop("itform");
                return true;
            }
            return false;
        }
        return true;
    }

    /**
     * Carga Archivos
     * @param array $files 
     */
    public function loadFiles($files) {
        $this->files = $files;
    }

    /**
     * Devuelve Archivos
     * @return array $files 
     */
    public function getFiles() {
        return $this->files;
    }

    /**
     * Devuelve ticket cargado
     * @return TKT
     */
    public function getTKT() {
        return $this->TKT;
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
     * Carga valores de formulario y valida con itform
     * @param array $values
     */
    public function loadFormValues($values, $formname = null) {
        if ($this->TKT == null) {
            return "Error ticket sin cargar";
        }
        if (!$this->formulario || $this->itf == null) {  //no requiere formulario esta accion
            return "ok";
        }
        $rta = $this->itf->load_values($values, $formname);
        return $rta;
    }

    /*
     * Cargar desde la base el id especificado
     * @param int $id     /
     */
    private function loadDB_id($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_ACCIONES where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $rta = $this->load_DV($tmpU);
            if ($this->estado == I_DELETED)
                return "eliminado";
            return $rta;
        } else
            $this->error = TRUE;
        return "error";
    }

    /**
     * Cargar accion con el nombre especificado
     * @param String $name
     */
    private function loadDB_name($name) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_ACCIONES where nombre='" . strToSQL(strtoupper($name)) . "'");
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $rta = $this->load_DV($tmpU);
            if ($this->estado == I_DELETED)
                return "eliminado";
            return $rta;
        } else
            $this->error = TRUE;
        return "error";
    }

    /**
     * Carga de vector a propiedades
     * @param type $tmpU { nombre,linkwi }
     */
    function load_VEC($tmpU) {
        $this->tipo = trim($tmpU["tipo"]);
        $this->formulario = trim($tmpU["formulario"]);
        $this->habilita_t_propio = trim($tmpU["habilita_t_propio"]);
        $this->habilita_tomado = trim($tmpU["habilita_tomado"]);
        $this->habilita_equipos = trim($tmpU["habilita_equipos"]);
        $this->habilita_perfiles = trim($tmpU["habilita_perfiles"]);
        $this->habilita_a_propio = trim($tmpU["habilita_a_propio"]);
        $this->habilita_abierto = trim($tmpU["habilita_abierto"]);
        $this->habilita_equipo = trim($tmpU["habilita_equipo"]);
        $this->habilita_master = trim($tmpU["habilita_master"]);
        $this->notificacion_param = trim($tmpU["notificacion_param"]);
        $this->notificacion_texto = trim($tmpU["notificacion_texto"]);
        $this->descripcion = trim($tmpU["descripcion"]);
        $this->form = trim(space_delete($tmpU["form"], array("\t", "\n", "\0", "\x0B")));
        if ($this->form != "") {
            $this->itf = new ITForm();
            if ($this->itf->load_xml($this->form) == false) {
                return "Error al cargar formulario de la tipificacion.";
            }
        } else {
            $this->itf = null;
        }
        $this->ejecuta = trim($tmpU["ejecuta"]);
        $this->estadotkt = trim($tmpU["estadotkt"]);
        $this->alias = trim($tmpU["alias"]);
        return "ok";
    }

    /**
     * Carga de base de datos a propiedades
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
        $this->nombre = $tmpU["nombre"];
        return $this->load_VEC($tmpU);
    }

    /**
     * Carga id de objeto para TKTH
     * @param string $objadj_id
     */
    public function loadObjadjId($objadj_id) {
        $this->objadj_id = $objadj_id;
    }

    /**
     * Valida accion
     * @param Tkt $TKT
     * @return string
     */
    public function check_valid() {
        $l = $this->getLogged();

        if ($this->habilita_perfiles != "*" && !in_array($l->get_prop("perfil"), explode(",", $this->habilita_perfiles)))
            return "Esta accion no esta disponible para tu perfil";

        if ($this->habilita_equipos != "*" && !in_array($this->TKT->get_prop("idequipo"), explode(",", $this->habilita_equipos)))
            return "Esta accion no esta disponible para tu equipo";

        if ($l->in_team($this->TKT->get_prop("idequipo"))) { //en un equipo del usuario
            if ($this->habilita_equipo == 2)
                return "Esta accion no se puede aplicar a un ticket de tu equipo";
        }else { // en otro equipo
            if ($this->habilita_equipo == 1)
                return "Esta accion no se puede aplicar a un ticket de otro equipo" . $this->TKT->get_prop("idequipo") . "//";
        }

        if ($this->TKT->get_prop("idmaster")) { //no es master
            $utom = $this->TKT->get_prop("master")->get_prop("u_tom");
            if ($this->habilita_master == 1)
                return "Esta accion solo se puede utilizar en un ticket master";
        }else { // es master
            if ($this->habilita_master == 2)
                return "Esta accion solo se puede utilizar en un ticket adjunto a otro";
            $utom = $this->TKT->get_prop("u_tom");
        }

        if ($utom) { //esta tomado
            if ($this->habilita_tomado == 2)
                return "Esta accion no se puede aplicar a un ticket tomado";
            if ($l->get_prop("usr") == $utom) { // tomado por el usuario
                if ($this->habilita_t_propio == 2)
                    return "Esta accion no se puede aplicar a un tomado por vos";
            }else { // tomado por otro
                if ($this->habilita_t_propio == 1)
                    return "Esta accion no se puede aplicar a un tomado por otro";
            }
        } else {
            if ($this->habilita_tomado == 1)
                return "Esta accion no se puede aplicar a un ticket sin tomar";
        }

        if ($l->get_prop("usr") == $this->TKT->get_prop("usr")) { //abierto por el usuario
            if ($this->habilita_a_propio == 2)
                return "Esta accion no se puede aplicar a un ticket generado por vos";
        }else { // abierto por otro
            if ($this->habilita_a_propio == 1)
                return "Esta accion no se puede aplicar a un ticket generado por otro";
        }

        if ($this->TKT->get_prop("UB") || $this->TKT->get_prop("id") == NULL) { // cerrado - no abierto
            if ($this->habilita_abierto == 1)
                return "Esta accion solo se puede aplicar a un ticket abierto";
        }else { // abierto
            if ($this->habilita_abierto == 2)
                return "Esta accion solo se puede aplicar a un ticket no abierto";
        }

        return "ok";
    }

    /**
     * Ejecuta accion
     * @return array resultado
     */
    public function ejecute() {
        $this->getTKT()->setEjecutingAction($this);
        if ($this->get_prop("ejecuta")) {
            $obCI = $this->objsCache;
            $file = ROOT_DIR."/app/Itracker/Actions/go/" . strtolower($this->get_prop("ejecuta")) . ".php";
            if(!file_exists($file)){
                $this->getContext()->getLogger()->critical("Archivo no encontrado",array($file));
                return array("result"=>"error","msj"=>"Error al ejecutar.");
            }
            $response = include($file);
            if ($response["result"] != "ok") {
                return $response;
            }
            $rta = $this->addTKT_H();
            $this->pasteTKTH($rta["obj"]);
        } else {
            $response["result"] = "ok";
            $rta = $this->addTKT_H();
        }
        $response["tkth"] = $rta["status"];
        $response["sendfiles"] = $response["tkth"];
        return $response;
    }

    /**
     * Fuerza guardado de evento
     * @return String
     */
    public function force_tkth() {
        if ($this->forceEveRta) {
            return $this->forceEveRta;
        }
        $this->forceEveRta = $this->addTKT_H();
        return $this->forceEveRta;
    }

    /**
     * Guarda evento
     * @return string
     */
    private function addTKT_H() {
        if ($this->forceEveRta) {
            return $this->forceEveRta;
        }
        $tktH = new TktH();
        $tktH->load_VEC($this);
        $rta["status"] = $tktH->insert_DB();
        $rta["obj"] = $tktH;
        $this->forceEveRta = $rta;
        return $rta;
    }

    /**
     * Carga tkts para generarles link
     * @param array<Tkt>
     */
    public function setChilds($childs){
        $this->childsPaste=$childs;
        $this->childsSeted=true;
    }
    
    /**
     * Devuelve array de hijos del tkt
     * @return array<Tkt>
     */
    private function getChilds(){
        if($this->childsSeted){
            return $this->childsPaste;
        }
        if($this->getTKT()){
            return $this->getTKT()->get_prop("childs");
        }
        return null;
    }
    
    
    /**
     * Pega link a los hijos
     * @param TktH $TH
     */
    private function pasteTKTH($TH) {
        $childs = $this->getChilds();
        foreach ($childs as $c) {
            $c->ejecute_action("LINK", array(array("id" => "idth", "value" => $TH->get_prop("id"))));
        }
    }
    
    /**
     * Devuelve formulario
     * @return itform
     */
    public function getitform() {
        return $this->itf;
    }

    public function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return $this->nombre;
            case 'ejecuta':
                return $this->ejecuta;
            case 'alias':
                return $this->alias;
            case 'tipo':
                return $this->tipo;
            case 'itf':
                return $this->itf;
            case 'formulario':
                return $this->formulario;
            case 'objadj_id':
                return $this->objadj_id;
            case 'habilita_t_propio':
                return $this->habilita_t_propio;
            case 'habilita_tomado':
                return $this->habilita_tomado;
            case 'habilita_perfiles':
                return $this->habilita_perfiles;
            case 'habilita_a_propio':
                return $this->habilita_a_propio;
            case 'habilita_abierto':
                return $this->habilita_abierto;
            case 'habilita_equipo':
                return $this->habilita_equipo;
            case 'habilita_master':
                return $this->habilita_master;
            case 'notificacion_param':
                return $this->notificacion_param;
            case 'notificacion_texto':
                return $this->notificacion_texto;
            case 'descripcion':
                return $this->descripcion;
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