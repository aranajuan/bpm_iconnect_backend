<?php

namespace Itracker\Actions;

class JoinAction implements ITActionsInterface {

    public static function go($action) {

        $TKT = $action->getTKT();
        $itf = $action->getitform();
        $destiny = $action->getScriptResponse();
        $context = \Itracker\Context::getContext();
        $extra = array();
        
        /* VALIDACIONES */

        if (!$TKT->is_active()) {
            return new ITActionsGoResponse('error', 'Error en tipificacion. #1');
        }

        $lstOption = $TKT->get_last();

        if (!is_numeric($destiny->get_prop('id'))) {
            $context->getLogger()
                    ->warning('No hay destino valido id en script', array(
                'id' => $lstOption->get_prop('id'),
                'usr' => $context->get_User()->get_prop('usr'),
                'data' => $context->get_params('form')
            ));
            return new ITActionsGoResponse('error', 'Error en tipificacion. #2');
        }



        /* ABRIR */
        $rtaOP = $TKT->open($destiny->get_prop('id'));

        if ($lstOption->get_prop('unir')) {
            $extra["openother"] = 0;
        } else {
            $extra["openother"] = 1;
        }

        $action->loadObjadjId($TKT->get_prop("idequipo"));

        if ($rtaOP != "ok") {
            return new ITActionsGoResponse('error', $rtaOP);
        } else {
            $extra["id"] = $TKT->get_prop("id");
            $action->force_tkth();
        }

        /* CERRAR A FILE */
        $file = $destiny->get_prop('file');
        if ($file) { //no une
            $extra["type"] = "file";
            $extra["file"] = $file;
            $rta = $TKT->ejecute_action("CERRAR_RUTA", array(array("id" => "link_archivo",
                    "value" => $file)));
            if ($rta["result"] == "ok") {
                $extra["status"] = "close";
            } else {
                $extra["status"] = "open";
            }

            return new ITActionsGoResponse('ok', '',$extra);
        }


        /* UNIR */
        if (!$lstOption->get_prop('unir')) {
            return new ITActionsGoResponse('ok', '',$extra);
        }

        $idmaster = $itf->getExtravalue('idmaster');

        if (is_numeric($idmaster) && $idmaster > 0) {
            $rta = $TKT->ejecute_action("UNIR", array(array("id" => "idmaster",
                    "value" => $idmaster)));
            if ($rta["result"] != "ok") {
                $extra["type"] = "tkt";
                return new ITActionsGoResponse('ok',
                        "No se pudo unir al master." . $rta["msj"] . "-" . $rta["result"],
                        $extra);
            }
        }
        return new ITActionsGoResponse('ok','',$extra);

    }

    public static function show($th) {
        $obCI = \Itracker\ObjectCache::getInstance();

        $T = $obCI->get_object('Team', $th->get_prop('objadj_id'));
        if ($T) {
            $TT = $obCI->get_object('Tkt', $th->get_prop("idtkt"));

            if ($TT) {
                $status = $TT->get_status();
            } else {
                $status = "";
            }
            $asignado = " // Asignado a: " . $T->get_prop('nombre') . " ($status)";
        } else {
            $asignado = " // Asignado a: Indeterminado - Error " . $th->get_prop('objadj_id');
        }

        if ($th->get_prop('UA_o')) {
            $tnames = $th->get_prop('UA_o')->get_prop('equiposname');
            $tnamesv = explode(';', $tnames);
            if (count($tnamesv) > 3) {
                $tnames = implode(';', array_slice($tnamesv, 0, 3));
                $tnames .= ' (+)';
            }
            $userGen = 'Generado por :' . ' ' . $th->get_prop('UA') . '-' .
                    $th->get_prop('UA_o')->get_prop('nombre') .
                    ' (' . $tnames . ')';
        } else {
            $userGen = 'Generado por: Indeterminado - Error ' . $th->get_prop('UA');
        }

        return new ITActionsShowResponse($T, $userGen . $asignado);
    }

}