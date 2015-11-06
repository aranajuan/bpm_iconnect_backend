<?php

namespace Itracker\Utils;

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
        return $this->ejecuteLine($line);
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
            throw new \Exception('Error en script, finalizacion de bloques invalida');
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
                **/
        //verifica fin de codigo
        if ($line >= $this->scriptLen) {
            return 'ok';
        }

        //saltar vacios
        if ($lineStr == '') {
            return $this->ejecuteLine($line + 1, 'empty');
        }

        //verifica fin de bloque
        $endBlock = $this->getEndBlock($lineStr);
        if ($endBlock) {
            if ($lineStr == 'endwhile' && $endBlock[3] == null) {
                //salto de while
                return $this->ejecuteLine($endBlock[0], 'endblock -loop');
            }
            return $this->ejecuteLine($line + 1, 'endblock');
        }

        //salto level - jump to else
        if ($lineStr == $this->jump[1] && $this->getLineLevel() == $this->jump[0]) {
            $this->jump = null;
            return $this->ejecuteLine($line + 1, 'jumpend');
        }
        
        //IF
        preg_match_all('/^if\s+(.+)\s+then$/', $lineStr, $matches);
        if (count($matches[1])) { //es un if
            array_push($this->stack, array($line, 'endif',$this->getLineLevel()+1));
            if ($this->jump == null) {
                //verificar if
                if ($this->operate($matches[1][0])) {//error en if
                    return 'Error al ejecutar operacion linea #1:' . $line;
                }
                if ($this->getResult()) {
                    return $this->ejecuteLine($line + 1, 'if ok');
                } else {
                    $this->jump = array($this->getLineLevel(), 'else');
                    return $this->ejecuteLine($line + 1, 'if no ok');
                }
            } else {
                return $this->ejecuteLine($line + 1, 'jumping');
            }
        }
        //else - jump to endif
        if($this->jump==null && $lineStr == 'else'){
            $stack = $this->StackGet();
            if ($this->getLineLevel()==$stack[2] && $stack[1] == 'endif') {
                $this->jump = array($this->getLineLevel(), 'endif');
                return $this->ejecuteLine($line + 1, 'else and jump');
            }
        }
        
        //WHILE
        preg_match_all('/^while\s+(.+)/', $lineStr, $matches);
        if (count($matches[1])) { //es un while
            array_push($this->stack, array($line, 'endwhile',$this->getLineLevel()+1));
            if ($this->jump == null) {
                //verificar
                if ($this->operate($matches[1][0])) {//error en if
                    return 'Error al ejecutar operacion linea #1:' . $line;
                }
                if ($this->getResult()) {
                    return $this->ejecuteLine($line + 1, 'while ok');
                } else {
                    $this->jump = array($this->getLineLevel(), 'endwhile');
                    return $this->ejecuteLine($line + 1, 'while no ok');
                }
            } else {
                return $this->ejecuteLine($line + 1, 'jumping');
            }
        }

        //CODE LINE
        if ($this->jump == null) {
            if ($lineStr == 'return') {
                return 'ok';
            }
            if ($this->operate($lineStr)) {//error en if
                return 'Error al ejecutar operacion linea #2:' . $line;
            }
            return $this->ejecuteLine($line + 1, 'next line');
        } else {
            return $this->ejecuteLine($line + 1, 'moving');
        }

        LoggerFactory::getLogger()->error('Error en script', array('script' => $this->script, 'linea' => "$line | $lineStr | $prev"));
        return 'Script::Error desconocido';
    }

}
