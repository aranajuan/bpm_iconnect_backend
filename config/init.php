<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED);
ini_set('display_errors', '1');

include_once 'config/defines_root.php'; //definiciones main de itracker

include_once 'utils/basic_functions.php'; // funciones basicas adicionales

include_once 'config/dbtables_root.php'; // tablas root

include_once 'config/access.php'; // lista de accesos

if(DBSERVER_ALL=='mssql')
    header('Content-Type: text/html; charset=iso-8859-1');



register_shutdown_function('finish'); // registra funcion de finalizacion - ver basic_functions

?>