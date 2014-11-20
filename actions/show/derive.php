<?php

$uas= new TEAM();
$uas->load_DB($this->get_prop("valoraccion"));
return "Se ha derivado a ".$uas->get_prop("nombre");