<?php
require_once "general_includes.php";
require_once 'classes/tkt.php';

$dias = 5;

$desde = date(DBDATE_WRITE, strtotime ( '-'.$dias.' day')); 


$ssql = "
    select TKT.id from TBL_TICKETS as TKT where TKT.usr=" . $u->get_prop("id") . " and TKT.UB is not null and TKT.FB > '$desde' order by TKT.FB DESC 
    ";

$db = new DATOS();
$db->loadRS($ssql);
if (!$db->noEmpty) {
    echo NO_ITEMS."(Solucionados en los ultimos $dias dias)";
    exit(0);
}
$i=0;
$ids = array();
while ($id = $db->get_vector()) {
    $ids[$i] = $id[0];
    $i++;
}

?>
<table id="TKT_listClosed" class="display">
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
            $titulo = $t->get_system()->get_prop("nombre") . "&nbsp;<b>" . $t->get_critic() . "</b>";
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
                    ?></td>
                <td><?= $t->get_prop("FA"); ?></td>
                <td><?= $status[1]; ?>&nbsp;</td>
                <td><img src="img/b_search.png" class="img_lnk" onclick="show_details(<?= $t->get_prop("id") . ",'TKT: " . $t->get_prop("id") . " (" . strToJava($titulo) . ")'" ?>)" /></td>
            </tr>
            <?
        }
        ?>

    </tbody>
</table>

