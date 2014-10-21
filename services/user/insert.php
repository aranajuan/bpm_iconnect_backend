<?php
require_once   "general_includes.php";
require_once   'classes/user.php';
$o= new USER();
echo obj_insert($o);  
?>
