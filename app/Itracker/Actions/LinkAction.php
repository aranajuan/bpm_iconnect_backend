<?php

namespace Itracker\Actions;

class LinkAction implements ITActionsInterface {

    public static function go($action) {
        $idth = $action->getScriptResponse()->get_prop('id');
        $action->setChilds(null);
        if (is_numeric($idth)) {
            $action->loadObjadjId($idth);
            return new ITActionsGoResponse('ok', '');
        } else {
            return new ITActionsGoResponse('error', 'Id invalido');
        }
    }

    public static function show($th) {
        return null;
    }

}