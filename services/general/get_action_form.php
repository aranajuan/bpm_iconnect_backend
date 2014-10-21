<?php
require_once   "../init.php";
require_once "classes/action.php";

$a = new ACTION();
if($a->loadDB_name($_POST["accion"])!="ok"){
    echo "Error al cargar la accion solicitada.";
    exit();
}

echo $a->get_prop("form");

?>
