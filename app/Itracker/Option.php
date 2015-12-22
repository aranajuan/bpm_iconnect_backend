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

    /**
     * Permitir unir
     * @var boolean 
     */
    private $unir;
    private $habilita_perfiles; /* xml texto con el destino y reglas */
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
            $rta = $this->load_DV($tmpU);
            if ($this->UB != NULL)
                return "eliminado";
            return $rta;
        } else {
            $this->error = TRUE;
        }
        return "error";
    }

    function load_VEC($tmpU) {
        $this->idpregunta = trim($tmpU["idpregunta"]);
        $this->texto = trim($tmpU["texto"]);
        $this->texto_critico = trim($tmpU["texto_critico"]);
        $this->habilita_perfiles = trim($tmpU['habilita_perfiles']);
        $this->destino = trim(space_delete($tmpU["destino"], array("\t", "\n", "\0", "\x0B")));
        $this->pretext = trim(space_delete($tmpU["pretext"], array("\t", "\n", "\0", "\x0B")));
        $this->idpregunta_destino = trim($tmpU["idpregunta_destino"]);

        $this->unir = trim($tmpU['unir']);
        if ($this->destino == '' && ($this->pretext != '' || $this->idpregunta_destino == '')) {
            $this->getContext()->getLogger()->error('Error en opcion sin destino', array('id' => $this->id));
            return 'Error en el arbol de derivaciones. #1';
        }

        if ($this->pretext != '') {
            $this->itform = new ITForm();
            if ($this->itform->load_xml($this->pretext) != 'ok') {
                $this->itform = null;
            }
        } else {
            $this->itform = null;
        }



        return 'ok';
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
        return $this->load_VEC($tmpU);
    }

    /**
     * Verifica si el perfil puede utilizar la opcion
     * @param int $idProfile
     * @return boolean
     */
    public function checkProfile($idProfile) {
        if ($this->habilita_perfiles == '*') {
            return true;
        }
        $hp = explode(',', $this->habilita_perfiles);
        if (in_array($idProfile, $hp)) {
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
            case 'unir':
                return $this->unir;
            case 'destino':
                return $this->destino;
            case 'texto_critico':
                return $this->texto_critico;
            case 'idpregunta_destino':
                return $this->idpregunta_destino;
            case 'fa':
                return STRdate_format($this->FA, DBDATE_READ, USERDATE_READ);
            case 'isnew':
                $min = DiffBetweenDates($this->get_prop('fa'), 'NOW');
                $days = $min /1440;
                return $days<= $this->getContext()->get_GlobalConfig()->getInt('configs/optnewdays');      
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
