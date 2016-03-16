<?php

namespace Itracker\Services\System;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = $Context->get_objcache()->get_object("System", $Context->get_params("id"));
        return $Context->createElement("result", $O->delete_DB());
    }

}