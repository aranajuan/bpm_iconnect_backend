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

    $ALL_v = $ALL->list_fiter(array_merge($filter,array("master"=>"null")));

    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", "id,js:showchilds:id:childsc=>Adjuntos,usr_o.nombre=>Usuario,usr_o.equiposname=>Grupo,FA,FB=>FC,u_tom_o.nombre=>Staff"));
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
