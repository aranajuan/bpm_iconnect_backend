<?php
namespace Itracker\Services;

interface ITServiceInterface{
    
    /**
     * Ejecuta servicio
     * @param @param \Itracker\Context $Context
     * @return \DOMElement Elemento a incorporar a la respuesta
     */
    public static function GO($Context);
}