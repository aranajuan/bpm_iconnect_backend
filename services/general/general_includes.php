<?php
require_once   "../init.php";
require_once "classes/db.php";
require_once "classes/user.php";
$u=$GLOBALS[UL]; // Cargar datos de usuario
if($u->status!="")
{
    echo $u->status. "- ".$_SERVER["PHP_SELF"];
    exit(0);
}
foreach($_GET as $nombre_campo => $valor)
   $postV [$nombre_campo ]= $valor ; 
foreach($_POST as $nombre_campo => $valor)
   $postV [$nombre_campo ]= $valor ; 


function obj_delete($o){
    global $postV;
    $o->load_DB($postV["id"]);
    return $o->delete_DB();  
}

function obj_insert($o){
    global $postV;
    $o->load_VEC($postV);
    $rta=$o->insert_DB();
    return $rta;
}

function obj_update($o){
    global $postV;
    $o->load_DB($postV["id"]);
    $o->load_VEC($postV);
    $rta= $o->update_DB();
    return $rta;
}
?>
