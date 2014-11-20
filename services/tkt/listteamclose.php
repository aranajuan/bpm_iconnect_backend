<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $idteam = $RC->get_params("team");

    $dias = 5;
    $desde = date(USERDATE_READ, strtotime('-' . $dias . ' day'));
    $hasta = date(USERDATE_READ, strtotime('+1 day'));

    if (!$u->in_team($idteam)) {
        return $RC->createElement("error", "Equipo invalido. Acceso denegado.");
    }

    $filter = array("open" => "closed",
        "cfrom" => $desde,
        "cto" => $hasta,
        "opento" => $idteam
    );
    $ALL = new TKT();

    $equipo = $u->get_team_obj($idteam);
    $view = $equipo->get_prop("staffhome_vista");

    $ALL_v = $ALL->list_fiter($filter);

    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", $view));
    $listL = $RC->createElement("list");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($RC, array("id", "FA", "usr_o.nombre")));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}
