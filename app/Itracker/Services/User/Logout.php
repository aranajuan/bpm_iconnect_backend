<?php

namespace Itracker\Services\User;

class Logout implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Context->getUser()->sessionClose();
    }

}