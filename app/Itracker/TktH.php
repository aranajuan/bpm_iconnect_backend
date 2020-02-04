<?php

namespace Itracker;

use Itracker\Exceptions\ItFunctionalException;
use Itracker\ResponseElement;

/**
 * Eventos de tickets
 */
class TktH extends ITObject {

    private $id;    /* id del evento */

    /**
     *
     * @var Tkt
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
     * @var ITForm
     */
    private $itform;
    private $idaccion;
    private $objadj_id; /* id del objeto anexo <-valoraccion */

    /**
     * Objeto $objadj_id
     * @var ITObject
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
     * @var Action
     */
    private $accion; /* objeto accion */
    private $idLink;

    function __construct($conn = null) {
        parent::__construct($conn);
        $this->idLink = null;
    }

    function load_DB($id) {
        $this->dbinstance->loadRS("select H.*,D.detalle from TBL_TICKETS_M as H
                        left join TBL_TICKETS_M_DETALLES as D on (H.id=D.idtktm)
                            where H.id=".intval($id)." and H.estado = " . I_ACTIVE);
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->FB != "" && $this->FB != null) {
                return I_DELETED;
            }
            return I_ACTIVE;
        }
        throw new ItFunctionalException('dbobject/load');
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
        $accion = $this->objsCache->get_object("Action", $this->idaccion);
        if ($accion->get_prop('nombre') == "LINK") {
            $this->idLink = $this->id;
            $this->load_DB($this->objadj_id);
            return;
        }
        $this->detalle = $tmpU["detalle"];
        if ($this->detalle != null && $this->detalle != "") {
            $this->itform = new ITForm();
            $this->itform->load_xml($this->detalle);
        } else {
            $this->itform = null;
        }
        $this->accion = $accion;
    }

    /**
     * Es un link
     * @return boolean
     */
    public function isLinked() {
        return $this->idLink != null;
    }

    /**
     * Es una actualizacion
     * @return boolean
     */
    public function isUpdate() {
        if ($this->get_prop('accion') instanceof Action) {
            if (is_numeric($this->get_prop('objadj_id'))) {
                return $this->get_prop('accion')->get_prop('ejecuta') == 'update';
            }
        }
        return false;
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

    /**
     * Devuelve formulario para actualizar
     * @return ITForm
     */
    public function getUpdateForm() {
        $this->loadTKT();
        //si es update buscar form master y cargar datos del update
        $THmaster = $this;
        while ($THmaster->get_prop('accion')->get_prop('ejecuta') == 'update') {
            $THmaster = $THmaster->get_prop('objadj');
        }
        $actOr = $THmaster->get_prop('accion');
        if ($actOr->get_prop('ejecuta') == 'open') {
            //formulario de apertura
            if ($this->TKT) {
                $lst = $this->TKT->get_last();
                $itf = $lst->get_prop('itform');
            }
        } else {
            $itf = $actOr->get_prop('itf');
        }
        if ($itf instanceof ITForm) {
            $itf->load_values($this->get_prop('itform')->getFormArrayLoad());
            $itf->setOutToIn();
        }
        return $itf;
    }

    /**
     * Devuelve TktH que lo actualiza o null si no existe
     * @return TktH|null
     */
    public function getThUpdate() {
        $this->loadTKT();
        $events = $this->TKT->get_tktHObj();
        foreach ($events as $e) {
            if ($e->get_prop('accion')
                            ->get_prop('ejecuta') == 'update' && $e->get_prop('objadj_id') == $this->id
            ) {
                return $e;
            }
        }
        return null;
    }

    /* Inserta nuevo registro y carga ID en el objeto
     */

    function insert_DB() {
        $ssql = "insert into TBL_TICKETS_M(idtkt,idaccion,valoraccion,FA,UA,FB,UB,estado)
             values (" . intval($this->accion->getTKT()->get_prop("id")) . "," .
                intval($this->accion->get_prop("id")) . ",'" .
                strToSQL($this->accion->get_prop("objadj_id")) . "',now(),'"
                . strToSQL($this->getLogged()->get_prop("usr")) . "',NULL,NULL," . I_ACTIVE . ");";

        $this->dbinstance->query($ssql);

        $this->id = $this->dbinstance->get_lastID();
        $itform = $this->accion->getitform();
        if ($itform && $itform->getSaveElCount()) {
            $form = $itform->getSaveDom()->saveXML();
        } else {
            $form = "";
        }

        $this->save_files();

        if (trim($form) == "") { // accion sin formulario
            return;
        }
        /* Agregar a tabla detalles */
        $ssql = "insert into TBL_TICKETS_M_DETALLES (idtktm,detalle)
                        values (" . intval($this->id) . ",'" . strToSQL($form) . "')";

        $this->dbinstance->query($ssql);

    }

    private function loadObjadj() {
        if ($this->objadj_txt != "")
            return;
        $cname = '\\Itracker\\Actions\\' . ucfirst($this->accion->get_prop("ejecuta")) . 'Action';
        if (class_exists($cname)) {
            $cAction = new $cname();
            $response = $cAction->show($this);
        } else {
            $response = null;
        }
        if ($response) {
            $this->objadj = $response->getObj();
            $this->objadj_txt = $response->getTxt();
        } else {
            $this->objadj = null;
            $this->objadj_txt = $this->get_prop("objadj_id");
        }
    }

    /**
     * Devuelve vista del elemento
     * @return ResponseElement
     */
    function getData_H() {

        if ($this->check_access() == false)
            return null;
        $rta = new ResponseElement('th');
		$action = new ResponseElement('action');

		$action->addValue(new ResponseElement('id',$this->get_prop('id')));

        $alias = $this->accion->get_prop("alias");
        $value = $this->get_prop("objadj_txt");
        if ($this->isLinked()) {
            $alias .= " - (en TKT " . $this->get_prop("idtkt") . ")";
        }
        if ($this->isUpdate()) {
            $mm = $this->getFstUpdate();
            $alias = $mm->get_prop('accion')->get_prop('alias') . " (Actualizado)";
            if ($value == '') {
                $value = $mm->get_prop("objadj_txt");
            }
        }
        $action->addValue(new ResponseElement('alias',$alias));
        $action->addValue(new ResponseElement('nombre',$this->accion->get_prop('nombre')));
        $action->addValue(new ResponseElement('value',$value));
        $action->addValue(new ResponseElement('usr',$this->get_prop('ua')));
        $action->addValue(new ResponseElement('date',$this->get_prop('fa')));

        if ($this->getThUpdate() != null) {
            $isupdate = "true";
        } else {
            $isupdate = "false";
        }
        $action->addValue(new ResponseElement('isupdated',$isupdate));
        $action->addValue(new ResponseElement('ejecuta',$this->accion->get_prop('ejecuta')));

        $rta->addValue($action);

        if ($this->get_prop("itform") != null) {
            $itfDom = $this->get_prop("itform")->getViewDom();
            if ($itfDom) {
            	$rta->addValue(new ResponseElement('',$itfDom,ResponseElement::XML));
            } else {
                $this->getContext()->getLogger()->notice('itform sin nada visible', array(
                    'idth' => $this->id
                        )
                );
            }
        }
        $files_h = $this->get_files();
        if ($files_h && count($files_h)) {
            $files = new ResponseElement('files');
            foreach ($files_h as $f) {
            	$files->addValue(new ResponseElement('file',$f,ResponseElement::TEXT));
            }
            $rta->addValue($files);
        }
        return $rta;
    }

    /**
     * Verifica acceso y prepara vista
     * @return boolean
     */
    public function check_access() {
        $this->loadview();

        if ($this->get_prop("UA") == $this->getLogged()->get_prop("usr")) {
            if ($this->itform) {
                $this->itform->set_view(0);
            }
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

        if (!$this->getLogged()->cansee($this->get_UA()) && $this->getLogged()->get_prop('fulladm') != true) {
            return false;
        }

        if ($this->itform) {
            $this->itform->set_view($this->view["vista"]);
        }
        return true;
    }

    /**
     * Carga UA y lo devuelve
     * @return User usuario evento
     */
    private function get_UA() {
        if ($this->UA_o) {
            return $this->UA_o;
        }
        $UA = $this->objsCache->get_object("User", $this->UA,false,true);
        $this->UA_o = $UA;

        return $this->UA_o;
    }

    /**
     * Guarda archivos
     * @return boolean Se guardaron los datos
     */
    private function save_files() {
        $path = $this->getInstance()->get_prop("archivos_externos");
        $path.="/adjuntos";
        $files = $this->accion->getFiles();
        foreach ($files as $name => $data) {
            $fileexp = explode(".", $name);
            $count = explode("_", $fileexp[0]);
            $fname = $path . "/" . $this->id . "_" . $count[1] . "." . $fileexp[1];
            $fileO = fopen($fname, "w");
            if($fileO == FALSE){
              throw new Exceptions\ItErrorException('th/savefile','error al generar',
              array('path'=>$fname));
            }
            if (fwrite($fileO, base64_decode($data)) == FALSE) {
                throw new Exceptions\ItErrorException('th/savefile','error al escribir',
                array('path'=>$fname));
            }
            fclose($fileO);
            if (!file_exists($fname)) {
                throw new Exceptions\ItErrorException('th/savefile','error al verificar',
                array('path'=>$fname));
            }
        }
    }

    /**
     * @return  int id de donde leer archivos
     */
    public function get_idFiles() {
        if ($this->itform && $this->itform->getFileLinkTh()) {
            $idTH = $this->itform->getFileLinkTh();
            $thUP = $this->objsCache->get_object("TktH", $idTH);
            return $thUP->get_idFiles();
        } else {
            return $this->id;
        }
    }

    /**
     * Devuelve nombres de archivos
     * @return array<string> filesnames
     */
    public function get_files() {

        if (intval($this->view["archivo_descarga"]) != 1) {
            return null;
        }

        $path = $this->getInstance()->get_prop("archivos_externos") . "/adjuntos";

        $idTH = $this->get_idFiles();

        if (is_dir($path)) {

            $dh = opendir($path);
            if (!$dh) {
                return null;
            }

            $list = array();
            $count = 0;
            while (($file = readdir($dh)) !== false) {
                $fileV = explode("_", $file);

                if ($fileV[0] == $idTH) {
                    $list[$count] = $file;
                    $count++;
                }
            }
            closedir($dh);
            return $list;
        }
        return null;
    }

    /**
     * Obtiene primer evento, el no actualizado.
     * @return TktH
     */
    public function getFstUpdate() {
        if (!$this->isUpdate()) {
            return $this;
        }
        $THm = $this->get_prop('objadj');
        return $THm->getFstUpdate();
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
                throw new ItFunctionalException('prop/getprop');
        }
    }

    /**
     * Carga ticket
     * @return string
     */
    private function loadTKT() {
        if ($this->TKT == null) {
            $this->TKT = $this->objsCache->get_object("Tkt", $this->get_prop('idtkt'));
        }
    }

    /**
     * Carga ticket y vista si es necesario
     */
    private function loadview() {
        if ($this->view == null) {
            $this->loadTKT();
            $this->view = $this->TKT->get_prop("view");
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
        $this->dbinstance->query($ssql);
    }

    public function update_DB() {

    }

}

?>
