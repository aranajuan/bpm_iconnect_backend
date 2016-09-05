<?php

namespace Itracker\Services\System;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $O = new \Itracker\System();
        $O->load_VEC($Context->get_params(null));
        $O->insert_DB();
    }

}