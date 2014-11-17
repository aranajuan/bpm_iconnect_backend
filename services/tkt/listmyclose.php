<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $dias = 5;
    $desde = date(USERDATE_READ, strtotime('-' . $dias . ' day'));
    $hasta = date(USERDATE_READ, strtotime('+1 day'));

    $filter = array("open" => "closed",
        "cfrom" => $desde,
        "cto" => $hasta,
        "openby" => $RC->get_User()->get_prop("usr")
        );

    $ALL = new TKT();

    $equipos = $RC->get_User()->get_prop("equiposobj");
    if (count($equipos)) {
        $view = $equipos[0]->get_prop("mytkts_vista");
    } else {
        $view = "";
    }

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