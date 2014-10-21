<?php
require_once "general_includes.php";
require_once 'classes/tkt.php';

if (!$u->in_team($postV["team"])) {
    echo "Acceso denegado. Usted no pertenece al area seleccionada." . $postV["team"];
    exit(0);
}

$team= $u->get_team_obj($postV["team"]);
$usersInTeam = $team->get_users();

echo "<b>ultima actualizacion:</b> ".date(USERDATE_READ.":s")."<br/>";

switch ($postV["filter_status"]) {
        case "open":
            $filtro = "and TKT.UB is null";
            echo "Tickets abiertos generados por ".$team->get_prop("nombre");
            break;
        case "closed":
            $fecha_d = @STRdate_format($postV["fecha_d"], USERDATE_READ, DBDATE_WRITE);
            $fecha_h = @STRdate_format($postV["fecha_h"], USERDATE_READ, DBDATE_WRITE);
            $filtro = "and TKT.FB between '$fecha_d' and '$fecha_h'";
            echo "Tickets cerrados entre ".$postV["fecha_d"]." y ".$postV["fecha_h"]." generados por ".$team->get_prop("nombre");
            break;
        default:
}

$usrsU= array();
foreach($usersInTeam as $UT){
     array_push($usrsU, $UT->get_prop("id"));
}

// TKTS del area que son master o los que el master es de otra area (master invalido -> sera eliminado al abrir el tkt en loadmaster)
$ssql = "select TKT.id from TBL_TICKETS as TKT where UA in (".implode(",", $usrsU) .") ".$filtro;

$db = new DATOS();
$db->loadRS($ssql);

if (!$db->noEmpty) {
    echo NO_ITEMS;
    exit(0);
}
?>

<table id="TKT_list" class="display">
    <thead>
        <tr>
            <th>IDTKT</th>
            <th>Sistema</th>
            <th>Abierto por</th>
            <th>Apertura</th>
            <th>Area</th>
            <th>Estado</th>
            <th></th>
        </tr>
    </thead>
    <tbody> 

<?
while ($tktID = $db->get_vector()) {
    $t = new TKT();
    $t->load_DB($tktID[0]);
    $TKTHI = $t->get_first_tktH();
    $TKTHF = $t->get_last_tktH();
    $titulo = maxLenShow($t->get_system()->get_prop("nombre"),10) . "&nbsp;<b>" . maxLenShow($t->get_critic(),10) . "</b>";
    $status = $t->get_status();
    ?>
            <tr>
                <td>
                    <?= $t->get_prop("id"); ?>
                </td>
                <td><?= $titulo; ?></td>
                <td><?
                if ($t->get_prop("usr_o"))
                    echo $t->get_prop("usr_o")->get_prop("nombre_popup");
                ?></td>
                <td><?= $t->get_prop("FA"); ?></td>
                <td><?
                if ($t->get_prop("equipo"))
                    echo $t->get_prop("equipo")->get_prop("nombre");
                    ?></td>
                <td><?
                if ($TKTHF) {
                    if ($TKTHI && $TKTHI->get_prop("detalle"))
                        echo "<a href=\"javascript:alert_p('" . strToJava($TKTHI->get_prop("detalle")) . "','Detalles apertura')\">".  $status[1] . "</a>";
              }
                ?></td>
                <td><img src="img/b_search.png" class="img_lnk" onclick="show_details(<?= $t->get_prop("id") . ",'TKT: " . $t->get_prop("id") . " (" . strToJava($titulo) . ")'" ?>)" /></td>
            </tr>
                    <?
                }
                ?>

    </tbody>
</table>