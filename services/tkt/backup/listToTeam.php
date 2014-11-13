<?php
require_once "general_includes.php";
start_measure("LISTA:TKTS");
require_once 'classes/tkt.php';
$response="";
if (!$u->in_team($postV["team"])) {
    echo "Acceso denegado. Usted no pertenece al area seleccionada." . $postV["team"];
    exit(0);
}

$teamName= $u->get_team_obj($postV["team"])->get_prop("nombre");

$response.="<b>ultima actualizacion:</b> ".date(USERDATE_READ.":s")."<br/>";
$RC="";
switch ($postV["filter"]) {

    case "all":
        $filtro = "and TKT.UB is null";
        $response.= "Todos del equipo ".$teamName;
        break;
    case "my":
        $filtro = "and TKT.UB is null and TKT.u_tom=" . $u->get_prop("id");
        $response.= "Mios en el equipo ".$teamName;
        break;
    case "myNtom":
        $filtro = "and TKT.UB is null and (TKT.u_tom=" . $u->get_prop("id")." or TKT.u_tom is null)";
        $response.= "Mios y sin tomar en el equipo ".$teamName;
        break;
    case "free":
        $filtro = "and TKT.UB is null and TKT.u_tom is null";
        $response.= "Sin tomar del equipo ".$teamName;
        break;
    case "taken":
        $filtro = "and TKT.UB is null and TKT.u_tom is not null";
        $response.= "Tomados del equipo".$teamName;
        break;
    case "closed":
        $fecha_d = @STRdate_format($postV["fecha_d"], USERDATE_READ, DBDATE_WRITE);
        $fecha_h = @STRdate_format($postV["fecha_h"], USERDATE_READ, DBDATE_WRITE);
        $filtro = "and TKT.FB between '$fecha_d' and '$fecha_h'";
        $response.= "Cerrados entre ".$postV["fecha_d"]." y ".$postV["fecha_h"]." por el equipo ".$teamName;
        break;
    case "recent":
        $RC="RC";
        $dias = $postV["days"];
        $desde = date(DBDATE_WRITE, strtotime ( '-'.$dias.' day')); 
        $filtro = "and TKT.FB > '$desde' and TKT.u_tom=".$u->get_prop("id");
        $response= "";
        break;
    case "ext_tkt":
        // filtra tkts con el parametro solicitado y carga mytkts
        $ssql = "select distinct(TH.idtkt)
                from TBL_TICKETS_M as TH
                inner join TBL_ACCIONES as ACC on (TH.idaccion=ACC.id)
               where ACC.nombre='" . strtoupper($postV["ext_tipo"]) . "' and TH.valoraccion=" . $postV["ext_nro"] . "
               ";
        $response.= "Relacionados al tkt ".$postV["ext_tipo"]." ".$postV["ext_nro"];
        $db = new DATOS();
        $db->loadRS($ssql);
        $i = 0;
        if (!$db->noEmpty) {
            $response.= NO_ITEMS;
            echo $response;
            exit(0);
        }
        $ids = array();
        while ($id = $db->get_vector()) {
            $ids[$i] = $id[0];
            $i++;
        }
        $postV["ids"] = implode(",", $ids);
        //variables post para my
        echo $response;
        include("TKT_listMy.php");
        exit();
        break;
    default:
}

// TKTS del area que son master o los que el master es de otra area (master invalido -> sera eliminado al abrir el tkt en loadmaster)
$ssql = "
select TKT.id from TBL_TICKETS as TKT left join TBL_TICKETS as TM on (TKT.idmaster=TM.id) where (TKT.idmaster is null OR TM.idequipo<>" . $postV["team"] . ") and TKT.idequipo=" . $postV["team"] . " $filtro
";

$db = new DATOS();
$db->loadRS($ssql);

if (!$db->noEmpty) {
    $response.= NO_ITEMS;
    echo $response;
    exit(0);
}
$response.='
<table id="TKT_list'.$RC.'" class="display">
    <thead>
        <tr>
            <th>IDTKT</th>
            <th>Sistema</th>
            <th>Abierto por</th>
            <th>Tomado por</th>
            <th>Prioridad</th>
            <th>Apertura</th>
            <th>Ultimo movimiento</th>
            <th></th>
        </tr>
    </thead>
    <tbody> 
';
while ($tktID = $db->get_vector()) {
    $t = new TKT();
    $t->load_DB($tktID[0]);
    $TKTHI = $t->get_first_tktH();
    $TKTHF = $t->get_last_tktH();
    $titulo = maxLenShow($t->get_system()->get_prop("nombre"),10) . "&nbsp;<b>" . maxLenShow($t->get_critic(),10) . "</b>";
    $response.='
            <tr>
                <td>
    '.$t->get_prop("id");

    $tcc = $t->get_count_childs();
    if ($tcc)
        $response.= "<a href=\"javascript:show_childs(" . $t->get_prop("id") . ")\">(+" . $tcc . ")</a>";
    $response.= '
                </td>
                <td>'.$titulo.'</td>
                <td>';
                if ($t->get_prop("usr_o"))
                    $response.= $t->get_prop("usr_o")->get_prop("nombre_popup");
                $response.='</td>
                <td>';
                if ($t->get_prop("u_tom_o"))
                    $response.= $t->get_prop("u_tom_o")->get_prop("nombre_popup");
    $response.='</td>
                <td>';
                $prioridad = $t->get_priority_textcolor();
                $response.= "<b style='color:" . $prioridad[1] . ";'>" . $prioridad[0] . "</b>";
                $response.='</td>
                <td>'.$t->get_prop("FA").'</td>
                <td>';
                if ($TKTHF) {
                    if ($TKTHI && $TKTHI->get_prop("detalle"))
                        $response.= "<a href=\"javascript:alert_p('" . strToJava($TKTHI->get_prop("detalle")) . "','Detalles apertura')\">".  maxLenShow ("(" . $TKTHF->get_prop("accion")->get_prop("nombre") . ")" .$TKTHF->get_prop("FA"),18) . "</a>";
                    else
                        $response.=  maxLenShow (" (" . $TKTHF->get_prop("accion")->get_prop("nombre") . ")".$TKTHF->get_prop("FA"),18);
                     }
                $response.='</td>
                        <td><img src="img/b_search.png" class="img_lnk" onclick="show_details('.$t->get_prop("id") .',\'TKT: ' . $t->get_prop("id") . ' (' . strToJava($titulo) . ')\')" /></td>
                    </tr>';

                }
                $response.='
                        </tbody>
                    </table>
                ';

stop_measure("LISTA:TKTS");
show_measure("LISTA:TKTS");
echo $response;
?>