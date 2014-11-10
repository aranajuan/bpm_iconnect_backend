<?php


require_once 'classes/question.php';

/**
 * Clase para cargar y manejar opciones de arbol
 */
class OPTION extends itobject {

    private $id;   /* id de la opcion */
    private $idpregunta; /* id de la pregunta a la cual pertenece */
    private $texto;    /* texto a mostrar en la opcion */
    private $texto_critico;    /* texto utilizado para vincular similares */
    private $ruta_destino; /* ruta a la cual se derivara en caso de elegir esta opcion */
    private $idequipo_destino; /* equipo al cual se derivara el caso (si hay una ruta de destino sera en la no conformidad) */
    private $pretext; /* contiene el formulario que sera solicitado antes de generar el reclamo */
    private $idpregunta_destino; /* indica el camino a seguir por el arbol si no es ultima opcion */
    private $autocerrar; /* 1/0 si se cierra automaticamente o no */
    private $no_anexar; /* si ofrece al usuario anexarlo a otro ticket o no ignorando el texto critico */
    private $UA; /* usuario creador */
    private $FA; /* fecha creacion */
    private $UB; /* usuario que elimino la opcion */
    private $FB; /* fecha en que elimino la opcion */
    private $error = FALSE; /* error al cargar de la base */


    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_OPCIONES where id=".intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->UB != NULL)
                return "eliminado";
            return "ok";
        }
        else
            $this->error = TRUE;
        return "error";
    }

    function load_VEC($tmpU) {
        $this->idpregunta = trim($tmpU["idpregunta"]);
        $this->texto = trim($tmpU["texto"]);
        $this->texto_critico = trim($tmpU["texto_critico"]);
        $this->ruta_destino = trim($tmpU["ruta_destino"]);
        $this->idequipo_destino = trim($tmpU["idequipo_destino"]);
        $this->pretext = trim($tmpU["pretext"]);
        $this->idpregunta_destino = trim($tmpU["idpregunta_destino"]);
        $this->autocerrar = trim($tmpU["autocerrar"]);
        $this->no_anexar = trim($tmpU["no_anexar"]);
    }

    /**
     * Carga vector en propiedades de DB, no cargadas por el usr
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->id = $tmpU["id"];
        $this->UA = $tmpU["UA"];
        $this->FA = $tmpU["FA"];
        $this->UB = $tmpU["UB"];
        $this->FB = $tmpU["FB"];
        $this->load_VEC($tmpU);
    }

    /**
     * devuelve equipo asignado
     * @param USER $usr 
     * 
     */
    function equipo_destino($usr) {
        $ideqs = $this->get_prop("idequipo_destino");
        if ($ideqs == NULL)
            return NULL;
        $ideqsV = explode(";", $ideqs);

        foreach ($ideqsV as $dest) {
            $destAR = explode("=>", $dest);
            if ($destAR[0] == "default")
                return $destAR[1];
            $parts = explode(":", $destAR[0]);
            $partsEl = explode(",", $parts[1]);
            if ($parts[0] == "USER") {
                if (in_array($usr->get_prop("id"), $partsEl)) {
                    return $destAR[1];
                }
            }
            if ($parts[0] == "TEAM") {
                foreach ($partsEl as $idteam) {
                    if ($usr->in_team($idteam))
                        return $destAR[1];
                }
            }
            if ($parts[0] == "DIVISION") {
                $equipos = $usr->get_prop("equiposobj");
                $direccionesU = array();
                foreach ($equipos as $e) {
                    array_push($direccionesU, $e->get_prop("iddireccion"));
                }
                foreach ($partsEl as $iddir) {
                    if (in_array($iddir, $direccionesU))
                        return $destAR[1];
                }
            }
        }
        return NULL;
    }

    function get_prop($property) {
        switch ($property) {
            case 'id':
                return $this->id;
            case 'idpregunta':
                return $this->idpregunta;
            case 'texto':
                return $this->texto;
            case 'ruta_destino':
                return $this->ruta_destino;
            case 'idequipo_destino':
                return $this->idequipo_destino;
            case 'pretext':
                return str_replace(array("\\r\\n", "\\r", "\\n"), "", $this->pretext);
            case 'texto_critico':
                return $this->texto_critico;
            case 'idpregunta_destino':
                return $this->idpregunta_destino;
            case 'autocerrar':
                return $this->autocerrar;
            case 'no_anexar':
                return $this->no_anexar;
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
