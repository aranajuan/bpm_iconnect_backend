<?php
$uas= $obCI->get_object('USER',$this->get_prop("UA"));
if($uas){
    return array($uas, "Tomado por ".$uas->get_prop("nombre"));
}else{
    return array(null, "No se puede determinar usuario. Error ".$this->get_prop("UA"));
}
