<?php

namespace Itracker\Actions;

class UnjoinAction implements ITActionsInterface {

    public static function go($action) {

        $TKT = $action->getTKT();

        $rtaOP = $TKT->un_join();
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
