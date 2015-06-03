<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {

    $u = $Context->get_User();
    $arrayTeam = array();
    $idsteams = explode(",", $Context->get_params("team"));
    foreach ($idsteams as $idteam) {
        if (!$u->in_team($idteam)) {
            return $Context->createElement("error", "Equipo invalido($idteam). Acceso denegado.");
        }
        array_push($arrayTeam, $idteam);
    }


    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$TOUCH_BY_TEAM, $arrayTeam);
    $Tf->set_filter(Itracker\TktFilter::$NOT_IDSTEAMS, $arrayTeam);
    $equipo = $u->get_team_obj($arrayTeam[0]);
    $view = $equipo->get_prop("staffhome_vista");

    if ($Context->get_params("filter") == "derived") {
        $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
    } else {
        $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_UPDATE);
        $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, @STRdate_format($Context->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
        $Tf->set_filter(Itracker\TktFilter::$DATE_TO, @STRdate_format($Context->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
    }

    $Tl = new Itracker\TktLister();
    $Tl->loadFilter($Tf);

    if (!$Tl->execute()) {
        return $Context->createElement("error", "Error al cargar listado. " . $Tf->getError());
    }

    $ALL_v = $Tl->getObjs();

    $response = $Context->createElement("data");
    $response->appendChild($Context->createElement("view", $view));
    $listL = $Context->createElement("list");
    $fields = array("id", "usr_o.nombre", "usr_o.equiposname", "FA", "FB", "u_tom_o.nombre", "prioridadtext", "childsc", "origen_json", "equipo.nombre", "status", "critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($Context, $fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}
