<?php

namespace Itracker\Services\Division;

class Update implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $D = $Context->get_objcache()->get_object("Division", $Context->get_params("id"));
        $D->load_VEC($Context->get_params(null));
        return $Context->createElement("result", $D->update_DB());
    }

}