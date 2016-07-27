<?php

namespace Itracker\Services\User;

class SessionClear implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));
        $Ul->sessionCloseAll();

    }

}