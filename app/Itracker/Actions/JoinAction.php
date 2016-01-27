<?php

namespace Itracker\Actions;

class JoinAction implements ITActionsInterface {

    public static function go($action) {

        $obCI = \Itracker\ObjectCache::getInstance();
        $TKT = $action->getTKT();


        $idmaster = $action->getScriptResponse()->get_prop('id');
        $master = $obCI->get_object('Tkt', $idmaster);
        if ($obCI->get_status('Tkt', $idmaster) != 'ok') {
            return new ITActionsGoResponse('error', 'Error al cargar tkt.');
        }

        if ($action->isWorking()) {

            if (!$action->getLogged()->in_team($master->get_prop('idequipo'))) {
                return new ITActionsGoResponse('error', 'El ticket master no esta en tu equipo');
            }

            $utomM = $master->get_prop("u_tom");
            if ($utomM != null && $utomM != $action->getLogged()->get_prop('usr')) { //el ticket master esta tomado por otro
                $arrEJ = makeproparr($action->getTKT()->valid_actions(), 'ejecuta');
                if (!in_array('asign', $arrEJ)) {
                    return new ITActionsGoResponse('error',
                            'El ticket master esta tomado y no puedes asignarlo');
                }
            }
        }

        $action->setChilds($TKT->get_prop("childs"));

        $rtaOP = $TKT->join($master);

        $action->loadObjadjId($master->get_prop("id"));

        if ($rtaOP != "ok") {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
        
    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();

        $T = $obCI->get_object('Tkt', $th->get_prop('objadj_id'));
        return new ITActionsShowResponse($T, 'Unido a itracker ' .
                $th->get_prop('objadj_id'));
    }

}

?>
