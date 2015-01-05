<?php

$uas= $obCI->get_object('USER', $this->get_prop("valoraccion"));
if($uas){
    return "Se ha asignado a ".$uas->get_prop("nombre");
}else{
    return "No se puede determinar usuario. Error ".$this->get_prop("valoraccion");
}
