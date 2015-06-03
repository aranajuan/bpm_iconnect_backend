<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {

    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$UA, array($Context->get_User()->get_prop("usr")));

    if ($Context->get_params("status") == "open") {
        $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
    } elseif ($Context->get_params("status") == "closed") {
        $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
        $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, @STRdate_format($Context->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
        $Tf->set_filter(Itracker\TktFilter::$DATE_TO, @STRdate_format($Context->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
    } else {
        return null;
    }

    $view = $Context->get_User()->getMyView();
    
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