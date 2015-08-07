<?php

namespace Itracker\Utils;

/**
 * Parsea ecuacion con los datos (strings y numeros)
 */
class OperationParser {

    /**
     * String de entrada
     * @var string
     */
    private $operationStr;

    /**
     * Largo de la cadena
     * @var int
     */
    private $operationStrLen;

    /**
     * Se detecto jumper en string
     * @var boolean
     */
    private $jumper;

    /**
     * Argumentos / valores
     * @var array 
     */
    private $args;

    /**
     * Operaciones
     * @var array 
     */
    private $ops;
    
    /**
     * Temporal de operaciones y argumentos
     * @var string
     */
    private $temp;

    /**
     * String a paresear, modelo JAVA
     * @param string $operation
     */
    public function __construct($operation) {
        $this->operationStr = $operation;
        $this->operationStrLen = strlen($this->operationStr);
        $this->jumper = false;
        $this->args = array();
        $this->ops = array();
        $this->temp = '';
        $this->parse();
    }

    public function print_all(){
        echo "------Operaciones:".  print_r($this->ops,true);
        echo "-----";
        echo "Argumentos:".  print_r($this->args,true);
    }
    
        /**
     * Devuelve operando de la posicion
     * @param int $pos
     * @return string
     */
    public function getArg($pos){
        return $this->args[$pos];
    }
    
    /**
     * Devuelve operador de la posicion
     * @param int $pos
     * @return string
     */
    public function getOpe($pos){
        return $this->ops[$pos];
    }
    /**
     * Parsea desde la posicion indicada
     * @param type $i
     */
    private function parse($i = 0) {
        if ($i >= $this->operationStrLen) {
            return;
        }
        $char = $this->operationStr{$i};
        if ($char == '\'') {
            $this->parse(
                    $this->getString($i)
            );
        } elseif (is_numeric($char)) {
            $this->parse(
                    $this->getNumber($i)
            );
        } elseif ($char != ' ') {
            $this->parse(
                    $this->getOperator($i)
            );
        } else {
            $this->parse($i + 1);
        }
    }

    /**
     * Agrega Argumento o operacion
     * @param string $type
     */
    private function addTemp($type) {
        if ($type == 'arg') {
            array_push($this->args, $this->temp);
        } else {
            array_push($this->ops, $this->temp);
        }
        $this->temp = '';
    }

    /**
     * Parsea string continuo
     * @param int $i    posicion inicial
     * @return int  posicion a continuar
     */
    private function getString($i) {
        $char = $this->operationStr{$i};
        $this->temp.=$char;

        if ($char == '\'' && $this->temp != '\'' && !$this->jumper) {
            $this->addTemp('arg');
            return $i + 1;
        }

        if ($char == '\\') {
            $this->jumper = true;
        } else {
            $this->jumper = false;
        }


        if ($i < $this->operationStrLen) {
            return $this->getString($i + 1);
        }
        echo "forced";
        return $i;
    }
    
    /**
     * Parsea operacion continuo
     * @param int $i    posicion inicial
     * @return int  posicion a continuar
     */
    private function getOperator($i) {
        $char = $this->operationStr{$i};
        if ($char == '\'' ||
                is_numeric($char) ||
                $char == ' ' ||
                $i == $this->operationStrLen) {
            $this->addTemp('ops');
            return $i;
        }
        $this->temp.=$char;
        if ($i < $this->operationStrLen) {
            return $this->getOperator($i + 1);
        }
    }

    /**
     * Parsea numero continuo
     * @param int $i    posicion inicial
     * @return int  posicion a continuar
     */
    private function getNumber($i, $recursive = false) {
        $char = $this->operationStr{$i};
        if ($char == '.' || is_numeric($char) || $char == ',') {
            $this->temp.=$char;
            if ($i < $this->operationStrLen) {
                $i = $this->getNumber($i + 1, true);
            }
        }
        if (!$recursive) {
            $this->addTemp('arg');
        }
        return $i;
    }

}
