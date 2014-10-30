<?php

require_once 'classes/question.php';

/**
 * Administra direcciones
 */
class DIVISION extends itobject {

    private $id;    /** id del elemento*/
    private $nombre;    /*nombre de la direccion*/
    private $linkwi;    /* link a web de incidentes (el parametro reemplaza en {id})*/
    private $estado;    /* activo */
    private $idsistemas;    /* array int - sistemas*/
    private $sistemas;  /* array SYSTEM */
    private $idPpreguntas; /* array int primer pregunta del arbol*/
    private $Ppreguntas;    /* array QUESTION primer pregunta del arbol*/
    private $error = FALSE; /* error al cargar */

    /**
     * Devuelve lista(objetos) de direcciones habilitadas
     * @return \DIVISION|null
     */
    function list_all(){
        $ssql="select id from TBL_DIRECCION where estado =".I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        if(!$this->dbinstance->noEmpty) return null;
        $i=0;
        $list=array();
        while($idV=$this->dbinstance->get_vector()){
            $list[$i]=new DIVISION($this->conn);
            $list[$i]->load_DB($idV[0]);
            $i++;
        }
        return $list;
    }
    
    /**
     * Carga de base de datos
     * @param int $id
     * @return string
     */
    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_DIRECCION where id=".intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            if ($this->estado == I_DELETED)
                return "eliminado";
            return "ok";
        }
        else
            $this->error = TRUE;
        return "error";
    }

    /**
     * Carga idsistemas - sistemas - idPpreguntas -Ppreguntas
     * @return int q de sistemas
     */
    function load_systems() {

        $ssql = "select * from TBL_SISDIR where iddireccion=" . intval($this->id) . " and estado=" . I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        $this->idsistemas = NULL;
        $this->idPpreguntas = NULL;
        $this->sistemas = NULL;
        $this->Ppreguntas = NULL;

        $i = 0;
        $nameTemp = array();
        while ($sis = $this->dbinstance->get_vector()) {

            $s = new SYSTEM($this->conn);
            if ($s->load_DB($sis["idsistema"]) == "ok") {
                $q = new QUESTION($this->conn);
                if ($q->load_DB($sis["p_pregunta"]) == "ok") {
                    $this->idsistemas[$i] = $s->get_prop("id");
                    $this->sistemas[$i] = $s;
                    $nameTemp[$i]=$s->get_prop("nombre");
                    $this->idPpreguntas[$s->get_prop("id")] = $q->get_prop("id");
                    $this->Ppreguntas[$s->get_prop("id")] = $q;
                    $i++;
                }
            }

        }
        array_multisort($nameTemp,SORT_STRING ,$this->sistemas,$this->idsistemas);
        return $i;
    }

    /**
     * Devuelve primer pregunta para el id solicitado
     * @param type $idSistema
     * @return QUESTION
     */
    function get_fst_Q($idSistema) {
        return $this->Ppreguntas[$idSistema];
    }

    /**
     * Carga de vector a nombre y linkwi
     * @param type $tmpU { nombre,linkwi }
     */
    function load_VEC($tmpU) {
        $this->nombre = trim($tmpU["nombre"]);
        $this->linkwi = trim($tmpU["linkwi"]);
    }

    /**
     * Carga de base de datos a propiedades
     * @param type $tmpU
     */
    private function load_DV($tmpU) {
        $this->load_VEC($tmpU);
        $this->id = $tmpU["id"];
        $this->estado = $tmpU["estado"];
    }

    /**
     * Verifica datos para insert o update
     * @return string|null
     */
    function check_data() {
        if (!is_numeric($this->id))
            return "El id debe ser un numero entero";
        if ($this->nombre == "")
            return "El campo Nombre es obligatorio";

        if ($this->estado == I_DELETED)
            return "Imposible modificar registro eliminado";
        return NULL;
    }

    /**
     * Actualiza en base de datos
     * @return string
     */
    function update_DB() {
        if (!($rta = $this->check_data())) {
            $ssql = "update TBL_DIRECCION set nombre='" . strToSQL($this->nombre) . "',linkwi='" . strToSQL($this->linkwi) . "' where id=".intval($this->id);
            if ($this->dbinstance->query($ssql))
                return "Division_update: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    /**
     * Inserta en base de datos
     * @return string
     */
    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        if (!($rta = $this->check_data())) {
            $ssql = "insert into TBL_DIRECCION(nombre,linkwi,estado) values ('" . strToSQL($this->nombre) . "','" . strToSQL($this->linkwi) . "',0);";
            if ($$this->dbinstance->query($ssql))
                return "Division_insert: " . $this->dbinstance->details;
            else
                return "ok";
        }
        else
            return $rta;
    }

    /**
     * Elimina de base de datos
     * @return string
     */
    function delete_DB() {
        if ($this->estado == I_DELETED)
            return "La direccion ya se encuentra eliminada";
        $ssql = "update TBL_DIRECCION set estado=1 where id=".intval($this->id);
        if ($this->dbinstance->query($ssql))
            return "Division_delete: " . $this->dbinstance->details;
        else
            return "ok";
    }

    /**
     * Devuelve propiedad solicitada
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'linkwi':
                return $this->linkwi;
            case 'sistemasobj':
                return $this->sistemas;
            default:
                return "Propiedad invalida.";
        }
    }

}

?>
