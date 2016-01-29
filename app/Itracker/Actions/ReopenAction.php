<?php

namespace Itracker\Actions;

class ReopenAction implements ITActionsInterface {

    public static function go($action) {
        $TKT = $action->getTKT();

        $rtaOP = $TKT->re_open();
        if ($rtaOP != 'ok') {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
    }

    public static function show($th) {
       return null;
    }

}
