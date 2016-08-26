<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;

class Listmyteams implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Tf = new \Itracker\TktFilter();

        if ($Context->get_params("status") == "open") {
            $Tf->set_filter(\Itracker\TktFilter::$IS_OPEN, "true");
        } elseif ($Context->get_params("status") == "closed") {
            $Tf->set_filter(\Itracker\TktFilter::$DATE_FILTER, \Itracker\TktFilter::$DATE_FILTER_FB);
            $Tf->set_filter(\Itracker\TktFilter::$DATE_FROM, @STRdate_format($Context->get_params("cfrom"), USERDATE_READ, DBDATE_WRITE));
            $Tf->set_filter(\Itracker\TktFilter::$DATE_TO, @STRdate_format($Context->get_params("cto"), USERDATE_READ, DBDATE_WRITE));
        } else {
            return null;
        }

        $ids = explode(",", $Context->get_params("teams"));
        $teamsall = $Context->getUser()->get_prop("equiposobj");
        $uids = array();
        foreach ($teamsall as $t) {
            if (in_array($t->get_prop("id"), $ids)) {
                $usrs = $t->get_users();
                foreach ($usrs as $u) {
                    array_push($uids, $u->get_prop("usr"));
                }
            }
        }
        $Tf->set_filter(\Itracker\TktFilter::$UA, $uids);
        $Tl = new \Itracker\TktLister();
        $Tl->loadFilter($Tf);
        $Tl->execute();

        $viewA = $Context->getUser()->getMyView();
        $view = $viewA[0];
        $fields = $viewA[1];

        $rta = new ResponseElement ( 'data', new ResponseElement ( 'view', $view ) );
		$rta_list = new ResponseElement ( 'list' );
		if ($Tl->getCount () == 0) {
			return null;
		}
		while ( $l = $Tl->getObj () ) {
			$rta_list->addValue($l->getData($fields));
		}
		$rta->addValue($rta_list);
		return $rta;
    }

}