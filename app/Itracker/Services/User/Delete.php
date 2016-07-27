<?php

namespace Itracker\Services\User;

class Delete implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $Ul = $Context->get_objcache()->get_object("User", $Context->get_params("usr"));

        $rest = $Ul->change_teams(array());
        if ($rest) {
            $result = $Ul->update_DB();
        } else {
            $result = $Ul->delete_DB();
        }
    }

}