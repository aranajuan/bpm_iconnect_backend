<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $dias = 5;
    $desde = date(DBDATE_WRITE, strtotime('-' . $dias . ' day'));
    $hasta = date(DBDATE_WRITE, strtotime('+1 day'));

    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$UA, array($Context->get_User()->get_prop("usr")));
    $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
    $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, $desde);
    $Tf->set_filter(Itracker\TktFilter::$DATE_TO, $hasta);

    $view = $Context->get_User()->getMyView();

    $Tl = new Itracker\TktLister();

    $Tl->loadFilter($Tf);

    if (!$Tl->execute()) {
        return $Context->createElement("error", "Error al cargar listado. " . $Tf->getError());
    }

    $ALL_v = $Tl->getObjs();
    
    $response = $Context->createElement("data");
    $response->appendChild($Context->createElement("view", "id,FA,FB=>FC"));
    $listL = $Context->createElement("list");
    $fields=array("id","usr_o.nombre","usr_o.equiposname","FA","FB","u_tom_o.nombre","prioridadtext","childsc","origen_json","equipo.nombre","status","critic");
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $listL->appendChild($l->getXML($Context, $fields));
        }
        $response->appendChild($listL);
        return $response;
    }
    return null;
}