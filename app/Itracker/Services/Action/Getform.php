<?php

namespace Itracker\Services\Action;
use Itracker\ResponseElement;

class Getform implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {

        $actionName = $Context->get_params("action");

        $A = $Context->get_objcache()->get_object("Action", $actionName);

        $idth = $Context->get_params("idth");
        if ($idth) {
            $TH = $Context->get_objcache()->get_object("TktH", $idth);
            $A->loadTH($TH);
        }

        $form = $A->get_prop("itf");

        $rta = new ResponseElement('data',
                $form->getInputDom(),
                ResponseElement::$XML);
        
        return $rta;
    }

}