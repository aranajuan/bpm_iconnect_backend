<?php

namespace Itracker\Services\Listin;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $L = new \Itracker\Listin();
        $L->load_VEC($Context->get_params(null));
        $L->insert_DB();
    }

}