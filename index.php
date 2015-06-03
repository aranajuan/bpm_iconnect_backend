<?php

require_once 'utils/init.php';

$RQ = trim(file_get_contents('php://input'));
$Context = \Itracker\Context::getContext();
$Context->getLogger(LOG_LEVEL);
$Context->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
echo $Context->get_response(); // error basico - front invalido - faltan parametros en header
exit();

?>