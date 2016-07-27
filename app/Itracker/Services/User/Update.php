<?php

namespace Itracker\Services\User;

class Update implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));

        $Ul->load_VEC($Context->get_params(null));
        $tAdds = explode(",", $Context->get_params("idsequipos"));
        if ($Context->get_params("idsequipos") != "" && count($tAdds)) {
            $Ul->change_teams($tAdds);
            $Ul->update_DB();
            $Ul->sessionCloseAll();
        } else {
            throw new ItException('dbobject/checkdata', 'Seleccione al menos un equipo');
        }
    }

}