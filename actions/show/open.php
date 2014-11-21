<?php

$T = new TEAM();
$T->load_DB($this->get_prop("valoraccion"));

return "Asignado a: ".$T->get_prop("nombre");

