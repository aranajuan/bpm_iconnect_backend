<?php
namespace KLogger;

/**
 * Mensaje a loggear
 */
interface LogMsjInterface{
	
	/**
	 * Mensjae de log
	 * @return String
	 */
	public function getMsj();
	
	/**
	 * 
	 * @return Psr\Log\LogLevel Nivel de log
	 */
	public function getLevel();
	
	/**
	 * @return array Contexto
	 */
	public function getContext();
}