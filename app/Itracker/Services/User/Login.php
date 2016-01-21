<?php

namespace Itracker\Services\User;

class Login implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $user = $Context->get_User();
        $rta = $user->login($Context->get_params("pass"), $Context->get_Front(), $Context->getIp());
        if ($rta == "ok") {
            $userL = $Context->createElement("data");
            $userL->appendChild($Context->createElement("version", $Context->get_GlobalConfig()->getString('version')));
            $userL->appendChild($Context->createElement("hash", $user->get_prop("hash")));
            $userL->appendChild($Context->createElement("perfil", $user->get_prop("perfilT")));
            $userL->appendChild($Context->createElement("access", $user->get_prop("accessList")));
            $userL->appendChild($Context->createElement("nombre", $user->get_prop("nombre")));
            $userL->appendChild($Context->createElement("puesto", $user->get_prop("puesto")));
            $userL->appendChild($Context->createElement("ubicacion", $user->get_prop("ubicacion")));
            $userL->appendChild($Context->createElement("mail", $user->get_prop("mail")));
            $userL->appendChild($Context->createElement("telefono", $user->get_prop("telefono")));
            $userL->appendChild($Context->createElement("superuser", $user->get_prop("superuser")));
        } else {
            $userL = $Context->createElement("error", $rta);
        }
        return $userL;
    }

}