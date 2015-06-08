<?php

$T = $obCI->get_object('Team', $this->get_prop("objadj_id"));
if($T){
    $TT = $obCI->get_object('Tkt', $this->get_prop("idtkt"));;
    if($TT){
        $sv=$TT->get_status();
        $status=$sv[1];
    }else{
        $status=""; 
    }
    
    $asignado = " // Asignado a: ".$T->get_prop("nombre")." ($status)";
}else{
    $asignado= " // Asignado a: Indeterminado - Error ".$this->get_prop("objadj_id");
}

if($this->get_prop("UA_o")){
    $userGen="Generado por :"." ".$this->get_prop("UA")."-".$this->get_prop("UA_o")->get_prop("nombre")." (".$this->get_prop("UA_o")->get_prop("equiposname").")";
}else{
    $userGen="Generado por: Indeterminado - Error ".$this->get_prop("UA");
}

return array($T, $userGen.$asignado);

