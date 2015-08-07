<?php

namespace Itracker\Utils;

/**
 * Realiza operaciones entre objetos itracker desde string
 * Comparaciones, operaciones matematicas, asignaciones
 * Vars, itforms, configs, itobjects
 */
class Operation {

    /**
     * Array con los alias ingresados para la operacion
     * @var array
     */
    private $objects;

    /**
     * Operacion a ejecutar
     * @var string 
     */
    private $operation;

    /**
     * Operacion mientras se esta resolviendo
     * @var string
     */
    private $operationSolving;
    /**
     * Resultado de la operacion
     * true/false
     * @var boolean
     */
    private $result;

    /**
     * Error en operacion
     * @var boolean
     */
    private $error;

    /**
     * Agrega objeto con el alias a la lista
     * @param string $alias
     * @param mixed $object
     */
    public function addObject($alias, $object) {
        $this->objects[$alias] = clone $object;
    }

    /**
     * Realiza operacion solicitada
     * @param string $operation
     */
    public function operate($operation) {
        $this->operation = $operation;
    }

    /**
     * Devuelve resultado de la operacion
     * True si fue una asignacion exitosa
     * @return boolean
     */
    public function getResult() {
        return $this->result;
    }

    /**
     * Devuelve el objeto 
     * (con las modificaciones que se le generaron luego de operar)
     * !importante todos son clonados
     * @param string $alias
     * @return mixed
     */
    public function getObject($alias) {
        if(isset($this->objects[$alias]))
                return clone $this->objects[$alias];
    }

    public function solve() {
       $this->operationSolving=$this->operation;
       $this->remplaceParams();
       $OperParser = new OperationParser($this->operationSolving);
       echo "Ecuacion:".$this->operationSolving;
       echo "Parseada:";
       $OperParser->print_all();
       echo "Resultado: false";
       exit();
    }

    /**
     * Remplaza las variables en los parametros de la operacion
     */
    private function remplaceParams(){
        preg_match_all('/\[([^\[]+[\.]+[^\[]+)}/', $this->operationSolving, $matches);
        foreach($matches[1] as $m){
            $prop=$m;
            $value=$this->getAliasValue($prop);
            $this->operationSolving = 
                    str_replace('['.$prop.']', $value, $this->operationSolving);
        }
        preg_match_all('/{([^}]+[\.]+[^}]+)}/', $this->operationSolving, $matches);
        foreach($matches[1] as $m){
            $prop=$m;
            $value=$this->getAliasValue($prop);
            $this->operationSolving = 
                    str_replace('{'.$prop.'}', $value, $this->operationSolving);
        }
    }
    
    /**
     * Devuelve el valor de la propiedad
     * @param string $prop
     * @return string
     */
    private function getAliasValue($prop){
        $expP = explode('.',$prop);
        $alias = array_shift($expP);
        $obj = $this->getObject($alias);
        if($obj instanceof \Itracker\ITObject){
            return $this->normalize(
                    $obj->get_Subprop(implode('.',$expP))
                );
        }elseif( $obj instanceof Vars){
            return $this->normalize(
                    $obj->getValue(
                            '/'.implode('/',$expP)
                            )
                    );
        }else{
            return 'undefined';
        }
        
    }

     /**
     * Normaliza la variable
     * @param string $prop
     * @return string
     */
    private function normalize($value){
        if(is_numeric($value)){
            return $value;
        }
        return '\''.strToJava($value).'\'';
    }
    
}

