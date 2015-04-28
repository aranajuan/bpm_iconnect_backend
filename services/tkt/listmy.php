<?php

require_once 'classes/tkt.php';
require_once 'classes/tktlister.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $Tf = new TKTFILTER();
    $Tf->set_filter(TKTFILTER::$UA, $RC->get_User()->get_prop("usr"));

    if ($RC->get_params("status") == "open") {
        $Tf->set_filter(TKTFILTER::$IS_OPEN, "true");
    } elseif ($RC->get_params("status") == "closed") {
        $Tf->set_filter(TKTFILTER::$DATE_FILTER, TKTFILTER::$DATE_FILTER_FB);
        $Tf->set_filter(TKTFILTER::$DATE_FROM, @STRdate_format($RC->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
        $Tf->set_filter(TKTFILTER::$DATE_TO, @STRdate_format($RC->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
    } else {
        return null;
    }

    $view = $RC->get_User()->getMyView();
    
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