<?php

namespace Itracker\Services\Listin;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $L = new Itracker\Listin();
        $L->load_VEC($Context->get_params(null));
        return $Context->createElement("result", $L->insert_DB());
    }

}