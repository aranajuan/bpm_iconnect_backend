<?php

/**
 * Inserta
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
    $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
    if ($loadR !== "ok") {
        $result = "Usuario invalido";
    } else {
        $Ul->load_VEC($Context->get_params(null));
        $tAdds = explode(",", $Context->get_params("idsequipos"));
        if ($Context->get_params("idsequipos") != "" && count($tAdds)) {
            $Ul->change_teams($tAdds);
            $result = $Ul->update_DB();
        } else {
            $result = "Seleccione al menos un equipo";
        }
    }
    return $Context->createElement("result", $result);
}
