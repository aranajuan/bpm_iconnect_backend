<?php

namespace Itracker\Services\System;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = new \Itracker\System();
        $O->load_VEC($Context->get_params(null));
        return $Context->createElement("result", $O->insert_DB());
    }

}