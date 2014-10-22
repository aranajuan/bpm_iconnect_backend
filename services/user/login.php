<?php

/**
 * Loguea usuario
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $user= $RC->get_User();
    $rta = $user->login($RC->get_params("pass"), $RC->get_Front(), $RC->getIp());
    if ($rta == "ok") {
        $userL=$RC->createElement("data");
        $userL->appendChild($RC->createElement("hash",$user->get_prop("hash")));
        $userL->appendChild($RC->createElement("perfil", $user->get_prop("perfil")));
        $userL->appendChild($RC->createElement("access", $user->get_prop("accessList")));
    }
    else
        $userL = $RC->createElement("error",$rta);
    return $userL;
}