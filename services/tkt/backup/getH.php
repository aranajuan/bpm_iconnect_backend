<?php
require_once "general_includes.php";
require_once 'classes/tkt.php';

$idTKT=$postV["id"];
$TKT= new TKT();
$rta=$TKT->load_DB($idTKT);
if($rta!="ok"){
    echo $rta;
    exit(0);
}

?>
 
<script>

var tktJ = new class_tktJ(<?=$TKT->get_prop("id").",".dataDefatult($TKT->get_prop("idmaster"),0).",".dataDefatult($TKT->get_prop("idequipo"),0);?>);

</script>
    
<?

$hist = $TKT->get_tktH();
if($hist==""){
    echo "Sin acceso.";
    exit(0);
}
if($TKT->get_prop("idmaster")){
    ?>
<br/>
<div style="width: 50%; border:2px solid; background-color: #ccffcc; padding: 4px;cursor: pointer;" onclick="show_details(<?= $TKT->get_prop("idmaster")?>,'MASTER TKT:<?=$TKT->get_prop("idmaster");?>')" >Este ticket esta adjunto a otro que puede tener actualizaciones &nbsp;<img src="img/b_search.png" class="img_lnk"  /></div>
    <?
}
echo $hist;
echo "<hr />";
foreach($TKT->valid_actions() as $VA){
    if($VA->get_prop("formulario"))
        $funcJava="get_form(\"".$VA->get_prop("nombre")."\")";
    else
        $funcJava="GO_post(\"".$VA->get_prop("nombre")."\",false)";
    if($VA->get_prop("formulario")==0 ||($VA->get_prop("formulario")==1 && file_exists("../actions/get_".$VA->get_prop("nombre").".php")))
        echo "<input type='button' id='B_ACCION_".$VA->get_prop("nombre")."' class='button' value='".str_replace("_"," ",$VA->get_prop("nombre"))."' onclick='$funcJava' />";
    
}
?>