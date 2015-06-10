<?php
namespace Itracker;
/**
 * Administra cache de objetos y crea itobjects nuevos
 */
class ObjectCache {

    private $itobjects = array();
    private $status = array();
    private $index = array();
    private $last = 0;
    private $recall = 0;
    private $call;
    private static $_instance;

    /**
     * Devuelve instancia unica del objeto
     * @return ObjectCache
     */
    final public static function getInstance() {
        if (null !== static::$_instance) {
            return static::$_instance;
        }
        static::$_instance = new static();
        return static::$_instance;
    }

    /**
     * Normaliza nombre de clase
     * @param String $class
     * @return string   Clase it con namespace
     */
    private function getITClass($class){
        $rcV = explode("\\",$class);
        if(!in_array("Itracker",$rcV)){
            return "\\Itracker\\".$class;
        }
        return $class;
    }
    
    /**
     * Obtiene clase de cache o crea objeto y carga de db
     * @param String $class clase requerida
     * @param String $id    Id de la base de datos
     * @param boolean $force_update Forzar actualizacion desde db
     * @return \Itracker\ITObject|null Objecto de la clase solicitada null si falla
     */
    public function get_object($class, $id, $force_update = false) {
        $this->call++;
        $class = $this->getITClass($class);
        if (!Utils\GlobalConfig::getInstance()->getBoolean('configs/objcache')){
            $force_update = true;
        }

        $id = (string) $id;
        $ind = $this->getindex_obj($class, $id);

        if ($force_update || !$ind) {
            $ind = $this->load_object($class, $id);
        } else {
            $this->recall++;
        }


        if ($ind) {
            $result = $this->itobjects[$ind];
        } else {
            $result = null;
        }

        return $result;
    }

    /**
     * Devuelve resultado del loaddb
     * @param String $class clase requerida
     * @param String $id    Id de la base de datos
     * @return String Resultado del load
     */
    public function get_status($class, $id) {
        $class = $this->getITClass($class);
        $ind = $this->getindex_obj($class, $id);
        if ($ind) {
            return $this->status[$ind];
        } else {
            return null;
        }
    }

    /**
     * Ejecuta loaddb sobre la clase solicitada
     * @param String $class clase requerida
     * @param String $id    Id de la base de datos
     * @return int  Indice insertado
     */
    private function load_object($class, $id) {
        try {
            $cn = new $class();
            if ($cn) {
                $resp = $cn->load_DB($id);
                $this->last++;
                $this->itobjects[$this->last] = $cn;
                $this->status[$this->last] = $resp;
                $this->index[$this->last] = array($class, $id);
                return $this->last;
            } else {
                return 0;
            }
        } catch (Exception $e) {
            return 0;
        }
    }

    /**
     * Busca indice en cache
     * @param String $class
     * @param String $id
     * @return int Index, -1 si no encuentra
     */
    private function getindex_obj($class, $id) {
        if ($this->last == 0)
            return 0;
        for ($i = 1; $i <= $this->last; $i++) {
            if ($this->index[$i][0] == $class && $this->index[$i][1] == $id) {
                return $i;
            }
        }
        return 0;
    }

    /**
     * Devuelve rellamadas a objeto
     * @return int  recall
     */
    public function get_recall() {
        return $this->recall;
    }

    /**
     * Devuelve llamadas a objeto
     * @return int  call
     */
    public function get_call() {
        return $this->call;
    }

}