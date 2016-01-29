<?php

namespace Itracker\Services\Team;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = $Context->get_objcache()->get_object("Team", $Context->get_params("id"));
        return $Context->createElement("result", $O->delete_DB());
    }

}