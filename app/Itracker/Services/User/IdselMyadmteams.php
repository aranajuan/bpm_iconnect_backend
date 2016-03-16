<?php

namespace Itracker\Services\User;

class IdselMyadmteams implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $teams = $Context->get_User()->get_prop("equiposadmobj");
        $listL = $Context->createElement("list");
        if ($teams) {
            foreach ($teams as $l)
                $listL->appendChild($l->getXML($Context, array('id', 'nombrefull')));
            return $listL;
        }
        return null;
    }

}