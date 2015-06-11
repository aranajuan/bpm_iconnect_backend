<?php

namespace Itracker\Utils;

class Config {

    /**
     *
     * @var \DOMDocument
     */
    private $dom;

    /**
     *
     * @var \DOMXPath
     */
    private $xpath;

    /**
     *Ruta del archivo
     * @var String
     */
    private $file;
    /**
     * 
     * @param String $file  path to config
     * @throws Exception
     */
    public function __construct($file) {
        $this->dom = new \DOMDocument();
        if(!is_readable($file)){
            LoggerFactory::getLogger()->error(
                    'Archivo de configuraciones no seteado (no encontrado)',
                    array('path'=>$file));
            $this->dom=null;
            $this->xpath=null;
            throw new \Exception('No se pudo cargar archivo de configuraciones');
        }
        try {
            $this->dom->load($file);
            $this->xpath = new \DOMXPath($this->dom);
            $this->file=$file;
        } catch (\Exception $e) {
            LoggerFactory::getLogger()->error(
                    'Archivo de configuraciones no seteado',
                    array('path'=>$file,'msg'=> $e->getMessage() ));
            $this->dom=null;
            $this->xpath=null;
            throw new \Exception('No se pudo cargar archivo de configuraciones');
        }
    }

    /**
     * Devuelve configuracion
     * @param String $path
     * @return int
     */
    public function getInt($path) {
        $val = $this->getNodeValue($path);
        return intval($val);
    }

    /**
     * Devuelve configuracion
     * @param String $path
     * @return boolean
     */
    public function getBoolean($path) {
        $val = $this->getNodeValue($path);
        if ($val == 1 || $val == 'true') {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Devuelve configuracion
     * @param String $path
     * @return string
     */
    public function getString($path) {
        return $this->getNodeValue($path);
    }
    
    /**
     * Devuelve configuracion
     * @param String $path
     * @return Array
     */
    public function getArray($path) {
        return explode(',',$this->getNodeValue($path));
    }

    /**
     * Busca el value del nodo
     * @param string $path
     * @return string
     * @throws \DOMException
     */
    private function getNodeValue($path) {
        if($this->xpath==null){
            throw new \DOMException('Archivo de configuracion no cargado');
        }
        $Elements = $this->xpath->query('//itracker/' . $path);
        if ($Elements->length != 1) {
            LoggerFactory::getLogger()->error(
                    'Error en archivo de configuracion', 
                    array('xpath' => $path,'file'=>$this->file));
            throw new \DOMException('Archivo de configuracion invalido');
        }
        return $Elements->item(0)->nodeValue;
    }

}
