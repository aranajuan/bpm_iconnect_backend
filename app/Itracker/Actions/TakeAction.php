<?php

namespace Itracker\Actions;

class TakeAction implements ITActionsInterface {

    public static function go($action) {

        $TKT = $action->getTKT();

        $rtaOP = $TKT->take();
        if ($rtaOP != "ok") {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();
        $uas = $obCI->get_object('User', $th->get_prop('UA'));
        if ($uas) {
            return new ITActionsShowResponse($uas, 'Tomado por ' . $uas->get_prop('nombre'));
        } else {
            return new ITActionsShowResponse(null, 'No se puede determinar usuario. Error ' . $th->get_prop('UA'));
        }
    }

}
