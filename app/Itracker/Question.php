<?php

namespace Itracker;
use Itracker\Exceptions\ItFunctionalException;
/**
 * Clase para cargar y manejar preguntas
 */
class Question extends ITObject {

    private $id; /* id de la pregunta */
    private $texto;    /* texto de la pregunta */
    private $detalle; /* detalle anexo a la pregunta */
    private $UA; /* usuario creador */
    private $FA; /* fecha creacion */
    private $UB; /* usuario que elimino la opcion */
    private $FB; /* fecha en que elimino la opcion */
    private $opciones; /* objetos opciones dependientes de la pregunta */


    function load_DB($id) {
        $this->dbinstance->loadRS("select * from TBL_PREGUNTAS where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->UB != NULL)
                return I_DELETED;
            return I_ACTIVE;
        } else {
            throw new ItFunctionalException('dbobject/load');
        }
    }

    /**
     * Carga datos editables
     * @param array $tmpU
     */
    function load_VEC($tmpU) {
        $this->texto = trim($tmpU["texto"]);
        $this->detalle = trim($tmpU["detalle"]);
        $this->opciones=NULL;
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
        if($this->opciones!=NULL){
            return count($this->opciones);
        }
        $i = 0;
        $ssql = "select id from TBL_OPCIONES where idpregunta=" . intval($this->id) . " and UB is null";
        $this->dbinstance->loadRS($ssql);
        while ($o = $this->dbinstance->get_vector()) {
            $this->opciones[$i] = $this->objsCache->get_object("Option", $o["id"]);
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
        $property = strtolower($property);
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
            case 'isnew':
                $this->load_options();
                foreach($this->opciones as $o){
                    if($o->get_prop('isnew')){
                        return true;
                    }
                }
                return false;
            default:
                throw new ItFunctionalException('prop/getprop');
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
