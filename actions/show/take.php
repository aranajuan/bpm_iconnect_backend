<?php
$uas= $obCI->get_object('USER',$this->get_prop("UA"));
if($uas){
    return "Tomado por ".$uas->get_prop("nombre");
}else{
    return "No se puede determinar usuario. Error ".$this->get_prop("UA");
}
