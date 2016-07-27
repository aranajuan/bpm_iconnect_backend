<?php

namespace Itracker\Services\System;

class Update implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = $Context->get_objcache()->get_object("System", $Context->get_params("id"));
        $O->load_VEC($Context->get_params(null));
        $O->update_DB();
    }

}