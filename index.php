<?php

/* Ruta root */
define ( 'ROOT_DIR', dirname ( __FILE__ ) );
define ( 'CONFIG_DIR', ROOT_DIR.'/config/' );

/* Autoload para class, algunos includes y configuraciones */
require_once 'utils/init.php';

start_measure ( 'fullscript' );

$ContextConf = \Itracker\Utils\GlobalConfig::getInstance ();

$logger = \Itracker\Utils\LoggerFactory::getLogger ( $ContextConf->getString ( 'debug/log_level' ) );

if ( $ContextConf->getString ( 'database/motor' ) == 'mssql' )
	header ( 'Content-Type: text/html; charset=iso-8859-1' );

/* Contexto general */
$Context = \Itracker\Context::getContext ();

/* Routing */
if ( preg_match ( '/\\/aux\\/.*/', $_SERVER["REQUEST_URI"] ) ) {
	/* aux connections */
	$req = $_GET['service'];
	$Context->getAccessLog()->add( 'rq_class', 'xtra' );
	$Context->getAccessLog()->add ( 'rq_method', $req );
	$Context->getAccessLog()->add ( 'front_ip', $_SERVER['REMOTE_ADDR'] );
	if ( preg_match ( '/[a-zA-Z0-9_]*/', $req ) ) {
		$filereq = ROOT_DIR . DIRECTORY_SEPARATOR . 'xtra' . DIRECTORY_SEPARATOR . $req . '.php';
		if ( file_exists ( $filereq ) ) {
			include $filereq;
		} else {
			$Context->getAccessLog()->add ( 'error', 'true' );
			echo 'invalid service.#1';
		}
	} else {
		$Context->getAccessLog()->add ( 'error', 'true' );
		echo 'invalid service.#2';
	}
}

if ( !isset ( $argv[1] ) ) {
	$handler = new \Itracker\RequestHandlers\HandlerXML();
	$handler->loadEnvironment ( array (
	    'txt' => trim(file_get_contents('php://input')),
	    'ipfront' => $_SERVER['REMOTE_ADDR'],
	    'date' => $_SERVER['REQUEST_TIME']
	) );
}

$Context->setHandler ( $handler );
$rs = $Context->executeRequest ();
$logger->debug("msj",array('in'=>trim(file_get_contents('php://input')),'out'=>$rs));
echo $rs;
exit ();
