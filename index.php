<?php

require_once 'utils/init.php';

$RQ = trim(file_get_contents('php://input'));
$Context = \Itracker\Context::getContext();
$l = $Context->getLogger(LOG_LEVEL);
$Context->request($RQ, $_SERVER['REMOTE_ADDR'], $_SERVER['REQUEST_TIME']);
$RP = $Context->get_response();
echo $RP;
exit();

?>