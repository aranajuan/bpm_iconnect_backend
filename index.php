<?php
/* Ruta root */
define('ROOT_DIR', dirname(__FILE__));

/* Autoload para class, algunos includes y configuraciones */
require_once 'utils/init.php';

/* Contexto general */
$Context = \Itracker\Context::getContext();

$Context->getLogger($Context->get_GlobalConfig()->getString('debug/log_level'));

if ($Context->get_GlobalConfig()->getString('database/motor') == 'mssql')
    header('Content-Type: text/html; charset=iso-8859-1');

/* Routing */
if(preg_match('/\\/aux\\/.*/' ,$_SERVER["REQUEST_URI"])){
    /* aux connections */
    
}

$RQ = trim(file_get_contents('php://input'));

$Context->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
$RP = $Context->get_response();
$Context->getLogger()->debug('RQ',array('RQ'=>$RQ,'RS'=>$RP));
echo $RP;
exit();

?>