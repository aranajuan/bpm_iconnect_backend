<?php

namespace Itracker\Services\User;
use Itracker\Exceptions\ItFunctionalException;
use Itracker\ResponseElement;

class Lister implements \Itracker\Services\ITServiceInterface {

    /**
     * 
     * @param \Itracker\Context $Context
     * @return type
     */
    public static function GO($Context) {
        $idteam =  $Context->get_params('idteam');
        if(!$Context->getUser()->isadm($idteam)){
           throw new ItFunctionalException('service/checkdata', 'No puede administrar este equipo');
        }
        $team = $Context->get_objcache()->get_object("Team", $idteam);

        $USERALL_v = $team->get_users();
        $rta = new ResponseElement('list');
        if ($USERALL_v) {
            foreach ($USERALL_v as $u)
                $rta->addValue($l->getData( array('usr', 'dominio', 'equiposname', 'mail', 'telefono', 'nombre', 'perfil', 'perfilT', 'ubicacion', 'puesto', 'fronts', 'idsequipos')));
        }
        return $rta;
    }

}