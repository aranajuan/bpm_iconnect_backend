<?php

namespace Itracker\Utils;

use \Itracker\Exceptions\ItException;

class ITScript extends Operation {

    /**
     * Script a ejecutar
     * @var string
     */
    private $script;

    /**
     * Array de lineas del codigo
     * @var array
     */
    private $scriptArray;

    /**
     * Stack de operaciones [linea_origen,tag de salida]
     * @var array
     */
    private $stack;

    /**
     * Tag a saltar a (level,str)
     * @var array|null
     */
    private $jump;

    /**
     * Cantidad de lineas del script
     * @var int
     */
    private $scriptLen;

    /**
     * Carga script
     * @param string $script
     */
    public function loadScript($script) {
        $this->script = $script;
        $this->scriptToArray();
    }

    /**
     * Parsea script en lineas
     */
    private function scriptToArray() {
        $this->scriptArray = preg_split("/\\r\\n|\\r|\\n/", $this->script);
    }

    /**
     * Ejecuta el script desde la linea indicada
     * @param int $line
     * @return string   resultado del script
     */
    public function ejecute($line = 0) {
        $this->stack = array();
        $this->jump = null;
        $this->scriptLen = count($this->scriptArray);
        $this->ejecuteLine($line);
    }

    /**
     * Devuelve ultimo elemento del stack
     * @return array|null
     */
    private function StackGet() {
        if (count($this->stack) == 0) {
            return null;
        }
        return $this->stack[count($this->stack) - 1];
    }

    /**
     * Verifica fin de bloque,elimina del stack
     * @param string $line
     * @return boolean|array
     * @throws \Exception
     */
    private function getEndBlock($line) {
        $enders = array('endif', 'endwhile');
        if (!in_array($line, $enders)) {
            return false;
        }
        $stack = $this->StackGet();
        array_push($stack, $this->jump);
        $ll = count($this->stack);
        if ($line != $stack[1]) {
            throw new ItException('its/error', '', \KLogger\Psr\Log\LogLevel::ERROR
            , 'Error en script, finalizacion de bloques invalida');
        }
        if ($this->jump[0] == $ll) { //salto al mismo nivel
            $this->jump = null;
        }
        array_pop($this->stack);

        return $stack;
    }

    /**
     * Devuelve nivel de linea
     * @return int
     */
    private function getLineLevel() {
        return count($this->stack);
    }

    /**
     * Ejecuta linea de script
     * @param int $line linea ejecutando
     * @param string $prev  origen de ejecucion
     * @return string   resultado de la linea
     */
    private function ejecuteLine($line, $prev = null) {
        $lineStr = trim($this->scriptArray[$line]);
        /** Lineas para DEBUG
          echo ($line) . "#<b>" . $lineStr . "</b>:: PREV: " . $prev . "(JMP:" . print_r($this->jump, true) .
          ")(LL:" . $this->getLineLevel() . ")<br/>".print_r($this->stack,true)."<hr/>";
         * */
        //verifica fin de codigo
        if ($line >= $this->scriptLen) {
            return;
        }

        //saltar vacios
        if ($lineStr == '') {
            $this->ejecuteLine($line + 1, 'empty');
            return;
        }

        //verifica fin de bloque
        $endBlock = $this->getEndBlock($lineStr);
        if ($endBlock) {
            if ($lineStr == 'endwhile' && $endBlock[3] == null) {
                //salto de while
                $this->ejecuteLine($endBlock[0], 'endblock -loop');
                return;
            }
            $this->ejecuteLine($line + 1, 'endblock');
            return;
        }

        //salto level - jump to else
        if ($lineStr == $this->jump[1] && $this->getLineLevel() == $this->jump[0]) {
            $this->jump = null;
            $this->ejecuteLine($line + 1, 'jumpend');
            return;
        }

        //IF
        preg_match_all('/^if\s+(.+)\s+then$/', $lineStr, $matches);
        if (count($matches[1])) { //es un if
            array_push($this->stack, array($line, 'endif', $this->getLineLevel() + 1));
            if ($this->jump == null) {
                //verificar if
                $this->operate($matches[1][0]);
                if ($this->getResult()) {
                     $this->ejecuteLine($line + 1, 'if ok');
                     return;
                } else {
                    $this->jump = array($this->getLineLevel(), 'else');
                    $this->ejecuteLine($line + 1, 'if no ok');
                    return;
                }
            } else {
                $this->ejecuteLine($line + 1, 'jumping');
                return;
            }
        }
        //else - jump to endif
        if ($this->jump == null && $lineStr == 'else') {
            $stack = $this->StackGet();
            if ($this->getLineLevel() == $stack[2] && $stack[1] == 'endif') {
                $this->jump = array($this->getLineLevel(), 'endif');
                $this->ejecuteLine($line + 1, 'else and jump');
                return;
            }
        }

        //WHILE
        preg_match_all('/^while\s+(.+)/', $lineStr, $matches);
        if (count($matches[1])) { //es un while
            array_push($this->stack, array($line, 'endwhile', $this->getLineLevel() + 1));
            if ($this->jump == null) {
                //verificar
                $this->operate($matches[1][0]);
                if ($this->getResult()) {
                    $this->ejecuteLine($line + 1, 'while ok');
                    return;
                } else {
                    $this->jump = array($this->getLineLevel(), 'endwhile');
                    $this->ejecuteLine($line + 1, 'while no ok');
                    return;
                }
            } else {
                $this->ejecuteLine($line + 1, 'jumping');
                return;
            }
        }

        //CODE LINE
        if ($this->jump == null) {
            if ($lineStr == 'return') {
                return;
            }
            $this->operate($lineStr);
            $this->ejecuteLine($line + 1, 'next line');
            return;
        } else {
            $this->ejecuteLine($line + 1, 'moving');
            return;
        }

        throw new ItException('its/error', '', \KLogger\Psr\Log\LogLevel::ERROR
                , 'Error desconocido', array('script' => $this->script, 'linea' => "$line | $lineStr | $prev"));
            
    }

}
