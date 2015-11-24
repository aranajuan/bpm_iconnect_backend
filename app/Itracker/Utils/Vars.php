<?php

namespace Itracker\Utils;

/**
 * Variables de XML
 * Se ingresa XML y se extraen u opera con datos de las variables
 * 
 * @author juan
 */
class Vars implements \Itracker\XMLPropInterface {

    /**
     *  Xml de la base
     * @var String 
     */
    private $xml;

    /**
     * Parseado de $xml
     * @var \DOMDocument
     */
    private $dom_init;

    /**
     *  Clonado de init.
     * @var \DOMDocument
     */
    private $dom;

    /**
     *  Variables $vars[name]=value
     * @var array
     */
    private $vars;

    /**
     * Tag root
     * @var string
     */
    private $rootTag;

    public function __construct($rootag = null) {
        if ($rootag) {
            $this->clean();
            $this->setRootTag($rootag);
        }
    }

    /**
     *  Carga variables desde archivo
     * @param string $path
     * @return boolean
     */
    public function loadFile($path) {
        $this->dom_init = new \DOMDocument();
        $this->dom = null;
        $this->vars = null;
        try {
            if ($this->dom_init->load($path) == false) {
                LoggerFactory::getLogger()->error('Error al parsear Xml de variables', array($path));
                return false;
            }
        } catch (\Exception $e) {
            LoggerFactory::getLogger()->error(
                    'Error en archivo de vars', array('path' => $path, 'msg' => $e->getMessage()));
            return false;
        }

        $this->xml = $this->dom_init->saveXML();

        $this->dom = clone $this->dom_init;

        return $this->loadVars();
    }

    /**
     *  Carga variables desde String XML
     * @param string $xml
     * @return boolean  se pudo cargar
     */
    public function loadXML($xml) {
        $this->xml = $xml;
        $this->dom_init = new \DOMDocument();
        $this->dom = null;
        $this->vars = null;
        if ($this->dom_init->loadXML($this->xml) == false) {
            LoggerFactory::getLogger()->error('Error al parsear Xml de variables', array($xml));
            return false;
        }

        $this->dom = clone $this->dom_init;

        return $this->loadVars();
    }

    /**
     *  Carga desde nodo
     * @param \DOMNode $node
     * @return boolean  se pudo cargar
     */
    public function loadNode($node) {
        $this->dom_init = new \DOMDocument();
        $this->dom = null;
        $this->vars = null;
        $nodeImp = $this->dom_init->importNode($node, true);
        if ($nodeImp == false) {
            LoggerFactory::getLogger()->error('No se puede importar nodo de var', array($node->textContent));
            return false;
        }

        $this->dom_init->createElement($nodeImp->nodeName)
                ->appendChild($nodeImp);

        $this->xml = $this->dom_init->saveXML();

        $this->dom = clone $this->dom_init;

        return $this->loadVars();
    }

    /**
     *  Genera nuevamente los documentos para cargar datos
     */
    public function clean() {
        $this->xml = '';
        $this->dom_init = new \DOMDocument();
        $this->dom = clone $this->dom_init;
    }

    /**
     * Set tag root
     * @param string $tag
     */
    public function setRootTag($tag) {
        $this->rootTag = $tag;
    }

    /**
     *  Carga valores de variables
     * @return boolean  se pudo cargar
     */
    private function loadVars($node = null) {

        if ($node == null) {
            $node = $this->dom;
            $this->vars = array();
        }

        foreach ($node->childNodes as $v) {
            if ($v->nodeType == XML_TEXT_NODE || $v->nodeType == XML_COMMENT_NODE) {
                continue;
            }
            if ($this->hasChildren($v)) {
                if ($this->loadVars($v) == false) {
                    return false;
                }
            } else {
                $rpos = strtolower($v->getNodePath());
                $value = $v->nodeValue;
                $this->vars[$rpos] = $value;
            }
        }
        return true;
    }

    /**
     * Evalua si hay hijos reales
     * @param \DOMElement $p
     * @return boolean  Hay hijos
     */
    private function hasChildren($p) {
        if ($p->hasChildNodes()) {
            foreach ($p->childNodes as $c) {
                if ($c->nodeType == XML_ELEMENT_NODE)
                    return true;
            }
        }
        return false;
    }

    /**
     *  Devuelve valor de la variable
     * @param string $varName
     * @param boolean $exception lanzar error
     * @return mixed
     * @throws \Exception
     */
    public function getValue($varName,$exception=false) {
        $varName = str_replace('.', '/', $varName);
        $varName = strtolower('/' . $this->rootTag . '/' . $varName);
        if (!isset($this->vars[$varName])) {
            if($exception){
                throw new \Exception('Variable no seteada-'.$varName);
            }else{
                return null;
            }
        }

        return $this->vars[$varName];
    }

    /**
     *  Setea valor de la variable
     * @param string $varName   /path/
     * @param mixed $value  | null para eliminar
     */
    public function setValue($varName, $value) {
        $varName = str_replace('.', '/', $varName);
        $varName = strtolower('/' . $this->rootTag . '/' . $varName);
        $this->vars[$varName] = $value;
    }

    /**
     * Genera documento con las variables modificadas
     * @return \DOMDocument
     */
    public function getXml() {
        $this->dom = new \DOMDocument();
        foreach ($this->vars as $k => $v) {
            $this->createElement($k, $v);
        }
        return $this->dom;
    }

    /**
     * Agrega elemento a dom
     * @param string $path
     * @param mixed $v
     */
    private function createElement($path, $v) {
        $pathV = explode('/', $path);
        $pos = count($pathV) - 1;
        $i = 0;
        $dompos = $this->dom;
        foreach ($pathV as $p) {
            if ($i == $pos) {
                $nnode = $this->dom->createElement($p, trim(xmlEscape(strip_tags($v))));
                $dompos->appendChild($nnode);
                return;
            }

            if ($i == 0 && $p == '') {
                $i++;
                continue;
            }

            $els = $dompos->getElementsByTagName($p);

            if ($els->length == 0) {
                $nnode = $this->dom->createElement($p);
                $dompos->appendChild($nnode);
                $dompos = $nnode;
            } else {
                $dompos = $els->item(0);
            }

            $i++;
        }
    }

    public function get_prop($property) {
        return $this->getValue($property);
    }

    public function set_prop($property, $value) {
        return $this->setValue($property, $value);
    }

    public function get_Subprop($p, $hideError = false) {
        return $this->getValue($p,!$hideError);
    }

}
