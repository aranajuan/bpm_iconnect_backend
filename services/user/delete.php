<?php

/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $Ul = $RC->get_objcache()->get_object("USER", $RC->get_params("usr"));
    $loadR = $RC->get_objcache()->get_status("USER", $RC->get_params("usr"));
    $userD = $RC->createElement("result");
    if ($loadR !== "ok") {
        $result = "Usuario invalido";
        $userD->appendChild($RC->createElement("ejecute", "error"));
        $userD->appendChild($RC->createElement("msj", $result));
    } else {
        $rest = $Ul->change_teams(array());
        if ($rest) {
            $result = $Ul->update_DB();
            if ($result === "ok") {
                $userD->appendChild($RC->createElement("ejecute", "ok"));
                $userD->appendChild($RC->createElement("msj", "El usuario aun posee equipos que no administras. Consulte al administrador general para bloquear el acceso."));
            } else {
                $userD->appendChild($RC->createElement("ejecute", "error"));
                $userD->appendChild($RC->createElement("msj", $result));
            }
        } else {
            $result = $Ul->delete_DB();
            if ($result === "ok") {
                $userD->appendChild($RC->createElement("ejecute", "ok"));
            } else {
                $userD->appendChild($RC->createElement("ejecute", "error"));
                $userD->appendChild($RC->createElement("msj", $result));
            }
        }
    }
    return $userD;
}
