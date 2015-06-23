<?php

/**
 * Inserta
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
    $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
    /* Verificar estado en la base update o insert */
    if ($loadR === "eliminado") {
        $Ul->hardDelete(); // elimina de la base fisicamente
        $Ul = new \Itracker\User();
        $Ul->load_VEC($Context->get_params(null));
        $Ul->change_teams(explode(",", $Context->get_params("idsequipos")));
        $result = $Ul->insert_DB();
    } elseif ($loadR === "ok") {//cargar equipos nuevos y demas datos
        // UPDATE
        $Ul->load_VEC($Context->get_params(null));
        $tAdds = explode(",", $Context->get_params("idsequipos"));
        if ($Context->get_params("idsequipos")!="" && count($tAdds)) {
            $Ul->change_teams($tAdds);
            $result = $Ul->update_DB();
        } else {
            $result = "Seleccione al menos un equipo";
        }
    } else { //errores de falta de creado
        $Ul->hardDelete(); // elimina de la base fisicamente
        $Ul = new \Itracker\User($Context->get_Connection());
        $Ul->load_VEC($Context->get_params(null));
        $Ul->change_teams(explode(",", $Context->get_params("idsequipos")));
        $result = $Ul->insert_DB();
    }
    return $Context->createElement("result", $result);
}
