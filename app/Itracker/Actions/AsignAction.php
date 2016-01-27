<?php

namespace Itracker\Actions;

class AsignAction implements ITActionsInterface {
    
    public static function go($action) {
        
        $obCI = \Itracker\ObjectCache::getInstance();
        $TKT = $action->getTKT();

        $idusr = $action->getScriptResponse()->get_prop('id');
        $tou = $obCI->get_object('User', $idusr);
        if ($obCI->get_status('User', $idusr) != "ok") {
            return new ITActionsGoResponse('error', 'Error al cargar usuario');
        }

        $rtaOP = $TKT->asign($tou);

        $action->loadObjadjId($tou->get_prop("usr"));

        if ($rtaOP != "ok") {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            return new ITActionsGoResponse('ok', '');
        }
    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();
        $uas = $obCI->get_object('User', $th->get_prop("objadj_id"));
        if ($uas) {
            return new ITActionsShowResponse($uas,'Se ha asignado a ' . $uas->get_prop('nombre'));
        } else {
            return new ITActionsShowResponse(null,
                    'No se puede determinar usuario. Error ' . $th->get_prop('objadj_id'));

        }
    }

}

?>
