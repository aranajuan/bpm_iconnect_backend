<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;
use \Itracker\Exceptions\ItFunctionalException;

class Login implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
	try{
		$user = $Context->getUser();
		$user->login($Context->get_params("pass"),
			$Context->getFront(),
			$Context->getInstance(),
			$Context->getHandler()->getHeader()->getIpuser());
	}catch(ItFunctionalException $e){
		$msj = $e->getDescription();
		if($msj == ''){
			$msj='Usuario o contrase&ntilde;a invalidos';
		}
		throw new ItFunctionalException('service/checkdata',$msj);
	}
        $rta = new ResponseElement('data');
        $rta->addValue($user->getData(array('hash','perfilt','access','nombre',
            'puesto','ubicacion','mail','telefono','superuser')));
        return $rta;
    }

}
