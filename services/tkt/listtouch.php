<?php

require_once 'classes/report.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $idteam = $RC->get_params("team");
    if (!$u->in_team($idteam)) {
        return $RC->createElement("error", "Equipo invalido. Acceso denegado.");
    }

    
    $R = new REPORT();

    $equipo = $u->get_team_obj($idteam);
    $view = $equipo->get_prop("staffhome_vista");

    $R->setOpen($RC->get_params("filter")!="derived_all");
    $R->setFrom($RC->get_params("cfrom"));
    $R->setTo($RC->get_params("cto"));

    $R->listTouchOutTeam($equipo);
    $ALL_v = $R->getObjs();
    
    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", $view));
    $listL = $RC->createElement("list");
    $fields=array("id","usr_o.nombre","usr_o.equiposname","FA","FB","u_tom_o.nombre","prioridadtext","childsc","origen_json","equipo.nombre","status","critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($RC, $fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}
