<?php

namespace Itracker\Services\Tkt;

class Listmyclose implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $dias = 5;
        $desde = date(DBDATE_WRITE, strtotime('-' . $dias . ' day'));
        $hasta = date(DBDATE_WRITE, strtotime('+1 day'));

        $Tf = new Itracker\TktFilter();
        $Tf->set_filter(Itracker\TktFilter::$UA, array($Context->get_User()->get_prop("usr")));
        $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
        $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, $desde);
        $Tf->set_filter(Itracker\TktFilter::$DATE_TO, $hasta);

        $viewA = $Context->get_User()->getMyView();
        $view = $viewA[0];
        $fields = $viewA[1];

        $Tl = new Itracker\TktLister();

        $Tl->loadFilter($Tf);

        if (!$Tl->execute()) {
            return $Context->createElement("error", "Error al cargar listado. " . $Tf->getError());
        }

        $ALL_v = $Tl->getObjs();

        $response = $Context->createElement("data");
        $response->appendChild($Context->createElement("view", $view . ",fb=>FC"));
        $listL = $Context->createElement("list");

        if ($ALL_v) {
            foreach ($ALL_v as $l) {
                $listL->appendChild($l->getXML($Context, $fields));
            }
            $response->appendChild($listL);
            return $response;
        }
        return null;
    }

}