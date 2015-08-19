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
     * Nivel de la linea en ejecucion
     * @var int 
     */
    private $lineLevel;

    /**
     * Tag al que se requiere mover [string tag,level]
     * @var string
     */
    private $moveTOTag;

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
        $this->moveTOTag = null;
        $this->lineLevel = 0;
        $this->scriptLen = count($this->scriptArray);
        return $this->ejecuteLine($line);
    }

    /**
     * Ejecuta linea de script
     * @param int $line linea ejecutando
     * @param string $prev  origen de ejecucion
     * @return string   resultado de la linea
     */
    private function ejecuteLine($line, $prev = null) {

        if ($line >= $this->scriptLen) {
            return 'ok';
        }
        $lineStr = trim($this->scriptArray[$line]);
        if ($lineStr == '') {
            return $this->ejecuteLine($line + 1, 'empty');
        }

        if ($this->moveTOTag != null && in_array($lineStr, $this->moveTOTag[0])  &&
                $this->lineLevel == $this->moveTOTag[1]) {
            $this->moveTOTag = null;
            return $this->ejecuteLine($line + 1, 'find tag ' . print_r($this->moveTOTag, true));
        }

        if ($lineStr == 'endif') {
            $this->lineLevel--;
            return $this->ejecuteLine($line + 1, 'endif');
        }

        if ($lineStr == 'else' && $this->moveTOTag == null) {
            $this->moveTOTag = array(array('endif'), $this->lineLevel);
            return $this->ejecuteLine($line + 1, 'else level');
        }

        preg_match_all('/^if\s+(.+)\s+then$/', $lineStr, $matches);
        if (count($matches[1])) { //es un if
            $this->lineLevel++;
            if ($this->moveTOTag == null) {
                //verificar if
                if ($this->operate($matches[1][0])) {//error en if
                    return 'Error al ejecutar operacion linea #1:' . $line;
                }
                if ($this->getResult()) {
                    return $this->ejecuteLine($line + 1, 'if ok');
                } else {
                    $this->moveTOTag = array(array('else','endif'), $this->lineLevel);
                    return $this->ejecuteLine($line + 1, 'if no ok');
                }
            } else {
                return $this->ejecuteLine($line + 1, 'moving');
            }
        } else {
            if ($this->moveTOTag == null) {
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
        }
        LoggerFactory::getLogger()->error('Error en script', array('script' => $this->script, 'linea' => "$line | $lineStr | $prev"));
        return 'Script::Error desconocido';
    }

}
