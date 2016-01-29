<?php

namespace Itracker\Actions;

class DeriveAction implements ITActionsInterface {

    public static function go($action) {

        $obCI = \Itracker\ObjectCache::getInstance();
        $TKT = $action->getTKT();

        $idequipo = $action->getScriptResponse()->get_prop('id');
        $td = $obCI->get_object('Team', $idequipo);
        if ($obCI->get_status('Team', $idequipo) != "ok") {
            return new ITActionsGoResponse('error', 'Error al cargar equipo. #1'.$idequipo);
        }

        $rtaOP = $TKT->derive($td);

        $action->loadObjadjId($td->get_prop("id"));

        if ($rtaOP != 'ok') {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();

        $uas = $obCI->get_object('Team', $th->get_prop("objadj_id"));
        if ($uas) {
            return new ITActionsShowResponse($uas, 'Se ha derivado a ' . $uas->get_prop('nombre'));
        } else {
            return new ITActionsShowResponse(null, 'No se puede determinar equipo. Error ' .
                    $th->get_prop('objadj_id'));
        }
    }

}

?>
