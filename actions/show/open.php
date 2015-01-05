<?php

$T = $obCI->get_object('TEAM', $this->get_prop("valoraccion"));
if($T){
    $TT = $obCI->get_object('TKT', $this->get_prop("idtkt"));;
    if($TT){
        $sv=$TT->get_status();
        $status=$sv[1];
    }else{
        $status=""; 
    }
    
    $asignado = " // Asignado a: ".$T->get_prop("nombre")." ($status)";
}else{
    $asignado= " // Asignado a: Indeterminado - Error ".$this->get_prop("valoraccion");
}

if($this->get_prop("UA_o")){
    $userGen="Generado por ".$this->get_prop("UA_o")->get_prop("nombre")."( ".$this->get_prop("UA_o")->get_prop("equiposname").")";
}else{
    $userGen="Generado por: Indeterminado - Error ".$this->get_prop("UA");
}

return $userGen.$asignado;

