<?php

$uas= new USER();
$uas->load_DB($this->get_prop("UA"));
return "Tomado por ".$uas->get_prop("nombre");
