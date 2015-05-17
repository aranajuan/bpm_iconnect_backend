<?php

require_once 'classes/action.php';
require_once 'classes/abstract/itobject.php';

/**
 * Eventos de tickets
 */
class TKT_H extends itobject {

    private $id;    /* id del evento */

    /**
     *
     * @var TKT 
     */
    private $TKT;   /* objeto ticket */
    private $idtkt;
    private $view;  /* vista de la accion */
    private $FA;    /* fecha de generacion */
    private $UA;    /* usuario generacion */
    private $FB;    /* fecha baja */
    private $UB;    /* usuario baja */
    private $detalle;

    /**
     * Dom de detalle
     * @var itform
     */
    private $itform;
    private $idaccion;
    private $objadj_id; /* id del objeto anexo <-valoraccion */

    /**
     * Objeto $objadj_id
     * @var itobject
     */
    private $objadj;

    /**
     * Texto de $objadj_id
     * @var string
     */
    private $objadj_txt;
    private $estado;    /* estado de la accion */
    private $idteam;    /* equipo que genero el evento */
    private $UA_o;

    /**
     *
     * @var ACTION 
     */
    private $accion; /* objeto accion */
    
    private $idLink;

    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select H.*,D.detalle from TBL_TICKETS_M as H 
                        left join TBL_TICKETS_M_DETALLES as D on (H.id=D.idtktm) 
                            where H.id=$id and H.estado = " . I_ACTIVE);
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            return $this->load_DV($tmpU);
        } else {
            $this->error = TRUE;
        }
        return "error " . $id;
    }

    /**
     * Establece perfil vista del evento
     * @param array $TKTvista
     */
    public function set_view($TKTvista) {
        $this->view = $TKTvista;
    }

    /**
     * Carga vector desde base
     * @param type $tmpU
     * @return string
     */
    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->FA = $tmpU["FA"];
        $this->UA = $tmpU["UA"];
        $this->FB = $tmpU["FB"];
        $this->UB = $tmpU["UB"];
        $this->idaccion = $tmpU["idaccion"];
        $this->estado = $tmpU["estado"];
        $this->idtkt = $tmpU["idtkt"];
        $this->objadj_id = $tmpU["valoraccion"];
        $accion = $this->objsCache->get_object("ACTION", $this->idaccion);
        if($accion->get_prop('nombre')=="LINK"){
            $this->idLink=$this->id;
            return $this->load_DB($this->objadj_id);
        }
        $this->detalle = $tmpU["detalle"];
        if ($this->detalle != null && $this->detalle != "") {
            $this->itform = new itform();
            if ($this->itform->load_xml($this->detalle) == false) {
                return "Error al cargar formulario " . $this->id;
            }
        } else {
            $this->itform = null;
        }
        $this->accion = $accion;
        if ($this->FB != "" && $this->FB != null) {
            return "eliminado";
        }
        return "ok";
    }

    /**
     * Es un link
     * @return boolean
     */
    public function isLinked(){
        return $this->idLink!=null;
    }
    
    /**
     * Setea id del equipo
     * @param int $id
     */
    public function set_idteam($id) {
        $this->idteam = $id;
    }

    /**
     * Carga la accion que se va a ejecutar
     * @param type $tmpU
     */
    function load_VEC($tmpU) {
        $this->accion = $tmpU;
    }

    /* Inserta nuevo registro y carga ID en el objeto
     */

    function insert_DB() {
        $ssql = "insert into TBL_TICKETS_M(idtkt,idaccion,valoraccion,FA,UA,FB,UB,estado)
             values (" . intval($this->accion->getTKT()->get_prop("id")) . "," .
                intval($this->accion->get_prop("id")) . ",'" .
                strToSQL($this->accion->get_prop("objadj_id")) . "',now(),'"
                . strToSQL($this->getLogged()->get_prop("usr")) . "',NULL,NULL," . I_ACTIVE . ");";

        if ($this->dbinstance->query($ssql)) {
            return "TKTH_Insert: " . $this->dbinstance->details;
        } else {
            $this->id = $this->dbinstance->get_lastID();
            $itform = $this->accion->getitform();
            if ($itform) {
                $form = $itform->get_output();
            } else {
                $form = "";
            }
            $this->save_files();
            if (!$this->accion->get_prop("formulario") || trim($form) == "") { // accion sin formulario
                return "ok";
            }
            /* Agregar a tabla detalles */
            $ssql = "insert into TBL_TICKETS_M_DETALLES (idtktm,detalle)
                        values (" . intval($this->id) . ",'" . strToSQL($form) . "')";

            if ($this->dbinstance->query($ssql)) {
                return "THTH_D_insert: Error no se guardaron los detalles pero si se avanzo el tkt:" . $this->dbinstance->details;
            }
            return "ok";
        }
    }

    private function loadObjadj() {
        if ($this->objadj_txt != "")
            return;
        if (file_exists(INCLUDE_DIR . "/actions/show/" . $this->accion->get_prop("ejecuta") . ".php")) {
            $obCI = OBJECTCACHE::getInstance();
            $val = include INCLUDE_DIR . "/actions/show/" . $this->accion->get_prop("ejecuta") . ".php";
            $this->objadj = $val[0];
            $this->objadj_txt = $val[1];
        } else {
            $this->objadj = null;
            $this->objadj_txt = $this->get_prop("objadj_id");
        }
    }

    /**
     * Devuelve xml con vista del elemento
     * @return DOMElement
     */
    function getXML_H() {

        if ($this->check_access() == false)
            return null;
        $element = new DOMDocument();

        $elementData = $element->createElement("th");

        $action = $element->createElement("action");
        $action->appendChild($element->createElement("id", $this->get_prop("id")));
        if($this->isLinked()){
            $action->appendChild($element->createElement("alias", $this->accion->get_prop("alias")." - (en TKT ".$this->get_prop("idtkt").")"));
        }else{
            $action->appendChild($element->createElement("alias", $this->accion->get_prop("alias")));
        }
        $action->appendChild($element->createElement("nombre", $this->accion->get_prop("nombre")));
        $action->appendChild($element->createElement("value", $this->get_prop("objadj_txt")));
        $action->appendChild($element->createElement("usr", $this->get_prop("UA")));
        $action->appendChild($element->createElement("date", $this->get_prop("FA")));
        $action->appendChild($element->createElement("ejecuta", $this->accion->get_prop("ejecuta")));
        $elementData->appendChild($action);

        if ($this->get_prop("itform") != null) {
            $nodo = $element->importNode(
                    $this->get_prop("itform")->get_outputDOM()->documentElement, true);
            $elementData->appendChild($nodo);
        }
        $files_h = $this->get_files();
        if ($files_h && count($files_h)) {
            $files = $element->createElement("files");
            foreach ($files_h as $f) {
                $files->appendChild($element->createElement("file", $f));
            }
            $elementData->appendChild($files);
        }
        return $elementData;
    }

    /**
     * Verifica acceso y prepara vista
     * @return boolean
     */
    public function check_access() {
        $this->loadview();

        if ($this->get_prop("UA") == $this->getLogged()->get_prop("usr")) {
            return true;
        }

        if ($this->view["tipos_eventos"][0] != "*") {
            if (!(in_array($this->accion->get_prop("tipo"), $this->view["tipos_eventos"]))) {
                return false;
            }
        }

        if ($this->get_UA() == null) {
            return false;
        }

        if (!$this->getLogged()->cansee($this->get_UA())) {
            return false;
        }

        if ($this->itform) {
            $this->itform->set_view($this->view["vista"]);
        }
        return true;
    }

    /**
     * Carga UA y lo devuelve
     * @return USER usuario evento
     */
    private function get_UA() {
        if ($this->UA_o) {
            return $this->UA_o;
        }
        $UA = $this->objsCache->get_object("USER", $this->UA);
        if ($this->objsCache->get_status("USER", $this->UA) == "ok") {
            $this->UA_o = $UA;
            return $this->UA_o;
        }
        return null;
    }

    /**
     * Guarda archivos
     */
    private function save_files() {
        $path = $this->getInstance()->get_prop("archivos_externos");
        $path.="/adjuntos";
        $files = $this->accion->getFiles();
        foreach ($files as $f) {
            $fileexp = explode(".", $f["name"]);
            $count = explode("_", $fileexp[0]);
            $fname = $path . "/" . $this->id . "_" . $count[1] . "." . $fileexp[1];
            $fileO = fopen($fname, "w");
            fwrite($fileO, base64_decode($f["data"]));
        }
    }

    /**
     * @return array<string> filesnames
     */
    private function get_files() {

        if (intval($this->view["archivo_descarga"]) != 1) {
            return null;
        }

        $path = $this->getInstance()->get_prop("archivos_externos") . "/adjuntos";

        if (is_dir($path)) {

            $dh = opendir($path);
            if (!$dh) {
                return null;
            }

            $list = array();
            $count = 0;
            while (($file = readdir($dh)) !== false) {
                $fileV = explode("_", $file);

                if ($fileV[0] == $this->id) {
                    $list[$count] = $file;
                    $count++;
                }
            }
            closedir($dh);
            return $list;
        }
        return null;
    }

    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return $this->id;
            case 'idtkt':
                return $this->idtkt;
            case 'tkt':
                return $this->TKT;
            case 'objadj_id':
                return $this->objadj_id;
            case 'objadj_txt':
                $this->loadObjadj();
                return $this->objadj_txt;
            case 'objadj':
                $this->loadObjadj();
                return $this->objadj;
            case 'accion':
                return $this->accion;
            case 'itform':
                if (!$this->check_access())
                    return null;
                if ($this->itform == null)
                    return null;
                return $this->itform;
            case 'ua':
                return $this->UA;
            case 'ua_o':
                return $this->get_UA();
            case 'ub':
                return $this->UB;
            case 'fa':
                return STRdate_format($this->FA, DBDATE_READ, USERDATE_READ);
            case 'fb':
                if ($this->FB == NULL)
                    return NULL;
                return STRdate_format($this->FB, DBDATE_READ, USERDATE_READ);
            default:
                return "Propiedad invalida.";
        }
    }

    /**
     * Carga ticket y vista si es necesario
     */
    private function loadview() {
        if ($this->view == null) {
            if ($this->TKT == null) {
                $this->TKT = $this->objsCache->get_object("TKT", $this->get_prop("idtkt"));
                if ($this->objsCache->get_status("TKT", $this->get_prop("idtkt")) != "ok") {
                    echo "error TKT" . $this->get_prop("idtkt");
                    $this->view = null;
                }
                $this->view = $this->TKT->get_prop("view");
            } else {
                $this->view = $this->TKT->get_prop("view");
            }
        }
    }

    /**
     * Puede descargar
     * @return boolean
     */
    public function candownload() {
        $this->loadview();
        return (intval($this->view["archivo_descarga"]) == 1 && $this->check_access());
    }

    public function check_data() {
        
    }

    public function delete_DB() {
        $ssql = "update TBL_TICKETS_M set FB=now(), UB='" . strToSQL($this->getLogged()->get_prop("usr")) . "' where id=" . intval($this->get_prop("id"));
        return $this->dbinstance->query($ssql);
    }

    public function update_DB() {
        
    }

}

?>