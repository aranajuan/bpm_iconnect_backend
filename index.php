<?php

require_once 'utils/init.php';

$RQ = trim(file_get_contents('php://input'));

$RH = new \Itracker\RController();

$RH->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
echo $RH->get_response(); // error basico - front invalido - faltan parametros en header
exit();

?>
