<?php

/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $Ul = $RC->get_objcache()->get_object("USER", $RC->get_params("usr"));
    $loadR = $RC->get_objcache()->get_status("USER", $RC->get_params("usr"));
    if ($loadR !== "ok") {
        $result = "Usuario invalido";
    } else {
        $Ul->load_VEC($RC->get_params(null));
        $tAdds = explode(",", $RC->get_params("idsequipos"));
        if ($RC->get_params("idsequipos") != "" && count($tAdds)) {
            $Ul->change_teams($tAdds);
            $result = $Ul->update_DB();
        } else {
            $result = "Seleccione al menos un equipo";
        }
    }
    return $RC->createElement("result", $result);
}
