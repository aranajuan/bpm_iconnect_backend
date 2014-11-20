<?php
$pos = array_get_key_val($this->get_prop("valoraccion"), TKT::$priorities[2]);
if($pos==-1){
    return "Se cambio la prioridad a ".$this->get_prop("valoraccion");
}
$pT= TKT::$priorities[0][$pos]; 
return "Se cambio la prioridad a ".$pT;

