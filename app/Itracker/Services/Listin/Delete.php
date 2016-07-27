<?php

namespace Itracker\Services\Listin;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $L = $Context->get_objcache()->get_object("Listin", $Context->get_params("id"));
        $L->delete_DB();
    }

}