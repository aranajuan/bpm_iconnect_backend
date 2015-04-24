<?php
$pos = array_get_key_val($this->get_prop("valoraccion"), TKT::$priorities[2]);
if($pos==-1){
    return array(null,"Se cambio la prioridad a ".$this->get_prop("valoraccion"));
}
$pT= TKT::$priorities[0][$pos]; 
return array(null,"Se cambio la prioridad a ".$pT);

