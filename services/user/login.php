<?php

/**
 * Loguea usuario
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $user= $RC->get_User();
    $rta = $user->login($RC->get_params("pass"), $RC->get_Front(), $RC->getIp());
    $DOM = $RC->get_responseDOM();
    if ($rta == "ok") {
        $userL=$DOM->createElement("data");
        $userL->appendChild($DOM->createElement("hash",$user->get_prop("hash")));
        $userL->appendChild($DOM->createElement("perfil",$user->get_prop("perfil")));
    }
    else
        $userL = $DOM->createElement("error",$rta);
    return $userL;
}