<?php

namespace Itracker\Services\Team;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = $Context->get_objcache()->get_object("Team", $Context->get_params("id"));
        $O->delete_DB();
    }

}