<?php

/**
 * Elimina sesiones del usuario
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
    $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
    if ($loadR !== "ok") {
        return $Context->createElement("error", 'Error al cargar usuario: '.$loadR);
    } else {
        $Ul->sessionCloseAll();
        return $Context->createElement("result", "ok");
    }
}