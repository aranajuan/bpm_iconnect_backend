<?php

namespace Itracker\Services\User;

class Lister implements \Itracker\Services\ITServiceInterface {

    /**
     * 
     * @param \Itracker\Context $Context
     * @return type
     */
    public static function GO($Context) {
        $idteam =  $Context->get_params('idteam');
        if(!$Context->get_User()->isadm($idteam)){
            return $Context->createElement('error', 'No tienes acceso a este equipo '.$idteam);
        }
        $team = $Context->get_objcache()->get_object("Team", $idteam);
        if($Context->get_objcache()->get_status("Team", $idteam) != "ok"){
            return $Context->createElement('error', 'Equipo invalido '.$idteam);
        }
        $USERALL_v = $team->get_users();
        $userL = $Context->createElement("list");
        if ($USERALL_v) {
            foreach ($USERALL_v as $u)
                $userL->appendChild($u->getXML($Context, array('usr', 'dominio', 'equiposname', 'mail', 'telefono', 'nombre', 'perfil', 'perfilT', 'ubicacion', 'puesto', 'fronts', 'idsequipos')));
            return $userL;
        }
        return null;
    }

}