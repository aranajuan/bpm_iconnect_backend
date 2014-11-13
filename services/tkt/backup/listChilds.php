<?php

require_once "general_includes.php";
require_once 'classes/tkt.php';

$TKT = new TKT();
$rta = $TKT->load_DB($postV["id"]);

if ($rta != "ok") {
    echo "Error al cargar master: " . $rta;
    exit();
}

$TKT->load_childs();

$childs = $TKT->get_prop("childs");

foreach ($childs as $c) {
    $THC = $c->get_first_tktH();
    $titulo=$c->get_system()->get_prop("nombre")."&nbsp;<b>".$c->get_critic()."</b>";
    ?>
    <div style="width: 250px; border:1px solid;padding:5px;margin:3px;">
        ID:&nbsp;<?=$c->get_prop("id");?> | 
        <a style="color:blue;" href="javascript:alert_p('<?=strToJava($THC->get_prop("detalle"));?>','Detalles apertura')">
            <?=$THC->get_prop("FA")." (".$THC->get_prop("accion")->get_prop("nombre").")";?>
        </a> |
        <img src="img/b_search.png" class="img_lnk" style="display:inline;" onclick="show_details(<?=$c->get_prop("id").",'TKT: ".$c->get_prop("id")." (".strToJava($titulo).")'" ?>)" />
    </div>
    <?

}
?>
