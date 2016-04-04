<?php
/* Ruta root */
define('ROOT_DIR', dirname(__FILE__));

/* Autoload para class, algunos includes y configuraciones */
require_once 'utils/init.php';

start_measure('fullscript');

/* Contexto general */
$Context = \Itracker\Context::getContext();

$Context->getLogger($Context->get_GlobalConfig()->getString('debug/log_level'));

if ($Context->get_GlobalConfig()->getString('database/motor') == 'mssql')
    header('Content-Type: text/html; charset=iso-8859-1');

/* Routing */
if(preg_match('/\\/aux\\/.*/' ,$_SERVER["REQUEST_URI"])){
    /* aux connections */
    $req = $_GET['service'];
    $Context->add_accessLog('rq_class', 'xtra');
    $Context->add_accessLog('rq_method', $req);
    $Context->add_accessLog('front_ip', $_SERVER['REMOTE_ADDR']);
    if(preg_match('/[a-zA-Z0-9_]*/',$req )){
        $filereq = ROOT_DIR.DIRECTORY_SEPARATOR.'xtra'.DIRECTORY_SEPARATOR.$req.'.php'; 
        if(file_exists($filereq)){
            include $filereq;
        }else{
            $Context->add_accessLog('error','invalid service.#1');
            echo 'invalid service.#1';
        }
    }else{
        $Context->add_accessLog('error','invalid service.#2');
        echo 'invalid service.#2';
    }
    
}else{
    $RQ = trim(file_get_contents('php://input'));
    $Context->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
    $RP = $Context->get_response();
    $Context->getLogger()->debug('RQ',array('RQ'=>$RQ,'RS'=>$RP));
    echo $RP;
}

stop_measure('fullscript');
$Context->add_accessLog('timeelapsed', get_measure('fullscript'));
$Context->add_accessLog('memoryusage', memory_get_peak_usage(true));
if( $Context->get_Connection() instanceof Itracker\Utils\ConnectionManager){
    $Context->add_accessLog('sql_elapsed', $Context->get_Connection()->getSqlElapsed());
    $Context->add_accessLog('sql_count', $Context->get_Connection()->getSqlCount());
    $Context->get_Connection()->close_connections();
}

\Itracker\Utils\LoggerFactory::getAccessLogger()->write($Context->get_accesslogJson().','.PHP_EOL);
exit();

?>