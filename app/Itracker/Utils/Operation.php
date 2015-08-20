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
        try{
            $this->solve();
        }  catch (\Exception $e){
            $this->error=true;
        }
        return $this->error;
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
            return $this->objects[$alias];
    }

    private function solve() {
        $this->operationSolving = $this->operation;
        $this->result = null;
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
        $offset = 0;
        if ($Op == '=') { //es asignacion
            $asign = $operation->getArg(0);
            if ($this->getArgType($asign) != 'var') {
                LoggerFactory::getLogger()->error('Error solo se puede asignar a variables', array('Ec' => $this->operation)
                );
                $this->error = true;
                throw new \Exception('Error al en parametrizacion #2');
            }
            $offset++;
        }
        $this->result = $this->doMath($operation, $offset);
        if ($asign) {
            $this->asignValue($asign, $this->result);
        }
    }

    /**
     * Resuelve operacion matematica
     * @param OperationParser $operation
     * @param int $offset
     * @return mixed
     */
    private function doMath($operation, $offset) {
        $a1 = $this->argValue($operation, $offset);
        $a2 = $this->argValue($operation, $offset + 1);
        switch ($operation->getOpe($offset)) {
            case null:
                return $a1;
            case "==":
                return $a1 == $a2;
            case "!=":
                return $a1 != $a2;
            case ".":
                return $a1 . $a2;
            case ">":
                return $a1 > $a2;
            case ">=":
                return $a1 >= $a2;
            case "<":
                return $a1 < $a2;
            case "<=":
                return $a1 <= $a2;
            case "+":
                return $a1 + $a2;
            case "-":
                return $a1 - $a2;
            case "/":
                return $a1 / $a2;
            case "*":
                return $a1 * $a2;
            case "&&":
                return $a1 && $a2;  
            case "||":
                return $a1 || $a2; 
            case "in":
                if(!is_array($a1)){
                    $a1=explode(',',$a1);
                }
                if(!is_array($a2)){
                    $a2=explode(',',$a2);
                }
                return count(array_intersect($a1, $a2))>0;
            default :
                LoggerFactory::getLogger()->error('Error operacion desconocida', array('Ec' => $this->operation, 'Oper' => $operation->getOpe($offset))
                );
                $this->error = true;
                throw new \Exception('Error al en parametrizacion #3');
        }
    }

    /**
     * Devuelte el valor real
     * @param OperationParser $operation
     * @param int $argID
     * @return mixed
     */
    private function argValue($operation, $argID) {
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
        if (is_numeric($c))
            return 'number';
        return 'string';
    }

    /**
     * Remplaza las variables en los parametros de la operacion
     * @param   string  $arg    variable
     * @param boolean $full llaves y corchetes
     * @return string resultado
     */
    private function remplaceParams($arg, $full = true) {
        if ($this->getArgType($arg) != 'var') {
            return $this->normalize($arg);
        }
        preg_match_all('/\\[([^\[]+[\.]+[^\[]+)\\]/', $arg, $matches);
        foreach ($matches[1] as $m) {
            $prop = $m;
            $value = $this->getAliasValue($prop);
            $arg = str_replace('[' . $prop . ']', $value, $arg);
        }
        if ($full == false) {
            return str_replace(array('{', '}'), '', $arg);
        }
        preg_match_all('/{([^}]+[\.]+[^}]+)}/', $arg, $matches);
        foreach ($matches[1] as $m) {
            $prop = $m;
            $value = $this->getAliasValue($prop);
            return $value;
        }
        return $arg;
    }

    /**
     * Separa el alias en objeto->propiedad
     * @param string $alias
     * @return array [obj],[string prop]
     */
    private function getArrayAlias($alias) {
        $expP = explode('.', $alias);
        $aliasObj = array_shift($expP);
        $obj = $this->getObject($aliasObj);
        return array($obj, implode('.', $expP));
    }

    /**
     * Devuelve el valor de la propiedad
     * @param string $prop
     * @return string
     */
    private function getAliasValue($prop) {
        $arr = $this->getArrayAlias($prop);
        $obj = $arr[0];
        if ($obj instanceof \Itracker\XMLPropInterface) {
            return $this->normalize(
                            $obj->get_Subprop($arr[1])
            );
        } else {
            return 'undefined';
        }
    }

    /**
     * Normaliza la variable
     * @param string $value
     * @return string
     */
    private function normalize($value) {
        return $value;
    }

    /**
     * Asigna valor al objeto
     * @param string $prop
     * @param string $value
     * @throws \Exception
     */
    private function asignValue($prop, $value) {
        $propR = $this->remplaceParams($prop, false);
        $arr = $this->getArrayAlias($propR);
        $obj = $arr[0];
        if ($obj instanceof \Itracker\XMLPropInterface) {
            try {
                $obj->set_prop($arr[1], $value);
            } catch (\Exception $e) {
                LoggerFactory::getLogger()->error('Error al setear variable en objeto ', 
                        array($prop,$propR, get_class($obj), $value));
                throw new \Exception('No se puede continuar la ejecucion, error al setear variable');
            }
        } else {
            LoggerFactory::getLogger()->error('Error al setear variable en objeto invalido', array($prop,$propR, get_class($obj), $value));
            throw new \Exception('No se puede continuar la ejecucion, error al setear variable');
        }
    }

}
