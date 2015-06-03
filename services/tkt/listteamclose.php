<?php

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();

    $dias = 5;
    $desde = date(DBDATE_WRITE, strtotime('-' . $dias . ' day'));
    $hasta = date(DBDATE_WRITE, strtotime('+1 day'));

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
    $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
    $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, $desde);
    $Tf->set_filter(Itracker\TktFilter::$DATE_TO, $hasta);

    $equipo = $u->get_team_obj($arrayTeam[0]);
    $view = $equipo->get_prop("staffhome_vista");

    $Tf->set_filter(Itracker\TktFilter::$IDMASTER, array('null'));
    $Tl = new Itracker\TktLister();

    $Tl->loadFilter($Tf);

    if (!$Tl->execute()) {
        return $RC->createElement("error", "Error al cargar listado. " . $Tf->getError());
    }

    $ALL_v = $Tl->getObjs();


    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", "id,js:show_childs:id:childsc=>Adjuntos,usr_o.nombre=>Usuario,usr_o.equiposname=>Grupo,FA,FB=>FC,u_tom_o.nombre=>Staff"));
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
