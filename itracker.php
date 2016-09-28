<?php

if (! isset ( $argv [1] )) {
  echo "Acceso invalido";
  exit(1);
}

/* Ruta root */
define ( 'ROOT_DIR', dirname ( __FILE__ ) );
define ( 'CONFIG_DIR', ROOT_DIR . '/config/' );

/* Autoload para class, algunos includes y configuraciones */
require_once 'utils/init.php';

start_measure ( 'fullscript' );

$ContextConf = \Itracker\Utils\GlobalConfig::getInstance ();

$ContextConf->loadAlterVars('config_console.xml');

$logger = \Itracker\Utils\LoggerFactory::getLogger ( $ContextConf->getString ( 'debug/log_level' ) );

/* Contexto general */
$Context = \Itracker\Context::getContext ();

$handler = new \Itracker\RequestHandlers\HandlerConsole ();
$handler->loadEnvironment ( array (
    'fields' => $argv,
    'date' => date()
) );

$Context->setHandler ( $handler );
$rs = $Context->executeRequest ();

$logger->debug ( "msj", array (
		'in' => print_r($argv,true),
		'out' => $rs
) );

echo $rs;
exit (0);
