<?php

namespace Itracker;

/**
 * Arbol de opciones y movimientos
 */
abstract class Tree extends ITObject {

    private $path;
    private $path_pos;
    private $path_max;
    private $path_obj;
    private $deleted;
    private $canopen;
    private $critico;
    private $critico_v;

    /**
     *  Carga arbol y Verifica formato
     * @param    $path    formato:  'rut:iddireccion,idsistema,idopcion1,idopcion2-....
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
            $path = \Encrypter::decrypt($path);
        }
        $this->path = explode(",", $path);
        return $this->check_valid();
    }

    /**
     *  Devuelve path desencriptado
     * @return string path
     */
    protected function get_path() {
        return implode(",", $this->path);
    }

    /**
     * Es activo el arbol (se puede dar de alta)
     * @return boolean
     */
    public function is_active() {
        return $this->canopen;
    }

    /**
     * Verifica que se cumpla en formato - carga objetos
     * @return string
     */
    private function check_valid() {
        $this->path_max = count($this->path) - 2;
        for ($i = 0; $i < $this->path_max; $i++) {
            if (!is_numeric(substr($this->path[$i], 1))) {
                $tmp = implode(",", $this->path);
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
        $perfil = $this->getLogged()->get_prop('perfil');
        $this->canopen = true;
        for ($i = 0; $i <= $this->path_max; $i++) {
            switch (substr($this->path[$i], 0, 1)) {
                case "D":
                    $ct = "Division";
                    break;
                case "S":
                    $ct = "System";
                    break;
                case "O":
                    $ct = "Option";
                    break;
                default:
                    return "Error al cargar un objeto del arbol - Default(id " . $this->path[$i] . " - pos $i)";
            }
            $o = $this->objsCache->get_object($ct, substr($this->path[$i], 1));
            $rta = $this->objsCache->get_status($ct, substr($this->path[$i], 1));
            if ($ct == 'Option') {
                if (!$o->checkProfile($perfil)) {
                    $this->canopen = false;
                }
            }
            if ($rta != "error") {
                $this->path_obj[$i] = $o;
            } else {
                return "Error al cargar un objeto del arbol (id " . $this->path[$i] . " - pos $i - $rta)";
            }
            if ($rta == "eliminado") {
                $this->canopen = false;
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
                $this->critico.="," . $critico;
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
     * @return System|null
     */
    function get_system() {

        if ($this->path_max < 1) {
            return NULL;
        }

        return $this->path_obj[1];
    }

    /**
     * Direccion tipificada
     * @return Division|null
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
                        $rta[$i]["path"] = "D" . $this->get_division()->get_prop("id") . ",";
                        break;
                    case 1:
                        $rta[$i]["question"] = "Tipo";
                        $rta[$i]["ans"] = $this->get_system()->get_prop("nombre");
                        $rta[$i]["path"] = $rta[$i - 1]["path"] . "S" . $this->get_system()->get_prop("id") . ",";
                        break;
                    default:
                        $o = $this->path_obj[$i];
                        $q = $this->objsCache->get_object("Question", $o->get_prop("idpregunta"));
                        $rta[$i]["question"] = $q->get_prop("texto");
                        $rta[$i]["ans"] = $o->get_prop("texto");
                        $rta[$i]["path"] = $rta[$i - 1]["path"] . "O" . $o->get_prop("id") . ",";
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
     *                  => isnew
     * error => string<br/>
     * object => cuando es ultima opcion [OPTION] <br/>
     * @return  array
     */
    public function get_tree_options() {
        $rta = array();
        $usr = $this->getLogged();
        $usrDirs = $usr->get_divisions();
        if (!is_array($this->path) ||
                !objinarray($this->get_division(), $usrDirs)) {
            // primer opcion, se muestran las direcciones
            //limpiar temporales del usuario
            //verificar si el usuario pertenece solo a una direccion se ingresa directamente
            if (count($usrDirs) == 1) {
                $dir = $usrDirs[0]->get_prop("id");
            } else {
                $dir = -1;
            }
            //$dir=-1;
            if ($dir > 0) {
                $this->load_path("D" . $dir . ",", false);
            } else {
                $rta["title"] = "Seleccione un area";
                $rta["back"] = "none";
                $i = 0;
                foreach ($usrDirs as $d) {
                    $rta["options"][$i]["title"] = $d->get_prop("nombre");
                    $rta["options"][$i]["destiny"] = \Encrypter::encrypt("D" . $d->get_prop("id") . ",");
                    $rta["options"][$i]["end"] = false;
                    $i++;
                }
                return $rta;
            }
        }
        $actualPATH = implode(",", $this->path); //ruta actual, para generar destiny
        $rta["actual"] = \Encrypter::encrypt($actualPATH);
        $actualO = $this->get_last();
        $backPATH = Array();
        for ($i = 0; $i < $this->path_max; $i++) {
            $backPATH[$i] = $this->path[$i];
        }
        if (count($backPATH)) {
            $rta["back"] = \Encrypter::encrypt(implode(",", $backPATH) . ",");
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
                    $rta["options"][$i]["destiny"] = \Encrypter::encrypt($actualPATH . "S" . $s->get_prop("id") . ",");
                    $rta["options"][$i]["end"] = false;
                    $fstQ = $actualO->get_fst_Q($s->get_prop("id"));
                    $rta["options"][$i]["isnew"]=$fstQ->get_prop('isnew');
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
                $perfil = $this->getLogged()->get_prop('perfil');
                $opts = $q->get_prop("opcionesobj");
                $i = 0;
                foreach ($opts as $opt) {
                    if (!$opt->checkProfile($perfil)) {
                        continue;
                    }
                    $rta["options"][$i]["title"] = $opt->get_prop("texto");
                    $rta["options"][$i]["isnew"] = $opt->get_prop("isnew");
                    $rta["options"][$i]["destiny"] = \Encrypter::encrypt($actualPATH . "O" . $opt->get_prop("id") . ",");
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
                    $q = $this->objsCache->get_object("Question", $actualO->get_prop("idpregunta_destino"));
                    $rta["title"] = $q->get_prop("texto");
                    $rta["detail"] = $q->get_prop("detalle");
                    $opts = $q->get_prop("opcionesobj");
                    $i = 0;
                    foreach ($opts as $opt) {
                        $rta["options"][$i]["title"] = $opt->get_prop("texto");
                        $rta["options"][$i]["isnew"] = $opt->get_prop("isnew");
                        $rta["options"][$i]["destiny"] = \Encrypter::encrypt($actualPATH . "O" . $opt->get_prop("id") . ",");
                        if ($opt->get_prop("idpregunta_destino")) {
                            $rta["options"][$i]["end"] = false;
                        } else {
                            $rta["options"][$i]["end"] = true;
                        }
                        $i++;
                    }
                    return $rta;
                } else {
                    $rta["object"] = $actualO;
                }
                return $rta;
        }
    }

    /**
     * Devuelve script de todas las opciones
     * @return string
     */
    public function getScriptText(){
        $sctmp='';
        foreach($this->path_obj as $o){
            if($o instanceof Option){
                $sctmp.=PHP_EOL.$o->get_prop('destino');
            }
        }
        return $sctmp;
    }
    
    /**
     * Devuelve ultima opcion [OPTION]
     * @return Option 
     */
    function get_last() {
        if (isset($this->path_obj[$this->path_max])) {
            return $this->path_obj[$this->path_max];
        }
        return NULL;
    }

}

?>
