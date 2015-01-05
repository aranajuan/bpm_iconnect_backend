<?php

$T = $obCI->get_object('TEAM', $this->get_prop("valoraccion"));
if($T){
    $asignado = " // Asignado a: ".$T->get_prop("nombre");
}else{
    $asignado= " // Asignado a: Indeterminado - Error ".$this->get_prop("valoraccion");
}

if($this->get_prop("UA_o")){
    $userGen="Generado por ".$this->get_prop("UA_o")->get_prop("nombre");
}else{
    $userGen="Generado por: Indeterminado - Error ".$this->get_prop("UA");
}

return $userGen.$asignado;

