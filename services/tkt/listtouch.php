<?php

require_once 'classes/tkt.php';
require_once 'classes/tktlister.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $arrayTeam = array();
    $idsteams = explode(",", $RC->get_params("team"));
    foreach ($idsteams as $idteam) {
        if (!$u->in_team($idteam)) {
            return $RC->createElement("error", "Equipo invalido($idteam). Acceso denegado.");
        }
        array_push($arrayTeam, $idteam);
    }


    $Tf = new TKTFILTER();
    $Tf->set_filter(TKTFILTER::$TOUCH_BY_TEAM, $arrayTeam);
    $Tf->set_filter(TKTFILTER::$NOT_IDSTEAMS, $arrayTeam);
    $equipo = $u->get_team_obj($arrayTeam[0]);
    $view = $equipo->get_prop("staffhome_vista");

    if ($RC->get_params("filter") == "derived") {
        $Tf->set_filter(TKTFILTER::$IS_OPEN, "true");
    } else {
        $Tf->set_filter(TKTFILTER::$DATE_FILTER, TKTFILTER::$DATE_FILTER_UPDATE);
        $Tf->set_filter(TKTFILTER::$DATE_FROM, @STRdate_format($RC->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
        $Tf->set_filter(TKTFILTER::$DATE_TO, @STRdate_format($RC->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
    }

    $Tl = new TKTLISTER();
    $Tl->loadFilter($Tf);

    if (!$Tl->execute()) {
        return $RC->createElement("error", "Error al cargar listado. " . $Tf->getError());
    }

    $ALL_v = $Tl->getObjs();

    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", $view));
    $listL = $RC->createElement("list");
    $fields = array("id", "usr_o.nombre", "usr_o.equiposname", "FA", "FB", "u_tom_o.nombre", "prioridadtext", "childsc", "origen_json", "equipo.nombre", "status", "critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($RC, $fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}
