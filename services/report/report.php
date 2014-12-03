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

  $R->setFrom($RC->get_params("from"). "00:00");
  $R->setTo($RC->get_params("too")." 23:59");
  if(!$R->isvalid()){
      return $RC->createElement("error", "Fechas invalidas o periodo incorrecto. Seleccione un rango no mayor a ".REPORT_DAYSMAX. " dias.");
  }
  
  $teamVid=explode(",",$RC->get_params("teams"));
  $teamsVO=array();
  
  $u=$RC->get_User();
  foreach($teamVid as $id){
       $t = $u->get_team_obj($id); 
       if($t){
           array_push($teamsVO, $t);
       }
  }
  
  switch($RC->get_params("filter")){
      case "from":
          $R->openbyOpTeam($teamsVO);
          break;
      case "to":
          $R->listTouchStaffteam($teamsVO);
          break;
      
  }
  
  $lT= $R->getObjs();
  $data=$RC->createElement("data");
  $list=$RC->createElement("list");
  $tifMax=0;
  
  foreach($lT as $tkt){
      $tnode=$RC->createElement("TKT");
      $tnode->appendChild($RC->createElement("id",$tkt->get_prop("id")));
      $tnode->appendChild($RC->createElement("FA",$tkt->get_prop("FA")));
      //tipificacion
      $i=0;
      $topt=$tkt->get_tree_history();
      foreach($topt as $to){
          $i++;
          $tnode->appendChild($RC->createElement("T".$i,$to["ans"]));
      }
      if($i>$tifMax){
          $tifMax=$i;
      }
      
      
      $list->appendChild($tnode);
      //detalle.xml
  }
  $tlisTXT="";
  for($i=1;$i<=$tifMax;$i++){
      $tlisTXT.=",T".$i;
  }
  
  $data->appendChild($RC->createElement("view","id,FA".$tlisTXT));
  $data->appendChild($list);
  return $data;
    
}



