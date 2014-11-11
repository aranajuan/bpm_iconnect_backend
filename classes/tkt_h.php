<?php

require_once 'classes/action.php';


require_once 'classes/abstract/itobject.php';

/**
 * Eventos de tickets
 */
class TKT_H extends itobject {

    private $id;    /* id del evento */
    private $idtkt; /* id del ticket del evento*/
    private $TKT;   /* objeto ticket */
    private $view;  /* vista de la accion */
    private $idaccion;  /* id de la accion */
    private $valoraccion;   /* valor de la accion */
    private $FA;    /* fecha de generacion */
    private $UA;    /* usuario generacion */
    private $FB;    /* fecha baja */
    private $UB;    /* usuario baja */
    private $estado;    /* estado de la accion */
    
    /* tickets_m_details  */
    
    private $detalle;   /* detalle de la accion */
    private $filesHTML; /* html de los archivos adjuntos */
    private $detalle_Show; /* comentario a mostrar */

    /* accion */
    private $accion; /* objeto accion */

    function load_DB($id, $TKT = null) {

        $this->error = FALSE;
        $this->loadRS("select H.*,D.detalle from TBL_TICKETS_M as H 
                        left join TBL_TICKETS_M_DETALLES as D on (H.id=D.idtktm) 
                            where H.id=$id and H.estado = " . I_ACTIVE);
        if ($this->noEmpty && $this->cReg == 1) {
            $tmpU = $this->get_vector();
            $this->TKT = $TKT;
            return $this->load_DV($tmpU);
        } else {
            $this->error = TRUE;
        }
        return "error " . $id;
    }

    function load_VEC($tmpU) {
        $this->accion = new ACTION();
        if (isset($tmpU["nombreaccion"])) {
            if ($this->accion->loadDB_name($tmpU["nombreaccion"]) != "ok") {
                return "Evento invalido";
            }
            $this->idaccion = $this->accion->get_prop("id");
        } else {
            $this->idaccion = $tmpU["idaccion"];
            if ($this->accion->loadDB_id($this->idaccion) != "ok") {
                return "Evento invalido";
            }
        }
        $this->idtkt = $tmpU["idtkt"];
        $this->detalle = $tmpU["detalle"];
        $this->valoraccion = $tmpU["valoraccion"];
        $this->detalle_Show = null;
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
        $this->estado = $tmpU["estado"];
        $this->load_VEC($tmpU);
        if ($this->TKT == null) {
            $TKT = new TKT();
            if ($TKT->load_DB($this->idtkt) == "ok") {
                $this->TKT = $TKT;
            } else {
                $this->idtkt=null;
                return "Error al cargar tkt.";
            }
        }
        $this->idtkt=$TKT->get_prop("id");
        return "ok";
    }

    /* Elimina registros abiertos */

    private function delete_open() {

        $l = $GLOBALS[UL];
        $ssql = "update TBL_TICKETS_M set FB=now(), UB=" . $l->get_prop("id") . " where FB is NULL and idtkt=" . $this->idtkt;
        return $this->query($ssql);
    }

    /* Inserta nuevo registro y carga ID en el objeto
     */

    function insert_DB() {
        if ($this->delete_open())
            return "<b>Error (TKT_H - Delete):</b>" . $this->details;
        $l = $GLOBALS[UL];
        $ssql = "insert into TBL_TICKETS_M(idtkt,idaccion,valoraccion,FA,UA,FB,UB)
             values (" . $this->idtkt . "," . $this->idaccion . "," . $this->valoraccion . ",now()," . $l->get_prop("id") . ",NULL,NULL);";
        if ($this->query($ssql))
            return "<b>Error(TKT_H - Insert):</b>" . $this->details;
        else {
            $this->id = $this->get_lastID();
            $this->detalle = trim($this->detalle);
            if ($this->detalle == "" || $this->detalle == NULL)
                return "ok";
            /* Agregar a tabla detalles */
            $ssql = "insert into TBL_TICKETS_M_DETALLES (idtktm,detalle)
                        values (" . $this->id . ",'" . strToSQL($this->detalle) . "')";

            if ($this->query($ssql))
                return "<b>Error no se guardaron los detalles pero si se avanzo el tkt:</b>" . $this->details;
            $this->move_files();
            return "ok";
        }
    }

    private function move_files() {

        $l = $GLOBALS[UL];
        $dir = FILEUP_TMP_FOLDER;
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if (strpos("-" . $file, (string) $l->get_prop("id"))) {
                        $fileV = explode(".", $file);
                        $fileNV = explode("_", $fileV[0]);
                        rename($dir . "/" . $file, EXTERNAL_FILES . "/" . FILEUP_ATTACH_FOLDER . "/" . $this->id . "_" . $fileNV[1] . "." . $fileV[1]);
                    }
                }
                closedir($dh);
            }
        }

        $dir = FILEUP_TMP_FOLDER_THUMB;
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if (strpos("-" . $file, (string) $l->get_prop("id"))) {
                        $fileV = explode(".", $file);
                        $fileNV = explode("_", $fileV[0]);
                        rename($dir . "/" . $file, EXTERNAL_FILES . "/" . FILEUP_ATTACH_FOLDER_THUMN . "/" . $this->id . "_" . $fileNV[1] . "." . $fileV[1]);
                    }
                }
                closedir($dh);
            }
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
     * Devuelve html con vista del elemento
     * @param array $view   de get view usuario
     */
    function get_html() {
        if ($this->check_access() == false)
            return "";
        return $this->accion->get_view($this, true);
    }

    function check_access() {
        $this->view = $this->TKT->get_prop("view");
        if ($this->get_prop("UA") == $GLOBALS[UL]->get_prop("id")) {
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
