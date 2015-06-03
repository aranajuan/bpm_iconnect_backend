<?php

$uas= $obCI->get_object('User', $this->get_prop("objadj_id"));
if($uas){
    return array($uas,"Se ha asignado a ".$uas->get_prop("nombre"));
}else{
    return array(null,"No se puede determinar usuario. Error ".$this->get_prop("objadj_id"));
}
