<?php

$T = $obCI->get_object('Team', $this->get_prop("objadj_id"));
if($T){
    $TT = $obCI->get_object('Tkt', $this->get_prop("idtkt"));;
    if($TT){
        $status=$TT->get_status();
    }else{
        $status=""; 
    }
    $asignado = " // Asignado a: ".$T->get_prop("nombre")." ($status)";
}else{
    $asignado= " // Asignado a: Indeterminado - Error ".$this->get_prop("objadj_id");
}

if($this->get_prop("UA_o")){
    $tnames=$this->get_prop("UA_o")->get_prop("equiposname");
    $tnamesv= explode(';',$tnames);
    if(count($tnamesv)>3){
        $tnames = implode(';',array_slice($tnamesv, 0,3));
        $tnames .= ' (+)';
    }
    $userGen="Generado por :"." ".$this->get_prop("UA")."-".
            $this->get_prop("UA_o")->get_prop("nombre").
            " (".$tnames.")";
}else{
    $userGen="Generado por: Indeterminado - Error ".$this->get_prop("UA");
}


return array($T, $userGen.$asignado);

