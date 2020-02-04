<?php

namespace Itracker\Services\Team;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = new \Itracker\Team();
        $O->load_VEC($Context->get_params(null));
        $O->insert_DB();

        $adms = explode(",", $Context->get_params("idsadms"));
        foreach ($adms as $usr) {
            try{
                $U = $Context->get_objcache()->get_object("USER", $usr);
                $U->add_adm($O->get_prop("id"));
            }catch(\Itracker\Exceptions\ItDeletedException $e){
                
            }
        }
    }

}