<?php

namespace Itracker\Services\Tkt;

class Listmyteams implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Tf = new Itracker\TktFilter();

        if ($Context->get_params("status") == "open") {
            $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
        } elseif ($Context->get_params("status") == "closed") {
            $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FB);
            $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, @STRdate_format($Context->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
            $Tf->set_filter(Itracker\TktFilter::$DATE_TO, @STRdate_format($Context->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
        } else {
            return null;
        }

        $ids = explode(",", $Context->get_params("teams"));
        $teamsall = $Context->get_User()->get_prop("equiposobj");
        $uids = array();
        foreach ($teamsall as $t) {
            if (in_array($t->get_prop("id"), $ids)) {
                $usrs = $t->get_users();
                foreach ($usrs as $u) {
                    array_push($uids, $u->get_prop("usr"));
                }
            }
        }
        $Tf->set_filter(Itracker\TktFilter::$UA, $uids);
        $Tl = new Itracker\TktLister();
        $Tl->loadFilter($Tf);
        if (!$Tl->execute()) {
            return $Context->createElement("error", "Error al cargar listado. " . $Tf->getError());
        }

        $viewA = $Context->get_User()->getMyView();
        $view = $viewA[0];
        $fields = $viewA[1];

        $ALL_v = $Tl->getObjs();

        $response = $Context->createElement("data");
        $response->appendChild($Context->createElement("view", $view));
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