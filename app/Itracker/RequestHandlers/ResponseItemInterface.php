<?php
namespace Itracker\RequestHandlers;

interface ResponseItemInterface{
	    /**
     * Tipos de respuesta
     * @var type 
     */
    const XML = 1;
    const TEXT = 2;
    const FILE = 3;
    const ARRAYL = 4;
	
    /**
     * Obtener tipo
     * @return int
     */
    public function getType();

    /**
     * Obtener valor
     * @return array|string|int
     */
    public function getValue();
    
        /**
     * Titulo
     * @return string
     */
    public function getTitle();
}