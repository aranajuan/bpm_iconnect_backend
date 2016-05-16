<?php
/**
 * Cargar automaticamente clases
 * @param type $classname
 */
function __autoloadIT($classname) {
    $classV = explode("\\", $classname);
    if (class_exists($classV[count($classV) - 1])) {
        return;
    }

    $classPath = ROOT_DIR . DIRECTORY_SEPARATOR . "app" . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $classname) . '.php';
    if (is_readable($classPath)) {
        require_once $classPath;
    }
}

spl_autoload_register('__autoloadIT');

include_once 'basic_functions.php'; // funciones basicas adicionales

include_once 'dbtables_root.php'; // tablas root

include_once 'access.php'; // lista de accesos

ini_set('post_max_size', '100M');
ini_set('upload_max_filesize', '100M');

$ContextConf = \Itracker\Context::getContext()->get_GlobalConfig();
/* Constantes */
ini_set('display_errors', $ContextConf->getInt('debug/displayerrors'));
define('I_ACTIVE', $ContextConf->getInt('constants/active'));
define('I_DELETED', $ContextConf->getInt('constants/deleted'));
define('I_NEWID',$ContextConf->getInt('constants/new'));
ini_set('SMTP',$ContextConf->getString('mail/smtp'));
date_default_timezone_set($ContextConf->getString('time/timezone'));
define('USERDATE_READ_TIME',$ContextConf->getString('time/userread/time'));
define('USERDATE_READ_MONTH',$ContextConf->getString('time/userread/month'));
define('USERDATE_READ_DATE',$ContextConf->getString('time/userread/date'));
define('USERDATE_READ',USERDATE_READ_DATE.' '.USERDATE_READ_TIME);
define('DBDATE_READ',$ContextConf->getString('time/database/read'));
define('DBDATE_WRITE',$ContextConf->getString('time/database/write'));
define('TMP_DIR',ROOT_DIR . DIRECTORY_SEPARATOR. 'tmp');

error_reporting($ContextConf->getInt('debug/error_reporting'));
if(!is_dir(TMP_DIR)){
    mkdir(TMP_DIR);
}

register_shutdown_function('finish'); // registra funcion de finalizacion - ver basic_functions

?>
