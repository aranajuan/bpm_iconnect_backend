<?php
define("VERSION","vx.x.x");
define("DEBUG_USER","U548391"); // usuario al que se le mostraran los errores y mediciones (separado por ;)
define("DEBUG_MEASURE",0); // mostrar tiempos de ejecucion
define("DEBUG_ACCESS_ONLY",0); // acceso solo a usuarios debug
define("ERROR_REPORTINGCONST",E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED);
define("LOG_LEVEL",  "error"); //para todos
define("LOG_LEVEL_DEBUG",  "debug");    //para usuario debug
/*
 *  En minuscula niveles de log
        LogLevel::EMERGENCY => 0,
        LogLevel::ALERT     => 1,
        LogLevel::CRITICAL  => 2,
        LogLevel::ERROR     => 3,
        LogLevel::WARNING   => 4,
        LogLevel::NOTICE    => 5,
        LogLevel::INFO      => 6,
        LogLevel::DEBUG     => 7
 */

define ("MAP_U",""); // mapea a otro usuario EJ: 548391>223547;


ini_set("SMTP","smtpappl01");
define("MAIL_ENABLED",1);
define("MAIL_SPLITER",",");
define("MAIL_HEADER","https://itracker.personal.com.ar/img/head_email.png");
define("MAIL_FOOTER","https://itracker.personal.com.ar/img/foot_email.png");

define("DOMAINS","TELECOM,CCPI,ITRACKER,SHAREPOINT");

// Configuraciones Base

define('BASE_DIR',realpath(dirname(realpath(dirname(__FILE__)).'/../../../')));
define("IPLOCAL","::1");
define('ROOT_DIR',BASE_DIR.'/itracker_app');

//time zone
date_default_timezone_set ( 'America/Argentina/Buenos_Aires' );

define('DBSERVER_ALL','mysql');				// mssql o mysql
define('DBSERVER_PREFIX',''); // 'dbo.'
define("DBSERVER_ODBC","pwin");
/* conexion a root */
define('DBHOST_ROOT','localhost');			//SERVIDOR DB
define('DBUSER_ROOT','root');				// Usuario DB
define('DBPASS_ROOT','XtEh5Bu8fdWaBvSv62dKYD7Pp9DYGp8fWT5Gc8a/sI4=');					// PASS DB
//txKiP8BpK0LbEpwkumD1RTiSw6W9XgDFr04N7VOC5To=  LOCAL
//YsUMJpZak1xKmsyotXuBgajNQ1fCkTCe4U5wBuO/0sw=  DWIN

define('USERDATE_READ_TIME','H:i');
define('USERDATE_READ_MONTH','m-Y');
define('USERDATE_READ_DATE','d-'.USERDATE_READ_MONTH);

//Parametros y constantes
define('USERDATE_READ',USERDATE_READ_DATE.' '.USERDATE_READ_TIME);

if(DBSERVER_ALL=='mysql'){
    define('DBDATE_READ','Y-m-d H:i:s');
    define('DBDATE_WRITE','Y-m-d H:i:s');
}
else{
    define('DBDATE_READ','M d Y h:i:s:uA');
    define('DBDATE_WRITE','Y-m-d H:i');
}
// ESTADOS OBJETOS
define('I_ACTIVE',0);
define('I_DELETED',1);

// Nuevo ID
define('I_NEWID',-1);

define("FILEUP_ATTACH_FOLDER","adjuntos");

define("REPORT_DAYSMAX",390);

define("OBJ_CACHE_ENABLED",1);

?>