<?php

namespace Itracker\Services\Team;

class Update implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = $Context->get_objcache()->get_object("Team", $Context->get_params("id"));
        $O->load_VEC($Context->get_params(null));
        $adms = $O->get_prop("adms");
        $newadms = explode(",", $Context->get_params("idsadms"));
        $admsok = array();

        foreach ($adms as $ua) {
            if (!in_array($ua->get_prop("usr"), $newadms)) {
                $ua->remove_adm($O->get_prop("id"));
            } else {
                array_push($admsok, $ua->get_prop("usr"));
            }
        }

        foreach ($newadms as $Na) {
            if (!in_array($Na, $admsok)) {
                try{
                    $U = $Context->get_objcache()->get_object("USER", $Na);
                    $U->add_adm($O->get_prop("id"));
                }catch(\Itracker\Exceptions\ItDeletedException $e){
                    
                }
            }
        }

    }

}