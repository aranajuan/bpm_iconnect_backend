<?php

namespace Itracker\RequestHandlers;

/*
 * Interfaz de handlers
 */
interface HandlerInterface {
	
	/**
	 * Cargar datos input
	 * 
	 * @param mixed $input        	
	 * @throws \Itracker\Exceptions\ItErrorException
	 */
	public function loadEnvironment($input);
	/**
	 * Mostrar solicitud
	 * 
	 * @return String
	 */
	public function getRequest();
	
	/**
	 * Obtener header del request
	 * @return Header
	 */
	public function getHeader();
	
	/**
	 * Obtener Body del request
	 * @return Body
	 */
	public function getBody();
	
	/**
	 * Agregar response a la respuesta
	 * 
	 * @param \Itracker\ResponseElement $response        	
	 * @param String $path
	 *        	path donde agregar
	 * @throws \Itracker\Exceptions\ItErrorException
	 */
	public function addResponse($response, $path = null);
	
	/**
	 * Obtener respuesta
	 * 
	 * @return mixed
	 * @throws \Itracker\Exceptions\ItErrorException
	 */
	public function getResponse();
}
