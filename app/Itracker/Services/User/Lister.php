<?php

namespace Itracker\Services\User;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $USERALL = new \Itracker\User($Context->get_Connection());
        $USERALL_v = $USERALL->list_all();
        $userL = $Context->createElement("list");
        if ($USERALL_v) {
            foreach ($USERALL_v as $u)
                $userL->appendChild($u->getXML($Context, array('usr', 'dominio', 'equiposname', 'mail', 'telefono', 'nombre', 'perfil', 'perfilT', 'ubicacion', 'puesto', 'fronts', 'idsequipos')));
            return $userL;
        }
        return null;
    }

}