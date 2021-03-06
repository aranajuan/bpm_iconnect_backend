<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

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
        $uids = array();
        $view = null;
        foreach ($ids as $idt) {
            $t = $Context->getUser()->get_team_obj($idt);
            if(count($ids) == 1){
              $view = $t->get_prop ( 'mytkts_vista' );
              $fields = $t->getFieldRequired ( 'mytkts_vista' );
            }
            if ($t) {
                $usrs = $t->get_users();
                foreach ($usrs as $u) {
                    array_push($uids, $u->get_prop("usr"));
                }
            }else{
            	throw new ItFunctionalException( 'service/checkdata',
            			"Equipo invalido(".$Context->get_params("teams")."). Acceso denegado." );
            }
        }
        $Tf->set_filter(\Itracker\TktFilter::$UA, $uids);
        $Tl = new \Itracker\TktLister();
        $Tl->loadFilter($Tf);
        $Tl->execute();

        if(!$view){
            $viewA = $Context->getUser()->getMyView();
            $view = $viewA[0];
            $fields = $viewA[1];
        }

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
