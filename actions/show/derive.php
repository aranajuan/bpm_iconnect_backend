<?php

$uas= $obCI->get_object('TEAM', $this->get_prop("objadj_id"));
if($uas){
    return array($uas, "Se ha derivado a ".$uas->get_prop("nombre"));
}else{
    return "No se puede determinar equipo. Error ".$this->get_prop("objadj_id");
}