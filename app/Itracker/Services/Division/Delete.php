<?php

namespace Itracker\Services\Division;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $D = $Context->get_objcache()->get_object("Division", $Context->get_params("id"));
        return $Context->createElement("result", $D->delete_DB());
    }

}