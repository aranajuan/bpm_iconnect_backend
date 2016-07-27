<?php

namespace Itracker\Services\User;
use Itracker\Exceptions\ItException;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"),false,true);
        $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
        /* Verificar estado en la base update o insert */
        if ($loadR === I_DELETED) {
            $Ul->hardDelete(); // elimina de la base fisicamente
            $Ul = new \Itracker\User();
            $Ul->load_VEC($Context->get_params(null));
            $Ul->change_teams(explode(",", $Context->get_params("idsequipos")));
            $Ul->insert_DB();
        } else{//cargar equipos nuevos y demas datos
            // UPDATE
            $Ul->load_VEC($Context->get_params(null));
            $tAdds = explode(",", $Context->get_params("idsequipos"));
            if ($Context->get_params("idsequipos") != "" && count($tAdds)) {
                $Ul->change_teams($tAdds);
                $Ul->update_DB();
            } else {
                throw new ItException('dbobject/checkdata', 'Seleccione al menos un equipo');
            }
        } 

    }

}