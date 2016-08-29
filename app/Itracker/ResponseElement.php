<?php

namespace Itracker;

use Itracker\Exceptions\ItFunctionalException;

class ResponseElement{
    
    /**
     * Tipos de respuesta
     * @var type 
     */
    public static $XML = 1;
    public static $TEXT = 2;
    public static $FILE = 3;
    public static $ARRAY = 4;
    
    /**
     * Titulo
     * @var string 
     */
    private $title;
    
    /**
     * Tipo de valor
     * @var int
     */
    private $type;
    
    /**
     * Valor
     * @var array|string|int
     */
    private $value;
    
    /**
     * Constructor
     * @param string $title
     * @param array|string|int $value
     * @param int $type
     */
    function __construct($title=null, $value=null,$type=null) {
        
        $this->title = null;
        $this->type = null;
        $this->value = null;
        
        $this->setTitle($title);
        
	if($type!=null){
            $this->setType($type);
        }
	
        if($value==null){
            return;
        }
        
        if(is_array($value)){
            foreach($value as $v){
                $this->addValue($v);
            }
        }else{
            $this->addValue($value);
        }
        
    }

    /**
     * Titulo
     * @return string
     */
    public function getTitle() {
        return $this->title;
    }

    /**
     * Setear titulo
     * @param string $title
     */
    public function setTitle($title) {
        $this->title = $title;
    }

    /**
     * Setear tipo de valor
     * @param int $type
     */
    public function setType($type){
        if($type>3 || $type<1){
            throw new ItFunctionalException('responseelement/invalidtype');
        }
        
        $this->type=$type;
    }

    /**
     * Obtener tipo
     * @return int
     */
    public function getType() {
        return $this->type;
    }

    /**
     * Obtener valor
     * @return array|string|int
     */
    public function getValue() {
        
        if($this->getType() == null){
            throw new ItFunctionalException('responseelement/invalidtype');
        }
        
        return $this->value;
    }

    /**
     * Agregar valor
     * @param \Itracker\ResponseElement|string|int $value
     * @return
     */
    public function addValue($value) {
        if($value instanceof ResponseElement){
            if($this->value == null){
                $this->value=array();
                $this->type=self::$ARRAY;
            }
            if(!is_array($this->value)){
                throw new ItFunctionalException('responseelement/invalidtype');
            }
            array_push($this->value, $value);
            return;
        }
        if($this->value != null){
            throw new ItFunctionalException('responseelement/invalidtype');
        }
        $this->value = $value;
        if($this->getType()==null){
        	$this->setType(self::$TEXT);
        }
    }


}