<?php

require_once 'classes/option.php';

/**
 * Clase para cargar y manejar preguntas
 */
class QUESTION extends itobject {

    private $id; /* id de la pregunta */
    private $texto;    /* texto de la pregunta */
    private $detalle; /* detalle anexo a la pregunta */
    private $UA; /* usuario creador */
    private $FA; /* fecha creacion */
    private $UB; /* usuario que elimino la opcion */
    private $FB; /* fecha en que elimino la opcion */
    private $opciones; /* objetos opciones dependientes de la pregunta */
    private $error = FALSE; /* erro al cargar de la base */


    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_PREGUNTAS where id=" . intval($id));
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

    /**
     * Carga datos editables
     * @param array $tmpU
     */
    function load_VEC($tmpU) {
        $this->texto = trim($tmpU["texto"]);
        $this->detalle = trim($tmpU["detalle"]);
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
     * Carga objetos opciones
     * @return int q de opciones
     */
    private function load_options() {
        $i = 0;
        $this->opciones = NULL;
        $ssql = "select id from TBL_OPCIONES where idpregunta=" . intval($this->id) . " and UB is null";
        $this->dbinstance->loadRS($ssql);
        while ($o = $this->dbinstance->get_vector()) {
            $this->opciones[$i] = $this->objsCache->get_object("OPTION", $o["id"]);
            $i++;
        }
        return $i;
    }

    /**
     * Devuelve propiedad solicitada
     * @param string $property
     * @return string
     */
    function get_prop($property) {
        switch ($property) {
            case 'id':
                return $this->id;
            case 'texto':
                return $this->texto;
            case 'detalle':
                return $this->detalle;
            case 'opcionesobj':
                $this->load_options();
                return $this->opciones;
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
