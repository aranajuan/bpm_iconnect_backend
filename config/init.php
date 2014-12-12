<?php
include_once 'config/defines_root.php'; //definiciones main de itracker

error_reporting(ERROR_REPORTINGCONST);
ini_set('display_errors', '1');

include_once 'utils/basic_functions.php'; // funciones basicas adicionales

include_once 'config/dbtables_root.php'; // tablas root

include_once 'config/access.php'; // lista de accesos

if(DBSERVER_ALL=='mssql')
    header('Content-Type: text/html; charset=iso-8859-1');

ini_set('post_max_size', '100M');
ini_set('upload_max_filesize', '100M');

register_shutdown_function('finish'); // registra funcion de finalizacion - ver basic_functions

?>