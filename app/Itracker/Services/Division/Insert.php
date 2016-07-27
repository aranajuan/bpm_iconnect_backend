<?php

namespace Itracker\Services\Division;

class Insert implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $D = new \Itracker\Division($Context->get_Connection());
        $D->load_VEC($Context->get_params(null));
        $D->insert_DB();
    }

}