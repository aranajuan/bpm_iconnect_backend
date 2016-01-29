<?php
/**
 * DEPRECADO
 * 
 */
require_once "general_includes.php";
$u->change_contact($postV["mail"], $postV["tel"]);
echo $u->insert_ucontact();

?>