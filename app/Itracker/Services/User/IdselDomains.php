<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;

class IdselDomains implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $V = $Context->getUser()->list_alldomains();
        $rta = new ResponseElement('list');
        if ($V) {
            foreach ($V as $l) {
                $rta->addValue(new ResponseElement('DOMAIN',
                        array(
                            new ResponseElement('nombre',$l,  ResponseElement::TEXT)
                            )
                        ));

            }
        }
        return $rta;
    }

}