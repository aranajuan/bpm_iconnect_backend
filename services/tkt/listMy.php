<?php
require_once "general_includes.php";
require_once 'classes/tkt.php';
if ($postV["ext_nro"] != "") {
    $ids = explode(",", $postV["ids"]);
} else {
    echo "<b>ultima actualizacion:</b> ".date(USERDATE_READ.":s")."<br/>";
    
    switch ($postV["filter_status"]) {
        case "open":
            $filtro = "and TKT.UB is null";
            echo "Tickets abiertos generados por vos.";
            break;
        case "closed":
            $fecha_d = @STRdate_format($postV["fecha_d"], USERDATE_READ, DBDATE_WRITE);
            $fecha_h = @STRdate_format($postV["fecha_h"], USERDATE_READ, DBDATE_WRITE);
            $filtro = "and TKT.FB between '$fecha_d' and '$fecha_h'";
            echo "Tickets cerrados entre ".$postV["fecha_d"]." y ".$postV["fecha_h"]." generados por vos.";
            break;
        default:
    }

    $ssql = "
        select TKT.id from TBL_TICKETS as TKT where TKT.usr=" . $u->get_prop("id") . " $filtro
        ";

    $db = new DATOS();
    $db->loadRS($ssql);

    if (!$db->noEmpty) {
        echo NO_ITEMS;
        exit(0);
    }
    $i=0;
    $ids = array();
    while ($id = $db->get_vector()) {
        $ids[$i] = $id[0];
        $i++;
    }
}
?>
<table id="TKT_list" class="display">
    <thead>
        <tr>
            <th>IDTKT</th>
            <th>Sistema</th>
            <th>Descripcion</th>
            <th>Area</th>
            <th>Apertura</th>
            <th>Estado</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?
        foreach($ids as $tktID) {
            $t = new TKT();
            $t->load_DB($tktID);
            $TKTHI = $t->get_first_tktH();
            if (!$TKTHI)
                $TKTHI = new TKT_H();
            $status = $t->get_status();
            $TKTHF = $status[0];
             $titulo = maxLenShow($t->get_system()->get_prop("nombre"),10) . "&nbsp;<b>" . maxLenShow($t->get_critic(),10) . "</b>";
            ?>
            <tr>
                <td>
                    <?= $t->get_prop("id"); ?>
                </td>
                <td><?= $titulo; ?></td>
                <td>

                    <?
                    echo "<a href=\"javascript:alert_p('" . strToJava($TKTHI->get_prop("detalle")) . "','Detalles apertura')\">" . maxLenShow(strip_tags($TKTHI->get_prop("detalle")), 20) . "</a>";
                    ?>

                </td>
                <td><?
                if ($t->get_prop("equipo"))
                    echo $t->get_prop("equipo")->get_prop("nombre");
                    ?>
                </td>
                <td><?= $t->get_prop("FA"); ?></td>
                <td><?= $status[1]; ?>&nbsp;</td>
                <td><img src="img/b_search.png" class="img_lnk" onclick="show_details(<?= $t->get_prop("id") . ",'TKT: " . $t->get_prop("id") . " (" . strToJava($titulo) . ")'" ?>)" /></td>
            </tr>
            <?
        }
        ?>

    </tbody>
</table>

