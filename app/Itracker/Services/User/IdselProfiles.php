<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;

class IdselProfiles implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $V = $Context->getUser()->list_allprofiles();
        $rta = new ResponseElement('list');
        if ($V) {
            foreach ($V as $l) {
                if ($l["id"] > 1) {
                    $rta->addValue(new ResponseElement('PROFILE',
                        array(
                            new ResponseElement('id',$l["id"],  ResponseElement::TEXT),
                            new ResponseElement('nombre',$l["nombre"],  ResponseElement::TEXT)
                            )
                        ));
                }
            }
        }
        return $rta;
    }

}