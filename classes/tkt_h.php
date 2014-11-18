<?php

require_once 'classes/action.php';
require_once 'classes/abstract/itobject.php';

/**
 * Eventos de tickets
 */
class TKT_H extends itobject {

    private $id;    /* id del evento */
    private $TKT;   /* objeto ticket */
    private $view;  /* vista de la accion */
    private $FA;    /* fecha de generacion */
    private $UA;    /* usuario generacion */
    private $FB;    /* fecha baja */
    private $UB;    /* usuario baja */
    private $detalle;
    private $idaccion;
    private $valoraccion;
    private $estado;    /* estado de la accion */
    
    /**
     *
     * @var ACTION 
     */
    private $accion; /* objeto accion */

    
    
    function load_DB($id, $TKTvista = null) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select H.*,D.detalle from TBL_TICKETS_M as H 
                        left join TBL_TICKETS_M_DETALLES as D on (H.id=D.idtktm) 
                            where H.id=$id and H.estado = " . I_ACTIVE);
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->view = $TKTvista;
            return $this->load_DV($tmpU);
        } else {
            $this->error = TRUE;
        }
        return "error " . $id;
    }

    /**
     * Carga la accion que se va a ejecutar
     * @param type $tmpU
     */
    function load_VEC($tmpU) {
        $this->accion = $tmpU;
    }

    function load_detailsShow() {

        $this->view = $this->TKT->get_prop("view");

        $this->detalle_Show = $this->detalle;

        /* verificar master */

        if ($this->get_prop("UA") != $GLOBALS[UL]->get_prop("id")) { // solo verificar accesos si no es movimiento del usr
            if (!$this->check_access()) {
                $this->detalle_Show = null;
                return false;
            }


            //verificar cifrado
            if ($this->view["vista"] == 2) {
                $this->detalle_Show = preg_replace("/[0-9\-\.]{5,}/", "*****", $this->detalle);
            } else {
                $this->detalle_Show = $this->detalle;
            }

            //verificar archivos
            if ($this->view["archivo_vistaprevia"] == 1) {

                /* si hay detalle y estan visible los archivos los carga */
                if ($this->detalle) {
                    $this->load_files();
                }

                if ($this->view["archivo_descarga"] == 1) {
                    $this->detalle_Show .= $this->filesHTML; //acceso full
                } else {
                    //puede ver pero no descargar se eliminan links
                    $this->detalle_Show .= preg_replace("/href='\S*'/", "href='javascript:alert_p(\"No tienes permiso para descargar.\",\"Error acceso\")'", $this->filesHTML);
                }
            }
        } else {

            /* movimiento del usuario - muestra todo */
            if ($this->detalle) {
                $this->load_files();
            }
            $this->detalle_Show = $this->detalle . $this->filesHTML;
        }
        //$this->detalle_Show.="( relacion: " . $this->view["nombre"] . ")";
        return true;
    }

    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->FA = $tmpU["FA"];
        $this->UA = $tmpU["UA"];
        $this->FB = $tmpU["FB"];
        $this->UB = $tmpU["UB"];
        $this->idaccion = $tmpU["idaccion"];
        $this->valoraccion = $tmpU["valoraccion"];
        $this->estado = $tmpU["estado"];
        $accion= new ACTION();
        $accion->load_DB($this->idaccion);
        $this->detalle= $tmpU["detalle"];
        $this->accion=$accion;
        return "ok";
    }

    /* Elimina registros abiertos */
    private function delete_open() {
        $ssql = "update TBL_TICKETS_M set FB=now(), UB='" . strToSQL($this->getLogged()->get_prop("usr")) . "' where FB is NULL and idtkt=" . intval($this->accion->getTKT()->get_prop("id"));
        return $this->dbinstance->query($ssql);
    }

    /* Inserta nuevo registro y carga ID en el objeto
     */
    function insert_DB() {
        if ($this->delete_open()){
            return "TKTH_Delete" . $this->dbinstance->details;
        }
        
        $ssql = "insert into TBL_TICKETS_M(idtkt,idaccion,valoraccion,FA,UA,FB,UB)
             values (" . intval($this->accion->getTKT()->get_prop("id")) . "," .
                intval($this->accion->get_prop("id")) . ",'" .
                strToSQL($this->accion->get_prop("value")) . "',now(),'" 
                . strToSQL($this->getLogged()->get_prop("usr")) . "',NULL,NULL);";
        
        if ($this->dbinstance->query($ssql)){
            return "TKTH_Insert: " . $this->dbinstance->details;
        }
        else {
            $this->id = $this->dbinstance->get_lastID();
            $form=$this->accion->getitform()->get_output();
            $this->save_files();
            if (!$this->accion->get_prop("formulario") || trim($form)==""){ // accion sin formulario
                return "ok";
            }
            /* Agregar a tabla detalles */
            $ssql = "insert into TBL_TICKETS_M_DETALLES (idtktm,detalle)
                        values (" . intval($this->id ). ",'" . strToSQL($form) . "')";

            if ($this->dbinstance->query($ssql)){
                return "THTH_D_insert: Error no se guardaron los detalles pero si se avanzo el tkt:" . $this->dbinstance->details;
            }
            return "ok";
        }
    }

    /**
     * Guarda archivos
     */
    private function save_files() {
        $path = $this->getInstance()->get_prop("archivos_externos");
        $path.="/adjuntos";
        $files=$this->accion->getFiles();
        foreach($files as $f){
            $fileexp = explode(".", $f["name"]);
            $count= explode("_",$fileexp[0]);
            $fname=$path."/".$this->id."_".$count[1].".".$fileexp[1];
            $fileO = fopen($fname, "w");
            fwrite($fileO,  base64_decode($f["data"]));
        }
    }

    private function load_files() {
        $this->filesHTML = "";
        $count = 0;
        $tmp = "<div style='height:35px;'>";
        $dir = EXTERNAL_FILES . "/" . FILEUP_ATTACH_FOLDER . "/";
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    $fileV = explode("_", $file);
                    if ($fileV[0] == $this->id) {
                        $fileVV = explode(".", $file);
                        if (file_exists(EXTERNAL_FILES . "/" . FILEUP_ATTACH_FOLDER_THUMN . "/" . $file))
                            $thumb = "download.php?path=" . FILEUP_ATTACH_FOLDER_THUMN . "&file=" . $file;
                        else {
                            if (file_exists(EXTERNAL_FILES . "/" . FILEUP_ATTACH_FOLDER_THUMN . "/" . $fileVV[0] . ".jpg")) {
                                $thumb = "download.php?path=" . FILEUP_ATTACH_FOLDER_THUMN . "&file=" . $fileVV[0] . ".jpg";
                            } else {
                                $thumb = HIMG_DIR . "/thumbnail/" . $fileVV[count($fileVV) - 1] . ".png";
                            }
                        }
                        $count++;
                        $tmp.="<div style='position:relative;display:inline;padding-right:10px;'><a href='download.php?path=" . FILEUP_ATTACH_FOLDER . "&file=" . $file . "' target='_blank'><img src='" . $thumb . "' height='30' /></a></div>";
                    }
                }
                closedir($dh);
            }
        }
        $tmp.="</div>";
        if ($count) {
            $this->filesHTML = $tmp;
        }
    }

    /**
     * Devuelve xml con vista del elemento
     * @return DOMDocument
     */
    function getXML_H() {
        if ($this->check_access() == false)
            return null;
        $el= new DOMDocument();
        
        $element = $el->createElement("element");
        $action = $el->createElement("action");
        $action->appendChild($el->createElement("alias", $this->accion->get_prop("alias")));
        $action->appendChild($el->createElement("ejecute", $this->accion->get_prop("ejectue")));
        $action->appendChild($el->createElement("value", $this->get_prop("valoraccion")));
        $element->appendChild($action);
        $element->appendChild($el->createElement("form", $this->get_prop("detalle")));
        //cargar archivos
        
        return $element;
    }

    function check_access() {
        if ($this->get_prop("UA") == $this->getLogged()->get_prop("usr")) {
            return true;
        }
        if ($this->view["tipos_eventos"][0] != "*") {
            if (!(in_array($this->accion->get_prop("tipo"), $this->view["tipos_eventos"]))) {
                return false;
            }
        }
        return true;
    }

    function get_prop($property) {
        switch ($property) {
            case 'id':
                return $this->id;
            case 'idtkt':
                return $this->idtkt;
            case 'TKT':
                return $this->TKT;
            case 'valoraccion':
                return $this->valoraccion;
            case 'accion':
                return $this->accion;
            case 'detalle':
                if ($this->detalle_Show == null)
                    $this->load_detailsShow();
                return $this->detalle_Show;
            case 'UA':
                return $this->UA;
            case 'UA_o':
                $ua_o = new USER();
                if ($ua_o->load_DB($this->UA) == "ok")
                    return $ua_o;
                else
                    return NULL;
            case 'UB':
                return $this->UB;
            case 'FA':
                return STRdate_format($this->FA, DBDATE_READ, USERDATE_READ);
            case 'FB':
                if ($this->FB == NULL)
                    return NULL;
                return STRdate_format($this->FB, DBDATE_READ, USERDATE_READ);
            default:
                return "Propiedad invalida.";
        }
    }

    public function check_data() {
        
    }

    public function delete_DB() {
        
    }

    public function update_DB() {
        
    }

}

?>
