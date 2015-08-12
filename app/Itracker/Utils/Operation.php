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
     * @var mixed
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
        if (isset($this->objects[$alias]))
            return clone $this->objects[$alias];
    }

    public function solve() {
        $this->operationSolving = $this->operation;
        $this->result=null;
        $OperParser = new OperationParser($this->operationSolving);
        if ($OperParser->getError()) {
            throw new \Exception('Error al en parametrizacion #1');
        }
        $this->solveOperation($OperParser);
    }

    /**
     * Ejecuta resolucion
     * @param OperationParser $operation
     */
    private function solveOperation($operation) {
        $Op = $operation->getOpe(0);
        $asign = null;
        $offset=0;
        if ($Op == '=') { //es asignacion
            $asign = $operation->getArg(0);
            if ($this->getArgType($asign) != 'var') {
                LoggerFactory::getLogger()->error('Error solo se puede asignar a variables',
                        array('Ec' => $this->operation)
                );
                $this->error=true;
                throw new \Exception('Error al en parametrizacion #2');
            }
            $offset++;
        }
        $this->result=$this->doMath($operation, $offset);
        echo "resultado :".$this->result;
    }

    /**
     * Resuelve operacion matematica
     * @param OperationParser $operation
     * @param int $offset
     * @return mixed
     */
    private function doMath($operation,$offset){
        $a1=$this->argValue($operation, $offset);
        $a2=$this->argValue($operation, $offset+1);
        switch ($operation->getOpe($offset)){
            case "==":
                return  $a1==$a2; 
             case "HIG":
                return  $a1>$a2;    
            default :
                LoggerFactory::getLogger()->error('Error operacion desconocida',
                        array('Ec' => $this->operation)
                );
                $this->error=true;
                throw new \Exception('Error al en parametrizacion #3');    
        }
    }
    
    /**
     * Devuelte el valor real
     * @param OperationParser $operation
     * @param int $argID
     * @return mixed
     */
    private function argValue($operation,$argID){
        return $this->remplaceParams(
                $operation->getArg($argID)
                );
    }
    
    /**
     * Devuelte tipo de argumento
     * @param string $value
     * @return string var|number|string|unknown
     */
    private function getArgType($value) {
        if (!$value)
            return 'unknown';
        $c = $value{0};
        if ($c == '{')
            return 'var';
        if ($c == '\'')
            return 'string';
        if (is_numeric($c))
            return 'number';
        return 'unknown';
    }

    /**
     * Remplaza las variables en los parametros de la operacion
     */
    private function remplaceParams($arg) {
        if($this->getArgType($arg)!='var'){
            return $this->normalize($arg);
        }
        preg_match_all('/\[([^\[]+[\.]+[^\[]+)}/', $arg, $matches);
        foreach ($matches[1] as $m) {
            $prop = $m;
            $value = $this->getAliasValue($prop);
            $arg =
                    str_replace('[' . $prop . ']', $value, $arg);
        }
        preg_match_all('/{([^}]+[\.]+[^}]+)}/', $arg, $matches);
        foreach ($matches[1] as $m) {
            $prop = $m;
            $value = $this->getAliasValue($prop);
            $arg =
                    str_replace('{' . $prop . '}', $value, $arg);
        }
        return $arg;
    }

    /**
     * Devuelve el valor de la propiedad
     * @param string $prop
     * @return string
     */
    private function getAliasValue($prop) {
        $expP = explode('.', $prop);
        $alias = array_shift($expP);
        $obj = $this->getObject($alias);
        if ($obj instanceof \Itracker\ITObject) {
            return $this->normalize(
                            $obj->get_Subprop(implode('.', $expP))
            );
        } elseif ($obj instanceof Vars) {
            return $this->normalize(
                            $obj->getValue(
                                    '/' . implode('/', $expP)
                            )
            );
        } else {
            return 'undefined';
        }
    }

    /**
     * Normaliza la variable
     * @param string $prop
     * @return string
     */
    private function normalize($value) {
        if (is_numeric($value)) {
            return $value;
        }
        return str_replace(array('\\\'','\''),array('\'','') ,$value);
    }

}

