<?php

namespace Itracker\Actions;

class UpdateAction implements ITActionsInterface {

    public static function go($action) {

        $obCI = \Itracker\ObjectCache::getInstance();

        $TH = $action->getTH();
        if ($TH instanceof \Itracker\TktH) {
            $THA_name = $TH->get_prop('accion')->get_prop('nombre');
            $ActName = explode('-', $action->get_prop('nombre'));

            if ($ActName[1] != 'UPDATE' || $ActName[0] != $THA_name) {
                return new ITActionsGoResponse('error', 'No se puede actualizar (' . $THA_name . '->' .
                        $action->get_prop('nombre') . ')');
            }

            if ($TH->getThUpdate()) {
                return new ITActionsGoResponse('error', 'No se puede actualizar (evento actualizado previamente)');
            } else {
                $action->loadObjadjId($TH->get_prop('id'));
                // MOVER ADJUNTOS
                return new ITActionsGoResponse('ok', '');
            }
        } else {
            return new ITActionsGoResponse('error', 'No se puede actualizar (sin evento)');
        }
    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();

        $th = $obCI->get_object('TktH', $th->get_prop("objadj_id"));
        return new ITActionsShowResponse($th, '');
    }

}
