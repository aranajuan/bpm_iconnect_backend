<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;

class Login implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $user = $Context->getUser();
        $user->login($Context->get_params("pass"),
		$Context->getFront(),
		$Context->getHandler()->getHeader()->getIpuser());
        $rta = new ResponseElement('data');
        $rta->addValue($user->getData(array('hash','perfil','access','nombre',
            'puesto','ubicacion','mail','telefono','superuser')));
        return $rta;
    }

}