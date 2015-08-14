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
    private $lineLevel;
    private $moveTOTag;
    private $scriptLen;
    
    public function loadScript($script) {
        $this->script = $script;
        $this->scriptToArray();
    }

    private function scriptToArray() {
        $this->scriptArray = explode(PHP_EOL, $this->script);
    }

    public function ejecute($line) {
        $this->moveTOTag=null;
        $this->lineLevel=0;
        $this->scriptLen=count($this->scriptArray);
        return $this->ejecuteLine($line);
    }

    private function ejecuteLine($line,$prev=null) {
        
        if($line>=$this->scriptLen){
            return 'Finalizado OK';
        }
        $lineStr = trim($this->scriptArray[$line]);
        
        if ($lineStr == '') {
            return $this->ejecuteLine($line + 1,'empty');
        }

        if($this->moveTOTag!= null 
                && $lineStr==$this->moveTOTag[0] && 
                $this->lineLevel==$this->moveTOTag[1]){
            $this->moveTOTag=null;
            return $this->ejecuteLine($line + 1,'find tag '.print_r($this->moveTOTag,true));
        }
        
        if($lineStr=='endif'){
            $this->lineLevel--;
            return $this->ejecuteLine($line + 1,'endif');
        }
        
        if($lineStr=='else' && $this->moveTOTag==null){
            $this->moveTOTag=array('endif',$this->lineLevel);
            return $this->ejecuteLine($line + 1,'else level');
        }
        
        preg_match_all('/^if\s+(.+)\s+then$/', $lineStr, $matches);
        if(count($matches[1])){ //es un if
            $this->lineLevel++;
            if($this->moveTOTag==null){
                //verificar if
                if ($this->operate($matches[1][0])) {//error en if
                    return 'Error al ejecutar operacion linea:' . $line;
                }
                if ($this->getResult()) {
                    return $this->ejecuteLine($line + 1,'if ok');
                }else{
                    $this->moveTOTag=array('else',$this->lineLevel);
                    return $this->ejecuteLine($line + 1,'if no ok');
                }
            }else{
                return $this->ejecuteLine($line + 1,'moving');
            }
        }else{
            if($this->moveTOTag==null){
               if ($this->operate($lineStr)) {//error en if
                    return 'Error al ejecutar operacion linea:' . $line;
               }
               return $this->ejecuteLine($line + 1,'next line');
            }else{
               return $this->ejecuteLine($line + 1,'moving');
            }
        }
        return "Error desconocido | $line | $lineStr | $prev";
    }
}
