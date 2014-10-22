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
        $userL->appendChild($RC->createElement("perfil", $user->get_prop("perfilT")));
        $userL->appendChild($RC->createElement("access", $user->get_prop("accessList")));
        $userL->appendChild($RC->createElement("nombre", $user->get_prop("nombre")));
        $userL->appendChild($RC->createElement("puesto", $user->get_prop("puesto")));
        $userL->appendChild($RC->createElement("ubicacion", $user->get_prop("ubicacion")));
        $userL->appendChild($RC->createElement("mail", $user->get_prop("mail")));
        $userL->appendChild($RC->createElement("telefono", $user->get_prop("telefono")));
    }
    else
        $userL = $RC->createElement("error",$rta);
    return $userL;
}