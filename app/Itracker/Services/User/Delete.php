<?php

namespace Itracker\Services\User;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
        $loadR = $Context->get_objcache()->get_status("User", $Context->get_params("usr"));
        $userD = $Context->createElement("result");
        if ($loadR !== "ok") {
            $result = "Usuario invalido";
            $userD->appendChild($Context->createElement("ejecute", "error"));
            $userD->appendChild($Context->createElement("msj", $result));
        } else {
            $rest = $Ul->change_teams(array());
            if ($rest) {
                $result = $Ul->update_DB();
                if ($result === "ok") {
                    $userD->appendChild($Context->createElement("ejecute", "ok"));
                    $userD->appendChild($Context->createElement("msj", "El usuario aun posee equipos que no administras. Consulte al administrador general para bloquear el acceso."));
                } else {
                    $userD->appendChild($Context->createElement("ejecute", "error"));
                    $userD->appendChild($Context->createElement("msj", $result));
                }
            } else {
                $result = $Ul->delete_DB();
                if ($result === "ok") {
                    $userD->appendChild($Context->createElement("ejecute", "ok"));
                } else {
                    $userD->appendChild($Context->createElement("ejecute", "error"));
                    $userD->appendChild($Context->createElement("msj", $result));
                }
            }
        }
        return $userD;
    }

}