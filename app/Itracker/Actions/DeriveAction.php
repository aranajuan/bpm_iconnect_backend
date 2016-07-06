<?php

namespace Itracker\Actions;

use Itracker\Exceptions\ItException;

class DeriveAction implements ITActionsInterface {

    public static function go($action) {

        $obCI = \Itracker\ObjectCache::getInstance();
        $TKT = $action->getTKT();

        $idequipo = $action->getScriptResponse()->get_prop('id');
        $td=$obCI->get_object('Team', $idequipo);

        $TKT->derive($td);

        $action->loadObjadjId($td->get_prop("id"));

        return new ITActionsGoResponse('ok', '');

    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();
		try{
        	$uas = $obCI->get_object('Team', $th->get_prop("objadj_id"),false,true);
            return new ITActionsShowResponse($uas, 'Se ha derivado a ' . $uas->get_prop('nombre'));
        } catch(ItException $e) {
            return new ITActionsShowResponse(null, 'No se puede determinar equipo. Error ' .
                    $th->get_prop('objadj_id'));
        }
    }

}

?>
