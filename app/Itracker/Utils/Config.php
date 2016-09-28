<?php

namespace Itracker\Utils;

class Config {

    /**
     *  Variables cargadas
     * @var Vars
     */
    protected $vars;

    /**
     *  Variables sobreescritas
     * @var Vars
     */
    protected $vars_alter;

    /**
     *
     * @param String $file  path to config
     * @throws Exception
     */
    public function __construct($file,$root='itracker') {
        $this->vars = new Vars();
        $this->vars->setRootTag($root);
        $this->vars->loadFile(CONFIG_DIR.$file);
        $this->vars_alter = null;
    }

    public function loadAlterVars($file,$root='itracker'){
        $this->vars_alter = new Vars();
        $this->vars_alter->setRootTag($root);
        $this->vars_alter->loadFile(CONFIG_DIR.$file);
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
        return explode(',', $this->getNodeValue($path));
    }

    /**
     * Busca el value del nodo
     * @param string $path
     * @return string
     * @throws \DOMException
     */
    private function getNodeValue($path) {
        if($this->vars_alter){
          $val = $this->vars_alter->getValue($path);
          if($val){ return $val; }
        }
        $val = $this->vars->getValue($path);
        return $val;
    }

}
