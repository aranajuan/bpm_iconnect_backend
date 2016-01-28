<?php

namespace Itracker\Actions;

/**
 *  Interfaz para todas las acciones que
 *  ejecutan modificacion sobre tkt
 */
interface ITActionsInterface {

    /**
     * Ejecuta servicio
     * @param \Itracker\Action $action
     * @return ITActionsGoResponse
     */
    public static function go($action);

    /**
     * Muestra valor accion
     * @param \Itracker\TktH    $th
     * @return ITActionsShowResponse
     */
    public static function show($th);
}