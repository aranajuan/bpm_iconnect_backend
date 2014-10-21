<?php
require_once   "general_includes.php";
require_once   'classes/tree.php';

$path = $postV["path"];

$t= new TREE();
$t->load_path($path,1);

if($t->get_last()->get_prop("no_anexar")==1){
    echo "none";
    exit(0);
}

$tkts=$t->get_similar();
if($tkts==NULL){
    echo "none";
    exit(0);
}
$array_T=array();
$i=0;
foreach($tkts as $t){
    $tcc=$t->get_count_childs();
    $array_T[0][$i] =$tcc;
    $array_T[1][$i] =$t;
    $i++;
}
array_multisort($array_T[0],$array_T[1]);

$backgrounds=array("postit_1.png","postit_2.png","postit_3.png");
$sizes = array("width:197px;height:253px;","width:197px;height:253px;;","width:197px;height:253px;");
$extracss = array("padding:2px;","padding:2px;","padding:2px;");
?>
<b>Seleccione un tkt similar y presione "Abrir TKT"</b><br/>
<?
$i--;
for(;$i>=0;$i--){
    $t=$array_T[1][$i]; //master tkt
    $tcc=$array_T[0][$i]; // cantidad de hijos
if($tcc<=2){    
    $img=$backgrounds[$tcc];
    $size=$sizes[$tcc];
    $css=$extracss[$tcc];
    
    }
else{
    $img=$backgrounds[2];
    $size=$sizes[2];
    $css=$extracss[2];
}
    
?>
<div style="border: 1px #444444 solid; background-color: powderblue;background-repeat: no-repeat;<?=$size.$css;?>;cursor:pointer;float:left;margin: 5px;overflow:hidden;" onclick='$("input[value=<?=$t->get_prop("id")?>]").attr("checked", true);'>
    <div>
        <div style="float:left;">
            <img src="<?=HIMG_DIR."/".$img;?>" width="50" height="50" />
        </div>
        <div style="float:left;padding-left: 5px; padding-top: 8px;">
            ID:<?=$t->get_prop("id")?><br/> <b> (<?=$tcc?> adjuntos)
            </b><input name="Sel_similar" id="Sel_similar" type="radio" value="<?=$t->get_prop("id")?>"  />
        </div>
    </div>
    <div style="overflow: auto;height: 200px;width:195px;">
        <?
            $TH=$t->get_first_tktH();
            if($TH && $TH->get_prop("detalle"))
                echo $TH->get_prop("detalle");
            else
                echo "Sin comentarios";
        ?>
   </div>
</div>    
<?
}
?>
<div style="width:625px;float:none;clear: both;border:1px solid;background-color:white;font-weight: bold; padding: 3px; margin: 4px;cursor:pointer; " onclick='$("input[value=NULL]").attr("checked", true);'>
    NINGUNO <input name="Sel_similar" id="Sel_similar" type="radio" value="NULL"  />
</div>


<div id="Sel_similar_MSG" style="width: 100%;color:red;height: 10px;"></div>
<br />
<input type="button" class="button" id="BT_openTKT" value="Abrir TKT" />