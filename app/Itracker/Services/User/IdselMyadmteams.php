<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;

class IdselMyadmteams implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $teams = $Context->getUser()->get_prop("equiposadmobj");
        $rta = new ResponseElement('list');
        if ($teams) {
            foreach ($teams as $l)
                $rta->addValue($l->getData( array('id', 'nombrefull')));
        }
        return $rta;
    }

}