<?php

namespace Itracker;

/**
 * Clase para cargar y manejar opciones de arbol
 */
class Option extends ITObject {

    private $id;   /* id de la opcion */
    private $idpregunta; /* id de la pregunta a la cual pertenece */
    private $texto;    /* texto a mostrar en la opcion */
    private $texto_critico;    /* texto utilizado para vincular similares */
    private $destino; /* xml texto con el destino y reglas */
    private $habilita_perfiles; /* xml texto con el destino y reglas */

    /**
     * Reglas de derivacion y apertura
     * @var OptionRules 
     */
    private $destRule;
    private $pretext; /* contiene el formulario que sera solicitado antes de generar el reclamo */

    /**
     *
     * @var ITForm
     */
    private $itform; /* formulario cargado ITFORM */
    private $idpregunta_destino; /* indica el camino a seguir por el arbol si no es ultima opcion */
    private $UA; /* usuario creador */
    private $FA; /* fecha creacion */
    private $UB; /* usuario que elimino la opcion */
    private $FB; /* fecha en que elimino la opcion */
    private $error = FALSE; /* error al cargar de la base */

    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_OPCIONES where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->UB != NULL)
                return "eliminado";
            return "ok";
        } else
            $this->error = TRUE;
        return "error";
    }

    function load_VEC($tmpU) {
        $this->idpregunta = trim($tmpU["idpregunta"]);
        $this->texto = trim($tmpU["texto"]);
        $this->texto_critico = trim($tmpU["texto_critico"]);
        $this->habilita_perfiles = trim($tmpU['habilita_perfiles']);
        $this->destino = trim(space_delete($tmpU["destino"], array("\t", "\n", "\0", "\x0B")));
        $this->pretext = trim(space_delete($tmpU["pretext"], array("\t", "\n", "\0", "\x0B")));

        if ($this->destino != "") {
            $this->destRule = new OptionRules($this->destino);
            if ($this->pretext != "") {
                $this->itform = new ITForm();
                $this->itform->load_xml($this->pretext);
            } else {
                $this->itform = null;
            }
        } else {
            $this->destRule = null;
        }


        $this->idpregunta_destino = trim($tmpU["idpregunta_destino"]);
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
     * Devuelve OptionRule cargado (si user y itform son null devuelve todo)
     * @param User $user
     * @param ITForm $itform
     * @return OptionRules
     */
    public function getDestiny($user = null, $itform = null) {
        if ($this->destRule == null) {
            return null;
        }
        if ($user == null && $itform == null) {
            return $this->destRule;
        }
        $this->destRule->loadFor($user, $itform);
        return $this->destRule;
    }

    /**
     * Verifica si el perfil puede utilizar la opcion
     * @param int $idProfile
     * @return boolean
     */
    public function checkProfile($idProfile){
        if($this->habilita_perfiles=='*'){
            return true;
        }
        $hp = explode(',', $this->habilita_perfiles);
        if(in_array($idProfile,$hp)){
            return true;
        }
        return false;
            
    }
    
    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return $this->id;
            case 'idpregunta':
                return $this->idpregunta;
            case 'texto':
                return $this->texto;
            case 'itform':
                return $this->itform;
            case 'texto_critico':
                return $this->texto_critico;
            case 'idpregunta_destino':
                return $this->idpregunta_destino;
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