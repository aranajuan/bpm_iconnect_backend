<?php

namespace Itracker\Actions;

class CloseAction implements ITActionsInterface {

    public static function go($action) {
        
        $TKT = $action->getTKT();

        $TKT->close();

        return new ITActionsGoResponse('ok', '');

    }

    public static function show($th) {
        return null;
    }

}

?>
