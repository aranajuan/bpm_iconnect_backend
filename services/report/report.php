<?php


require_once 'classes/report.php';
require_once 'classes/tkt.php';
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    
  //TODO chequear acceso a reporte  
  $R = new REPORT();
  
  return $RC->createElement("error", $R->listTouchStaffteam(array("1","4")));
    
}



