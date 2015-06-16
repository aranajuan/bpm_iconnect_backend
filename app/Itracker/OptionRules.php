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
            If ($cond->length == 0 || $this->checkCondition($cond, $user, $itform)) {
                $this->destinyNode = $dest->item(0);
                Utils\LoggerFactory::getLogger()->debug('Seteado destino', 
                        array(
                    'destino' => $this->destinyNode->textContent
                        )
                );
                return true;
            }
        }
        $this->destinyNode = null;
        Utils\LoggerFactory::getLogger()->warning('No hay destino valido', array('xml' => $this->fullRule,
            'itf' => $itform->get_output()
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
            switch ($validation->nodeName) {
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
                        Utils\LoggerFactory::getLogger()->warning('Regla invalida', array('xml' => $this->fullRule)
                        );
                        return false;
                    }
                    $id = $ids->item(0);
                    $value = $itform->get_value($id);
                    foreach ($validation->childNodes as $valL2) {
                        if ($valL2->nodeName == 'lessthan') {
                            if ($valL2->nodeValue >= $value) {
                                return false;
                            }
                        }
                        if ($valL2->nodeName == 'morethan') {
                            if ($valL2->nodeValue <= $value) {
                                return false;
                            }
                        }
                        if ($valL2->nodeName == 'equal') {
                            if ($valL2->nodeValue != $value) {
                                return false;
                            }
                        }
                    }
                    return true;
                default:
                    Utils\LoggerFactory::getLogger()->warning('Regla invalida', array('xml' => $this->fullRule)
                    );
            }
        }
        return true;
    }

    /**
     * Devuelve valor 
     * @param string $val   propiedad del destino
     * @return string
     */
    public function getDestiny($val) {
        
    }

}
