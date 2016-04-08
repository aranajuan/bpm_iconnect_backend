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
    private $alias;

    /*
      Habilitadores: 0: DC 1: Si 2: NO
     */
    private $habilita_t_propio; /* tomado por el usuario */
    private $habilita_tomado;   /* tomado por cuaklquier usuario -> menos el logueado (marcar tambien la anterior) */
    private $habilita_perfiles; /* perfiles habilitados (separados por coma) */
    private $habilita_equipos;   /* equipo habilitados para esta accion */
    private $habilita_a_propio; /* abierto por el usuario 3: generado por equipo */
    private $habilita_abierto;  /* abierto */
    private $habilita_equipo;   /* equipo del TKT */
    private $habilita_equipos_usr;   /* equipo del usuario */
    private $habilita_master;   /* es master */
    private $habilita_estados; /* estados habilitados regex , */
    private $habilita_filtroacciones;   /* actionfilter habilitados regex , */

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
     * Script preejecute
     * @var string
     */
    private $script;

    /**
     * Script
     * @var Utils\ITScript
     */
    private $ITScript;

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
     * th sobre el cual se ejecuta accion
     * @var TktH
     */
    private $TH;

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
            $a_propio = "habilita_a_propio in (0,1,3)";  //generado por el usuario logueado
        else
            $a_propio = "habilita_a_propio in (0,2,3)"; //generado por otro usuario

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
            $A = $this->objsCache->get_object(get_class(), $actV["id"]);
            $A->loadTKT($this->getTKT());
            if ($A->check_valid() == 'ok') {
                $ret[$i] = $A;
                $i++;
            }
        }
        return $ret;
    }

    public function load_DB($id) {
        $idInt = intval($id);
        $this->childsPaste = null;
        $this->childsSeted = false;
        if (is_int($idInt) && $idInt > 0) {
            return $this->loadDB_id($idInt);
        } else {
            return $this->loadDB_name($id);
        }
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
        $this->habilita_equipos_usr = trim($tmpU["habilita_equipos_usr"]);
        $this->habilita_perfiles = trim($tmpU["habilita_perfiles"]);
        $this->habilita_a_propio = trim($tmpU["habilita_a_propio"]);
        $this->habilita_abierto = trim($tmpU["habilita_abierto"]);
        $this->habilita_equipo = trim($tmpU["habilita_equipo"]);
        $this->habilita_master = trim($tmpU["habilita_master"]);
        $this->habilita_estados = trim($tmpU["habilita_estados"]);
        $this->habilita_filtroacciones = trim($tmpU["habilita_filtroacciones"]);
        $this->notificacion_param = trim($tmpU["notificacion_param"]);
        $this->notificacion_texto = trim($tmpU["notificacion_texto"]);
        $this->descripcion = trim($tmpU["descripcion"]);
        $this->script = trim($tmpU["script"]);
        $this->form = trim(space_delete($tmpU["form"], array("\t", "\n", "\0", "\x0B")));
        $this->ejecuta = trim($tmpU["ejecuta"]);
        $this->alias = trim($tmpU["alias"]);
        return 'ok';
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
     * Carga y devuelve itform
     * @return string
     */
    private function loadItform() {
        if ($this->itf != NULL) {
            return 'ok';
        }

        if ($this->ejecuta == 'update') {
            if ($this->TH->get_prop('UA') !=
                    $this->getContext()->get_User()->get_prop('usr')
            ) {
                //solo puede actualizar el propio generador
                return 'Error acceso denegado #1';
            }
            $this->itf = $this->TH->getUpdateForm();
            if ($this->itf == null) {
                return 'Error al cargar formulario';
            }
            return 'ok';
        }

        if ($this->form != '') {
            $this->itf = new ITForm();
            if ($this->itf->load_xml($this->form) == false) {
                return 'Error al cargar formulario de la tipificacion.';
            }
        } else {
            $this->itf = null;
        }

        return 'ok';
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
            if($this->habilita_a_propio == 3 && 
                    $l->check_relation('generado_por_equipo_de_usuario', $this->getTKT()) == false){
                return "Esta accion no se puede aplicar a un ticket generado por otro equipo";
            }
        }

        if ($this->TKT->get_prop("UB") || $this->TKT->get_prop("id") == NULL) { // cerrado - no abierto
            if ($this->habilita_abierto == 1)
                return "Esta accion solo se puede aplicar a un ticket abierto";
        }else { // abierto
            if ($this->habilita_abierto == 2)
                return "Esta accion solo se puede aplicar a un ticket no abierto";
        }

        if (!preg_match_array(explode(',', $this->habilita_estados), $this->getTKT()->get_prop('status')
                )) {
            return 'Esta accion no se puede ejecutar en el estado actual del ticket #1' . $this->getTKT()->get_prop('status');
        }
        $tvars = $this->getTKT()->getVars();
        if (!preg_match_array(explode(',', $this->habilita_filtroacciones), $tvars->get_prop('actionfilter')
                )) {
            return 'Esta accion no se puede ejecutar en el estado actual del ticket #2';
        }
        if($tvars->get_prop('actionfilter-blacklist')!=null &&
                in_array($this->get_prop('nombre'), explode(',',$tvars->get_prop('actionfilter-blacklist'))) ) {
            return 'Esta accion no se puede ejecutar en el estado actual del ticket #3.BL';
        }
        if($tvars->get_prop('actionfilter-whitelist')!=null && 
                $tvars->get_prop('actionfilter-whitelist')!=''
                && !in_array($this->get_prop('nombre'), explode(',',$tvars->get_prop('actionfilter-whitelist'))) ) {
            return 'Esta accion no se puede ejecutar en el estado actual del ticket #3.WL';
        }
        if ($this->habilita_equipos_usr != '*' &&
                count(array_intersect(explode(',', $l->get_prop('idsequipos')), explode(',', $this->habilita_equipos_usr))) == 0) {
            return 'Esta accion no esta habilitada a tu equipo';
        }

        return "ok";
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
                $this->script.=PHP_EOL . $TKT->getScriptText();
                return true;
            }
            return false;
        }
        return true;
    }

    /**
     * Carga TH del evento
     * @param TktH
     */
    public function loadTH($TH) {
        $this->TH = $TH;
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
     * Devuelve TH
     * @return TktH
     */
    public function getTH() {
        return $this->TH;
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
        if ($this->get_prop('itf') == null) {  //no requiere formulario esta accion
            return "ok";
        }
        if ($this->get_prop('ejecuta') == 'update' &&
                !Context::getContext()->get_files_count()) {
            $this->itf->setFileCount(count($this->getTH()->get_files()));
            $this->itf->addFileLinkTh($this->getTH());
        } else {
            $this->itf->setFileCount(Context::getContext()->get_files_count());
        }
        $rta = $this->itf->load_values($values, $formname);
        return $rta;
    }

    /**
     * Devuelve resultado del script
     * @return string
     */
    private function ejecuteScript() {
        $this->ITScript = new Utils\ITScript();
        $const = new Utils\Vars('CONST');
        $const->setValue('date', date(USERDATE_READ_DATE));
        $const->setValue('time', date(USERDATE_READ_TIME));
        $const->setValue('datetime', date(USERDATE_READ));
        $globals = new Utils\Vars();
        $grta = $globals->loadFile(ROOT_DIR . '/config/itscript/globals.xml');
        if ($grta) {
            $globals->setRootTag('ITglobal');
            $this->ITScript->addObject('GLOBALS', $globals);
        }
        $this->ITScript->addObject('CONSTANT', $const);
        $this->ITScript->addObject('TMP', new Utils\Vars('TMP'));
        $this->ITScript->addObject('RESPONSE', new Utils\Vars('RESPONSE'));
        $this->ITScript->addObject('TKT', $this->getTKT());
        $this->ITScript->addObject('TKTVAR', $this->getTKT()->getVars());
        $this->ITScript->addObject('USR', $this->getContext()->get_User());
        if ($this->getitform()) {
            $this->ITScript->addObject('ITFORM', $this->getitform());
        }

        $this->ITScript->loadScript($this->script);
        $rta = $this->ITScript->ejecute();
        if ($rta != 'ok') {
            return $rta;
        }
        $rta = $this->getScriptResponse()->get_prop('result');
        if ($rta == '') {
            return 'Error:: Codigo invalido #1';
        }
        $this->itf = $this->ITScript->getObject('ITFORM');
        return $rta;
    }

    /**
     * Devuelve response
     * @return Utils\Vars
     */
    public function getScriptResponse() {
        return $this->ITScript->getObject('RESPONSE');
    }

    /**
     * Ejecuta accion
     * @return array resultado
     */
    public function ejecute() {
        $rta = $this->ejecuteScript();
        if ($rta != 'ok') {
            return array('result' => 'error', 'msj' => $rta);
        }
        $this->getTKT()->setEjecutingAction($this);
        if ($this->get_prop("ejecuta")) {
            $cname = '\\Itracker\\Actions\\'.ucfirst($this->get_prop("ejecuta")).'Action';
            if (!class_exists($cname)) {
                $this->getContext()->getLogger()->critical("Clase no encontrada", array($cname));
                return array("result" => "error", "msj" => "Error al ejecutar.");
            }
            $cAction = new $cname();
            $response = $cAction->go($this);
            if ($response->getResult() != "ok") {
                return $response->toArray();
            }
            $rta = $this->addTKT_H();
            $this->pasteTKTH($rta["obj"]);
            $resposeV=$response->toArray();;
        } else {
            $resposeV["result"] = "ok";
            $rta = $this->addTKT_H();
        }
        $resposeV["tkth"] = $rta["status"];
        $resposeV["sendfiles"] = $resposeV["tkth"];
        $resposeV['postactions'] = $this->postAction();
        return $resposeV;
    }

    /**
     * Ejecuta accion posterior si existe en ITScript
     * post_action, post_action_form(en json), post_action_id
     * @return string
     */
    private function postAction() {
        $valid = 'ok';
        $ItResponse = $this->getScriptResponse();
        $postAction = $ItResponse->get_prop('post_action');
        if ($postAction != '') {
            $rta = $this->getTKT()->ejecute_action($postAction, json_decode($ItResponse->get_prop('post_action_form'), true), $ItResponse->get_prop('post_action_id'));
            if (!is_array($rta)) {
                $valid = $rta;
                $rtaSave = $rta;
            } else {
                $valid = $rta['result'];
                $rtaSave = $rta['result'] . '-' . $rta['msj'];
            }
        }
        if ($valid == 'ok') {
            return 'ok';
        } else {
            $this->getContext()->getLogger()->error('Error en postaccion', array('nombre' => $postAction,
                'form' => $ItResponse->get_prop('post_action_form'),
                'idadj' => $ItResponse->get_prop('post_action_id'),
                'rta' => print_r($rta, true)
            ));
            return $rtaSave;
        }
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
        $this->getTKT()->setVars($this->ITScript->getObject('TKTVAR'));
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
    public function setChilds($childs) {
        $this->childsPaste = $childs;
        $this->childsSeted = true;
    }

    /**
     * Devuelve array de hijos del tkt
     * @return array<Tkt>
     */
    private function getChilds() {
        if ($this->childsSeted) {
            return $this->childsPaste;
        }
        if ($this->getTKT()) {
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
        $rta = $this->loadItform();
        if ($rta != 'ok') {
            return null;
        }
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
                return $this->getitform();
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