<?php

$T = new TEAM();
$T->load_DB($this->get_prop("valoraccion"));

return "Generado por ".$this->get_prop("UA_o")->get_prop("nombre")." // Asignado a: ".$T->get_prop("nombre");

