<?php

namespace Itracker;

use Itracker\Exceptions\ItException;

/**
 * Administra direcciones
 */
class Division extends ITObject {

    private $id;/** id del elemento */
    private $nombre;    /* nombre de la direccion */
    private $linkwi;    /* link a web de incidentes (el parametro reemplaza en {id}) */
    private $estado;    /* activo */
    private $idsistemas;    /* array int - sistemas */
    private $sistemas;  /* array SYSTEM */
    private $idPpreguntas; /* array int primer pregunta del arbol */
    private $Ppreguntas;    /* array QUESTION primer pregunta del arbol */

    /**
     * Devuelve lista(objetos) de direcciones habilitadas
     * @return \DIVISION|null
     */
    function list_all() {
        $ssql = "select id from TBL_DIRECCION where estado =" . I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        if (!$this->dbinstance->noEmpty)
            return null;
        $i = 0;
        $list = array();
        while ($idV = $this->dbinstance->get_vector()) {
            $list[$i] = $this->objsCache->get_object(get_class(), $idV[0]);
            $i++;
        }
        return $list;
    }

    function load_DB($id) {
        $this->error = FALSE;
        $this->dbinstance->loadRS("select * from TBL_DIRECCION where id=" . intval($id));
        if ($this->dbinstance->noEmpty && $this->dbinstance->cReg == 1) {
            $tmpU = $this->dbinstance->get_vector();
            $this->load_DV($tmpU);
            return $this->estado;
        }else {
            throw new ItException('dbobject/load');
        }
    }

    /**
     * Carga idsistemas - sistemas - idPpreguntas -Ppreguntas
     * @return int q de sistemas
     */
    function load_systems() {
        if ($this->sistemas) {
            return count($this->sistemas);
        }
        $ssql = "select * from TBL_SISDIR where iddireccion=" . intval($this->id) . " and estado=" . I_ACTIVE;
        $this->dbinstance->loadRS($ssql);
        $this->idsistemas = NULL;
        $this->idPpreguntas = NULL;
        $this->sistemas = NULL;
        $this->Ppreguntas = NULL;

        $i = 0;
        $nameTemp = array();
        while ($sis = $this->dbinstance->get_vector()) {
            try{
                $s = $this->objsCache->get_object("System", $sis["idsistema"]);
                $q = $this->objsCache->get_object("Question", $sis["p_pregunta"]);
                $this->idsistemas[$i] = $s->get_prop("id");
                $this->sistemas[$i] = $s;
                $nameTemp[$i] = $s->get_prop("nombre");
                $this->idPpreguntas[$s->get_prop("id")] = $q->get_prop("id");
                $this->Ppreguntas[$s->get_prop("id")] = $q;
                $i++;  
            }catch(Exceptions\ItDeletedException $e){
                
            }
        }
        array_multisort($nameTemp, SORT_STRING, $this->sistemas, $this->idsistemas);
        return $i;
    }

    /**
     * Devuelve primer pregunta para el id solicitado
     * @param type $idSistema
     * @return Question
     */
    function get_fst_Q($idSistema) {
        $this->load_systems();
        // error si no existe
        if(!isset($this->Ppreguntas[$idSistema])){
            throw new ItException('dbobject/checkdata',
                    'Tipificacion invalida');
        }
        return $this->Ppreguntas[$idSistema];
    }

    /**
     * Carga de vector a nombre y linkwi
     * @param type $tmpU { nombre,linkwi }
     */
    function load_VEC($tmpU) {
        $this->nombre = trim($tmpU["nombre"]);
        $this->linkwi = trim($tmpU["linkwi"]);
        $this->sistemas = null;
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
     */
    function check_data() {
        if (!is_numeric($this->id))
            throw new ItException('dbobject/checkdata', 'El id debe ser un numero entero');
        if ($this->nombre == "")
            throw new ItException('dbobject/checkdata', 'El campo Nombre es obligatorio');
        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'Imposible modificar registro eliminado');
    }

    /**
     * Actualiza en base de datos
     * @return string
     */
    function update_DB() {
        $this->check_data();
        $ssql = "update TBL_DIRECCION set nombre='" . strToSQL($this->nombre) . "',linkwi='" . strToSQL($this->linkwi) . "' where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    /**
     * Inserta en base de datos
     * @return string
     */
    function insert_DB() {
        $this->estado = I_ACTIVE;
        $this->id = I_NEWID;
        $this->check_data();
        $ssql = "insert into TBL_DIRECCION(nombre,linkwi,estado) values ('" . strToSQL($this->nombre) . "','" . strToSQL($this->linkwi) . "',0);";
        $this->dbinstance->query($ssql);
    }

    /**
     * Elimina de base de datos
     * @return string
     */
    function delete_DB() {
        if ($this->estado == I_DELETED)
            throw new ItException('dbobject/checkdata', 'La direccion ya se encuentra eliminada');
        $ssql = "update TBL_DIRECCION set estado=1 where id=" . intval($this->id);
        $this->dbinstance->query($ssql);
    }

    /**
     * Devuelve propiedad solicitada
     * @param type $property
     * @return string
     */
    function get_prop($property) {
        $property = strtolower($property);
        switch ($property) {
            case 'id':
                return ucwords($this->id);
            case 'nombre':
                return ucwords($this->nombre);
            case 'linkwi':
                return $this->linkwi;
            case 'sistemasobj':
                $this->load_systems();
                return $this->sistemas;
            default:
                throw new ItException('prop/getprop');
        }
    }

}

?>
