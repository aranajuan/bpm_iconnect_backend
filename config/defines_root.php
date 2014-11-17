<?php
define("DEBUG_USER","548391"); // usuario al que se le mostraran los errores y mediciones (separado por ;)
define("DEBUG_SQL_MSG",0); // mostrar errores sql
define("DEBUG_SQL_QUERY",0); //mostrar sentencias SQL
define("DEBUG_MEASURE",0); // mostrar tiempos de ejecucion
define("DEBUG_ACCESS_ONLY",0); // acceso solo a usuarios debug

define ("MAP_U",""); // mapea a otro usuario EJ: 548391>223547;


ini_set("SMTP","smtpappl01");
define("MAIL_ENABLED",0);

define("DOMAINS","TELECOM,CCPI,ITRACKER");
define("INSTANCES","TELECOMCCT,AGENTESTP");

// Configuraciones Base

define('BASE_DIR',realpath(dirname(realpath(dirname(__FILE__)).'/../../../')));

define('ROOT_DIR',BASE_DIR.'/itracker_app');
//echo ROOT_DIR;
define('INCLUDE_DIR',ROOT_DIR."/"); 

//time zone
date_default_timezone_set ( 'America/Argentina/Buenos_Aires' );

define('DBSERVER_ALL','mysql');				// mssql o mysql

/* conexion a root */
define('DBHOST_ROOT','localhost');			//SERVIDOR DB
define('DBUSER_ROOT','root');				// Usuario DB
define('DBPASS_ROOT','');					// PASS DB

//Parametros y constantes
define('USERDATE_READ','d-m-Y H:i');

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
define("FILEUP_ATTACH_FOLDER_THUMN",FILEUP_ATTACH_FOLDER."/thumbnail");

ini_set('include_path',ini_get('include_path').'./'.PATH_SEPARATOR.INCLUDE_DIR);

?>
