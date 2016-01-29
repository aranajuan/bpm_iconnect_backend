<?php

namespace Itracker\Actions;

class CloseAction implements ITActionsInterface {

    public static function go($action) {
        
        $TKT = $action->getTKT();

        $rtaOP = $TKT->close();
        if ($rtaOP != "ok") {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
    }

    public static function show($th) {
        return null;
    }

}

?>
