<?php
namespace Itracker\Services;

use Itracker\ResponseElement;

interface ITServiceInterface{
    
    /**
     * Ejecuta servicio
     * @param @param \Itracker\Context $Context
     * @return ResponseElement Elemento a incorporar a la respuesta
     */
    public static function GO($Context);
}