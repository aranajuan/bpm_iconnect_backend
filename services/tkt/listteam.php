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
    if (!$u->in_team($idteam)) {
        return $RC->createElement("error", "Equipo invalido. Acceso denegado.");
    }

    switch ($RC->get_params("filter")) {
        case "my":
            $filter = array(
                "open" => "open",
                "opento" => $idteam,
                "taken" => $u->get_prop("usr")
            );
            break;
        case "myNtom":
            $filter = array(
                "open" => "open",
                "opento" => $idteam,
                "taken" => $u->get_prop("usr").",null"
            );
            break;
        case "free":
            $filter = array(
                "open" => "open",
                "opento" => $idteam,
                "taken" => "null"
            );
            break;
        case "taken":
            $filter = array(
                "open" => "open",
                "opento" => $idteam,
                "taken" => "*"
            );
            break;
        case "closed":
            $filter = array("open" => "closed",
                "cfrom" => $RC->get_params("cfrom"),
                "cto" => $RC->get_params("cto"),
                "opento" => $idteam
            );
            break;
        default: //open todos
            $filter = array(
                "open" => "open",
                "opento" => $idteam
            );
    }
    
    $ALL = new TKT();

    $equipo = $u->get_team_obj($idteam);
    $view = $equipo->get_prop("staffhome_vista");

    $ALL_v = $ALL->list_fiter(array_merge($filter,array("master"=>"null")));

    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", $view));
    $listL = $RC->createElement("list");
    $fields=array("id","usr_o.nombre","usr_o.equiposname","FA","FB","u_tom_o.nombre","prioridadtext","childsc","origen_json","status","critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($RC, $fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}
