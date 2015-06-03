<?php
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

    $Tf = new Itracker\TktFilter();

    $Tf->set_filter(Itracker\TktFilter::$IDSTEAMS, $arrayTeam);

    switch ($RC->get_params("filter")) {
        case "my":
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
            $Tf->set_filter(Itracker\TktFilter::$TAKENBY, array($u->get_prop("usr")));
            break;
        case "myNtom":
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
            $Tf->set_filter(Itracker\TktFilter::$TAKENBY, array($u->get_prop("usr"),
                'null'));
            break;
        case "free":
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
            $Tf->set_filter(Itracker\TktFilter::$TAKENBY, array('null'));
            break;
        case "taken":
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
            $Tf->set_filter(Itracker\TktFilter::$TAKENBY, array('*'));
            break;
        case "closed":
            $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
            $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, @STRdate_format($RC->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
            $Tf->set_filter(Itracker\TktFilter::$DATE_TO, @STRdate_format($RC->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
            break;
        default: //open todos
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
    }

    $equipo = $u->get_team_obj($arrayTeam[0]);
    $view = $equipo->get_prop("staffhome_vista");

    $Tf->set_filter(Itracker\TktFilter::$IDMASTER, array('null'));

    $Tl = new Itracker\TktLister();
    $Tl->loadFilter($Tf);
    
    if(!$Tl->execute()){
        return $RC->createElement("error", "Error al cargar listado. ".$Tf->getError());
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
