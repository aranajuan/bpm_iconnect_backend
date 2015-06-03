<?php
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $dias = 5;
    $desde = date(DBDATE_WRITE, strtotime('-' . $dias . ' day'));
    $hasta = date(DBDATE_WRITE, strtotime('+1 day'));

    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$UA, array($RC->get_User()->get_prop("usr")));
    $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
    $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, $desde);
    $Tf->set_filter(Itracker\TktFilter::$DATE_TO, $hasta);

    $view = $RC->get_User()->getMyView();

    $Tl = new Itracker\TktLister();

    $Tl->loadFilter($Tf);

    if (!$Tl->execute()) {
        return $RC->createElement("error", "Error al cargar listado. " . $Tf->getError());
    }

    $ALL_v = $Tl->getObjs();
    
    $response = $RC->createElement("data");
    $response->appendChild($RC->createElement("view", "id,FA,FB=>FC"));
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