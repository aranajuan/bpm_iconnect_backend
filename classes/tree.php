<?php

require_once 'classes/db.php';
require_once 'classes/question.php';
require_once 'classes/option.php';
require_once 'classes/user.php';
require_once 'classes/tkt.php';

class TREE extends DATOS {

    private $path;
    private $path_pos;
    private $path_max;
    private $path_obj;
    private $deleted;
    private $critico;
    private $critico_v;

    /*
     * formato:  'rut:iddireccion-idsistema-idopcion1-idopcion2-....
     * verifica formato
     * carga objetos
     */

    function load_path($path, $crypt = 0) {
        $this->path_pos = 0;
        $this->path_obj = NULL;
        $this->deleted = 0;
        if ($path == "") {
            return "ok";
        }
        if ($crypt) {
            $path = Encrypter::decrypt($path);
        }
        $this->path = explode("-", $path);
        return $this->check_valid();
    }

    function is_active() {
        return !$this->deleted;
    }

    private function check_valid() {
        $this->path_max = count($this->path) - 2;
        for ($i = 0; $i < $this->path_max; $i++) {
            if (!is_numeric(substr($this->path[$i], 1))) {
                $tmp = implode("-", $this->path);
                $this->path = NULL;
                $this->path_max = 0;
                return "Arbol invalido ('$tmp')";
            }
        }

        return $this->load_objects();
    }

    private function load_objects() {
        start_measure("OBJ:TREE:load_objects");
        $this->path_obj = NULL;
        for ($i = 0; $i <= $this->path_max; $i++) {
            switch (substr($this->path[$i], 0, 1)) {
                case "D":
                    $o = new DIVISION();
                    break;
                case "S":
                    $o = new SYSTEM();
                    break;
                case "O":
                    $o = new OPTION();
                    break;
                default:
                    return "Error al cargar un objeto del arbol - Default(id " . $this->path[$i] . " - pos $i)";
            }
            $rta = $o->load_DB(substr($this->path[$i], 1));
            if ($rta != "error") {
                $this->path_obj[$i] = $o;
            } else {
                return "Error al cargar un objeto del arbol (id " . $this->path[$i] . " - pos $i - $rta)";
            }
            if ($rta == "eliminado") {
                $this->deleted = 1;
            }
        }
        $this->load_critic();
        show_measure("OBJ:TREE:load_objects");
        return "ok";
    }

    private function load_critic() {

        $i = 0;
        $this->critico_v = NULL;
        $this->critico = "";
        foreach ($this->path_obj as $o) {
            $critico = $o->get_prop("texto_critico");
            if ($critico != "Propiedad invalida." && $critico != NULL) {
                $this->critico.="-" . $critico;
                $this->critico_v[$i] = $o;
                $i++;
            }
        }
        if ($this->critico == "") {
            $this->critico = NULL;
        }
        else
            $this->critico = substr($this->critico, 1);
    }

    /**
     * vector de TKTS similares
     */
    function get_similar() {
        if (!$this->critico_v) {
            $this->load_critic();
        }
        if (!$this->critico_v) {
            return NULL;
        }
        $criticVC = explode("-", $this->critico);
        $ssql = "
            select id from TBL_TICKETS where idmaster is null and UB is null and origen like 'D%-S" . $this->get_system()->get_prop("id") . "-%'"; // todos los tkts del sistema abiertos
        $db = new DATOS();
        $db->loadRS($ssql);
        if (!$db->noEmpty) {
            return NULL;
        }
        $i = 0;
        $tktV = array();
        while ($tm = $db->get_vector()) {
            $tkt = new TKT();
            if ($tkt->load_DB($tm["id"]) == "ok") {
                //verificar textos criticos y comparar con actual
                $tkt->load_critic();
                $countC = count(array_intersect($criticVC, explode("-", $tkt->get_critic())));
                if ($countC) {
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

    /**
     * Devuelve textos criticos
     * 
     */
    function get_critic() {
        return $this->critico;
    }

    function get_system() {

        if ($this->path_max < 1) {
            return NULL;
        }

        return $this->path_obj[1];
    }

    function get_division() {
        if (count($this->path_obj) == 0) {
            return NULL;
        }

        return $this->path_obj[0];
    }

    /**
     *  Devuelve array con respuestas previas<br/>
     *  null - sin respuestas previas<br/>
     * array => title => string <br/>
     *       => option => string <br/>
     *       => path => string <br/> 
     */
    function get_tree_history() {
        $rta = array();
        if (is_array($this->path) && count($this->path) >= 1) {
            for ($i = 0; $i <= $this->path_max; $i++) {
                switch ($i) {
                    case 0:
                        $rta[$i]["title"] = "Area";
                        $rta[$i]["option"] = $this->get_division()->get_prop("nombre");
                        $rta[$i]["path"] = "D" . $this->get_division()->get_prop("id") . "-";
                        break;
                    case 1:
                        $rta[$i]["title"] = "Inconveniente";
                        $rta[$i]["option"] = $this->get_system()->get_prop("nombre");
                        $rta[$i]["path"] = $rta[$i - 1]["path"] . "S" . $this->get_system()->get_prop("id") . "-";
                        break;
                    default:
                        $q = new QUESTION();
                        $o = $this->path_obj[$i];
                        $q->load_DB($o->get_prop("idpregunta"));
                        $rta[$i]["title"] = $q->get_prop("texto");
                        $rta[$i]["option"] = $o->get_prop("texto");
                        $rta[$i]["path"] = $rta[$i - 1]["path"] . "O" . $o->get_prop("id") . "-";
                        break;
                }
            }
            return $rta;
        }
        return NULL;
    }

    /**
     * Devuelve array con pregunta y opciones en el origen establecido<br/> 
     * Title => string<br/>
     * back => string (cifrado)/ null / 'none'<br/>
     * actual => string (cifrado)<br/>
     * options => array => Title<br/>
     *                  => Destiny (cifrado)<br/>
     *                  => End (fin de arbol)<br/>
     * error => string<br/>
     * object => cuando es ultima opcion [OPTION] <br/>
     */
    function get_tree_options() {
        $rta = array();
        if (!is_array($this->path)) { // primer opcion, se muestran las direcciones
            //limpiar temporales del usuario
            //verificar si el usuario pertenece solo a una direccion se ingresa directamente
            $tms = $GLOBALS[UL]->get_prop("equiposobj");
            if ($tms != null && count($tms)) {
                $dir = 0;
                foreach ($tms as $t) {
                    if ($dir == 0) {
                        $dir = $t->get_prop("iddireccion");
                    } else {
                        if ($t->get_prop("iddireccion") != $dir) {
                            $dir = -1;
                            break;
                        }
                    }
                }
            }

            if ($dir > 0) {
                $this->load_path("D" . $dir . "-", 0);
            } else {
                $divs = new DIVISION();
                $divsV = $divs->list_all();
                $rta["title"] = "Seleccione un area";
                $rta["back"] = "none";
                $i = 0;
                foreach ($divsV as $d) {
                    $rta["options"][$i]["title"] = $d->get_prop("nombre");
                    $rta["options"][$i]["destiny"] = Encrypter::encrypt("D" . $d->get_prop("id") . "-");
                    $rta["options"][$i]["end"] = false;
                    $i++;
                }
                return $rta;
            }
        }
        $actualPATH = implode("-", $this->path); //ruta actual, para generar destiny
        $rta["actual"] = Encrypter::encrypt($actualPATH);
        $actualO = $this->get_last();
        $backPATH = Array();
        for ($i = 0; $i < $this->path_max; $i++) {
            $backPATH[$i] = $this->path[$i];
        }
        if (count($backPATH)) {
            $rta["back"] = Encrypter::encrypt(implode("-", $backPATH) . "-");
        } else {
            $rta["back"] = "";
        }
        switch ($this->path_max) {
            case 0:
                // cargar sistemas
                $rta["title"] = "Seleccione una opcion";
                $actualO->load_systems();
                $ss = $actualO->get_prop('sistemasobj');
                $i = 0;
                foreach ($ss as $s) {
                    $rta["options"][$i]["title"] = $s->get_prop("nombre");
                    $rta["options"][$i]["destiny"] = Encrypter::encrypt($actualPATH . "S" . $s->get_prop("id") . "-");
                    $rta["options"][$i]["end"] = false;
                    $i++;
                }
                return $rta;
            case 1:
                // cargar p_pregunta - origen sistemas
                $oD = $this->get_division();
                $oD->load_systems();
                $q = $oD->get_fst_Q($actualO->get_prop("id"));
                $rta["title"] = $q->get_prop("texto");
                $rta["detail"] = $q->get_prop("detalle");
                if ($q == null) {
                    $rta["error"] = "No hay ruta definida. Error de Arbol";
                    return $rta;
                }
                $opts = $q->get_prop("opcionesobj");
                $i = 0;
                foreach ($opts as $opt) {
                    $rta["options"][$i]["title"] = $opt->get_prop("texto");
                    $rta["options"][$i]["destiny"] = Encrypter::encrypt($actualPATH . "O" . $opt->get_prop("id") . "-");
                    if ($opt->get_prop("idpregunta_destino")) {
                        $rta["options"][$i]["end"] = false;
                    } else {
                        $rta["options"][$i]["end"] = true;
                    }
                    $i++;
                }
                return $rta;
            default:
                // otros casos
                if ($actualO->get_prop("idpregunta_destino")) {
                    // cargar opciones
                    $q = new QUESTION();
                    $q->load_DB($actualO->get_prop("idpregunta_destino"));
                    $rta["title"] = $q->get_prop("texto");
                    $rta["detail"] = $q->get_prop("detalle");
                    $opts = $q->get_prop("opcionesobj");
                    $i = 0;
                    foreach ($opts as $opt) {
                        $rta["options"][$i]["title"] = $opt->get_prop("texto");
                        $rta["options"][$i]["destiny"] = Encrypter::encrypt($actualPATH . "O" . $opt->get_prop("id") . "-");
                        if ($opt->get_prop("idpregunta_destino")) {
                            $rta["options"][$i]["end"] = false;
                        } else {
                            $rta["options"][$i]["end"] = true;
                        }
                        $i++;
                    }
                    return $rta;
                } else {
                    if ($actualO->get_prop("idequipo_destino") == null && $actualO->get_prop("ruta_destino") == null) {
                        $rta["error"] = "No hay ruta definida. Error de Arbol";
                        return $rta;
                    } else {
                        $rta["object"] = $actualO;
                    }
                }
                return $rta;
        }
    }

    /**
     * @return Array<String> Archivos
     */
    public function user_files() {
        $ret = array();
        $i = 0;
        $l = $GLOBALS[UL];
        $dirs = array(FILEUP_TMP_FOLDER . "/", FILEUP_TMP_FOLDER_THUMB . "/");
        foreach ($dirs as $dir) {
            if (is_dir($dir)) {
                if ($dh = opendir($dir)) {
                    $archivos = glob($dir . $l->get_prop("id") . "_*.*");
                    foreach ($archivos as $archivo) {
                        if (strpos($archivo, (string) $l->get_prop("id"))) {
                            $ret[$i] = $archivo;
                            $i++;
                        }
                    }
                    closedir($dh);
                }
            }
        }
        return $ret;
    }

    /**
     * Elimina temporales de fileuploader 
     */
    public function delete_file_tmp() {
        $list = $this->user_files();
        foreach ($list as $f) {
            unlink($f);
        }
    }

    /**
     * Devuelve ultima opcion [OPTION]
     * @return null 
     */
    function get_last() {
        if (isset($this->path_obj[$this->path_max])) {
            return $this->path_obj[$this->path_max];
        }
        return NULL;
    }

}

?>
