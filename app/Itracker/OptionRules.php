<?php

namespace Itracker;

/**
 * Administracion de reglas de derivacion y asignacion
 * WF - Team
 */
class OptionRules {

    /**
     * Regla completa de DB
     * @var string 
     */
    private $fullRule;

    /**
     * Regla parseada
     * @var \DOMDocument
     */
    private $fullRuleParsed;

    /**
     * Nodo con destino
     * @var \DOMNode 
     */
    private $destinyNode;

    public function __construct($fullRule) {
        $this->destinyNode = null;
        $this->fullRule = $fullRule;

        $this->fullRuleParsed = new \DOMDocument();
        if ($this->fullRuleParsed->loadXML($this->fullRule) == false) {
            Utils\LoggerFactory::getLogger()->error('No se puede parsear xml de regla', array('xml' => $fullRule)
            );
            throw new \Exception("Error en parametrizacion de la tipificacion");
        }
    }

    /**
     * Carga valores para los parametros solicitados
     * @param User $user
     * @param ITForm $itform
     * @return boolean Destino encontrado
     */
    public function loadFor($user, $itform = null) {
        $this->destinyNode = null;
        $rules = $this->fullRuleParsed->getElementsByTagName('rule');
        foreach ($rules as $rule) {
            $cond = $rule->getElementsByTagName('condition');
            $dest = $rule->getElementsByTagName('destiny');

            if ($cond->length > 1) {
                Utils\LoggerFactory::getLogger()->error('Regla invalida mas de una condicion', array('xml' => $this->fullRule)
                );
                return false;
            }
            if ($dest->length != 1) {
                Utils\LoggerFactory::getLogger()->error('Regla invalida mas de un destino', 
                        array('xml' => $this->fullRule)
                );
                return false;
            }
            
            If ($cond->length == 0 || $this->checkCondition($cond->item(0), $user, $itform)) {
                $this->destinyNode = $dest->item(0);
                return true;
            }
        }
        $this->destinyNode = null;
        if($itform){
            $irfT=$itform->get_output();
        }else{
            $irfT='';
        }
        Utils\LoggerFactory::getLogger()->warning('No hay destino valido', array('xml' => $this->fullRule,
            'itf' => $irfT
                )
        );
        return false;
    }

    /**
     * Nodo a verificar
     * @param \DOMNode $condNode
     * @param User $user
     * @param ITForm $itform
     */
    private function checkCondition($condNode, $user, $itform) {
        foreach ($condNode->childNodes as $validation) {
            $nname=$validation->nodeName;
            switch ($nname) {
                case 'team':
                    $int = false;
                    foreach (explode(',', $validation->nodeValue) as $idt) {
                        if ($user->in_team($idt)) {
                            $int = true;
                            break;
                        }
                    }
                    if (!$int)
                        return false;
                    break;
                case 'user':
                    if (!in_array($user->get_prop('usr'), explode(',', $validation->nodeValue))) {
                        return false;
                    }
                    break;
                case 'division':
                    $equipos = $user->get_prop('equiposobj');
                    $validDir = explode(',', $validation->nodeValue);
                    $int = false;
                    foreach ($equipos as $e) {
                        if (in_array($e->get_prop('id'), $validDir)) {
                            $int = true;
                            break;
                        }
                    }
                    if (!$int)
                        return false;
                    break;
                case 'itfvalue':
                    $ids = $validation->getElementsByTagName('id');
                    if ($ids->length != 1) {
                        Utils\LoggerFactory::getLogger()->warning('Regla invalida sin ID', array('xml' => $this->fullRule)
                        );
                        return false;
                    }
                    $id = $ids->item(0)->nodeValue;
                    $value = $itform->get_value($id);
                    foreach ($validation->childNodes as $valL2) {
                        if ($valL2->nodeName == 'lessthan') {
                            if ($value >= $valL2->nodeValue) {
                                return false;
                            }
                        }
                        if ($valL2->nodeName == 'morethan') {
                            if ($value <= $valL2->nodeValue) {
                                return false;
                            }
                        }
                        if ($valL2->nodeName == 'equal') {
                            if ($valL2->nodeValue != $value) {
                                return false;
                            }
                        }
                    }
                case '#text': /*Ignora nuevas lineas y comentarios*/
                    break;
                    
                default:
                    Utils\LoggerFactory::getLogger()
                        ->warning('Regla invalida '.$nname,
                                array('xml' => $this->fullRule)
                    );
            }
        }
        return true;
    }

    /**
     * Devuelve true si tiene un destino cargado
     * @return boolean
     */
    public function hasDestiny(){
        return $this->destinyNode!=NULL;
    }
    
    /**
     * Devuelve valor 
     * @param string $val   propiedad del destino
     * @return string
     */
    public function getDestinyVal($val) {
        if($this->destinyNode==null){
            return null;
        }
        
        $fnd = $this->destinyNode->getElementsByTagName($val);
        if($fnd->length==1)
            return $fnd->item(0)->nodeValue;
        return null;
    }

     /**
     * Devuelve valor 
     * @param string $val   propiedad general
     * @return string
     */
    public function getVal($val) {
        if($this->fullRuleParsed==null){
            return null;
        }
        
        $fnd = $this->fullRuleParsed->getElementsByTagName($val);
        if($fnd->length==1)
            return $fnd->item(0)->nodeValue;
        return null;
    }

    
}
