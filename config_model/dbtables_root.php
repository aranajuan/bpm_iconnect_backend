<?php
$tPrefix = \Itracker\Utils\GlobalConfig::getInstance()
        ->getString('database/prefix');

$tables_root = array(
    array("TBL_FRONTS","itracker_root.".$tPrefix."fronts"),
    array("TBL_UCONTAC","itracker_root.".$tPrefix."ucontac"),
    array("TBL_USUARIOS","itracker_root.".$tPrefix."usuarios"),
    array("TBL_SESIONES","itracker_root.".$tPrefix."sesiones"),
    array("TBL_INSTANCIAS","itracker_root.".$tPrefix."instancias")
    );
?>
