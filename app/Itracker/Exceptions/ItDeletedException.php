<?php
namespace Itracker\Exceptions;

use KLogger\Psr\Log\LogLevel;

/**
 * Objeto eliminado
 */
class ItDeletedException extends ItFunctionalException {
	function __construct($error,$description=null, $logmsg = null, $logdata = null,$defaultLogLevel= null) {
		parent::__construct($error,$defaultLogLevel,$logdata,$logdata,LogLevel::NOTICE);
	}
}