<?php

namespace Itracker\Services\User;
use Itracker\ResponseElement;

class IdselListreportteams implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $teams = $Context->get_User()->get_prop("equiposreportaobj");
        $rta = new ResponseElement('list');
        $filter = json_decode($Context->get_params("sel_params"),true);
        $filter=$filter['filter'];
        if ($teams) {
            foreach ($teams as $l){
                if($l->get_prop("mytkts_vista")=="" && $filter=="mytkts_vista"){
                    continue;
                }
                if($l->get_prop("staffhome_vista")=="" && $filter=="staffhome_vista"){
                    continue;
                }
                $rta->addValue($l->getData( array('id', 'nombrefull')));
                
            }
        }
        return $rta;
    }

}