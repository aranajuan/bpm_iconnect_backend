<?php
require_once   "general_includes.php";
require_once   "classes/tkt_ext.php";

$tktExt = new TKT_EXT();

$tktExt->load($postV["type"], $postV["idtkt"]);

echo $tktExt->get_popup();


?>
