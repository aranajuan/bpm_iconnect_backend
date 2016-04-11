<?php

namespace Itracker\Services\User;

class Get implements \Itracker\Services\ITServiceInterface {
    
    public static function GO($Context) {
        $u = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
        $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
        if($loadR!="ok"){
            return $Context->createElement('error', 'Usuario inexistente.');
        }
        return $u->getXML($Context, array('usr', 'dominio', 'equiposname', 'mail', 'telefono', 'nombre', 'perfil', 'perfilT', 'ubicacion', 'puesto', 'fronts', 'idsequipos'));
    }    
}

?>
