<?php

require_once 'itobject.php';

abstract class TREE extends itobject {

    private $path;
    private $path_pos;
    private $path_max;
    private $path_obj;
    private $deleted;
    private $critico;
    private $critico_v;

    /*
     *  Carga arbol y Verifica formato
     * @param    $path    formato:  'rut:iddireccion-idsistema-idopcion1-idopcion2-....
     * @param    $crypt  esta encriptado    
     * @return   string
     */
    protected function load_path($path, $crypt = 0) {
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

    /**
     *  Devuelve path desencriptado
     * @return string path
     */
    protected function get_path(){
        return implode("-",$this->path);
    }
    
    /**
     * Es activo el arbol (se puede dar de alta)
     * @return boolean
     */
    public function is_active() {
        return !$this->deleted;
    }

    /**
     * Verifica que se cumpla en formato - carga objetos
     * @return string
     */
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

    /**
     * Carga los objetos de opciones seleccionadas
     * @return string
     */
    private function load_objects() {
        start_measure("OBJ:TREE:load_objects");
        $this->path_obj = NULL;
        for ($i = 0; $i <= $this->path_max; $i++) {
            switch (substr($this->path[$i], 0, 1)) {
                case "D":
                    $ct = "DIVISION";
                    break;
                case "S":
                    $ct = "SYSTEM";
                    break;
                case "O":
                    $ct = "OPTION";
                    break;
                default:
                    return "Error al cargar un objeto del arbol - Default(id " . $this->path[$i] . " - pos $i)";
            }
            $o = $this->objsCache->get_object($ct, substr($this->path[$i], 1));
            $rta = $this->objsCache->get_status($ct, substr($this->path[$i], 1));
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

    /**
     * Carga opciones criticas seleccionadas
     */
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
        } else
            $this->critico = substr($this->critico, 1);
    }

    /**
     * Vector de TKTS similares
     * @return array<TKT>|null 
     */
    protected function get_similar() {
        if (!$this->critico_v) {
            $this->load_critic();
        }
        if (!$this->critico_v) {
            return NULL;
        }
        $criticVC = explode("-", $this->critico);
        $ssql = "
            select id from TBL_TICKETS where idmaster is null and UB is null and origen like 'D%-S" . intval($this->get_system()->get_prop("id")) . "-%'"; // todos los tkts del sistema abiertos
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty) {
            return NULL;
        }
        $i = 0;
        $tktV = array();
        while ($tm = $this->dbinstance->get_vector()) {
            $tkt = $this->objsCache->get_object("TKT", $tm["id"]);
            if ($this->objsCache->get_status("TKT", $tm["id"]) == "ok") {
                //verificar textos criticos y comparar con actual
                $countC = count(array_intersect($criticVC, explode("-", $tkt->get_prop("critic"))));
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
     * @return  string
     */
    protected function get_critic() {
        if ($this->critico === null) {
            $this->load_critic();
        }
        return $this->critico;
    }

    /**
     * Sistema tipificado
     * @return SYSTEM|null
     */
    function get_system() {

        if ($this->path_max < 1) {
            return NULL;
        }

        return $this->path_obj[1];
    }

    /**
     * Direccion tipificada
     * @return DIVISION|null
     */
    function get_division() {
        if (count($this->path_obj) == 0) {
            return NULL;
        }

        return $this->path_obj[0];
    }

    /**
     *  Devuelve array con respuestas previas<br/>
     *  null - sin respuestas previas<br/>
     * array => question => string <br/>
     *       => ans => string <br/>
     *       => path => string <br/> 
     * @return  array
     */
    public function get_tree_history() {
        $rta = array();
        if (is_array($this->path) && count($this->path) >= 1) {
            for ($i = 0; $i <= $this->path_max; $i++) {
                switch ($i) {
                    case 0:
                        $rta[$i]["question"] = "Canal";
                        $rta[$i]["ans"] = $this->get_division()->get_prop("nombre");
                        $rta[$i]["path"] = "D" . $this->get_division()->get_prop("id") . "-";
                        break;
                    case 1:
                        $rta[$i]["question"] = "Tipo";
                        $rta[$i]["ans"] = $this->get_system()->get_prop("nombre");
                        $rta[$i]["path"] = $rta[$i - 1]["path"] . "S" . $this->get_system()->get_prop("id") . "-";
                        break;
                    default:
                        $o = $this->path_obj[$i];
                        $q=$this->objsCache->get_object("QUESTION", $o->get_prop("idpregunta"));
                        $rta[$i]["question"] = $q->get_prop("texto");
                        $rta[$i]["ans"] = $o->get_prop("texto");
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
     * details =>string <br/>
     * back => string (cifrado)/ null / 'none'<br/>
     * actual => string (cifrado)<br/>
     * options => array => Title<br/>
     *                  => Destiny (cifrado)<br/>
     *                  => End (fin de arbol)<br/>
     * error => string<br/>
     * object => cuando es ultima opcion [OPTION] <br/>
     * @return  array
     */
    public function get_tree_options() {
        $rta = array();
        if (!is_array($this->path)) {
            // primer opcion, se muestran las direcciones
            //limpiar temporales del usuario
            
            //verificar si el usuario pertenece solo a una direccion se ingresa directamente
            $usr = $this->getLogged();
            $usrDirs= $usr->get_divisions();
            if(count($usrDirs)==1){
                $dir=$usrDirs[0]->get_prop("id");
            }else{
                $dir=-1;
            }
            //$dir=-1;
            if ($dir > 0) {
                $this->load_path("D" . $dir . "-", false);
            } else {
                $divs = new DIVISION($this->conn);
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
                    $q= $this->objsCache->get_object("QUESTION", $actualO->get_prop("idpregunta_destino"));
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
