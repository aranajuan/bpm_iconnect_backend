<?php

require_once 'config/init.php';
require_once 'classes/Rcontroller.php';
require_once 'classes/objectcache.php';

$RQ = trim(file_get_contents('php://input'));

$RH = new Rcontroller();
$RH->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
//ob_clean();
echo $RH->get_response(); // error basico - front invalido - faltan parametros en header
exit();

?>
