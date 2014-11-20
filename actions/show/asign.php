<?php

$uas= new USER();
$uas->load_DB($this->get_prop("valoraccion"));
return "Se ha asignado a ".$uas->get_prop("nombre");
