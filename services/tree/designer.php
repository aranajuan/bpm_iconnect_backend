<?php
require_once "general_includes.php";
require_once 'classes/tree.php';

$endpoints = array();
$connections = array();
$idqs = array();
$java_objects= array();

function print_q($q) {
    global $idqs;
    global $endpoints;
    global $java_objects;
    $snd=false;
    $html = "";
    if (!in_array($q->get_prop("id"), $idqs)) { // verificar que no se haya dibujado la pregunta
        $idqs[count($idqs)] = $q->get_prop("id");
        if(count($idqs)==2)
            $snd=true;
        if($snd)
            $html='<div id="SND" class="MAINDV">';
        else
            $html='<div class="MAINDV">';
        
        $html .= '
    
        <div class="TITLEDV"> 
        <div class="element question" id="EL_Q' . $q->get_prop("id") . '">
            <p><b>' . $q->get_prop("texto") . '</b>(' . $q->get_prop("id") . ')</p>
        </div>';
        $html.='</div>';

        $html.='<div class="SUBOBJDV">';
        //sub opciones
        $opciones = $q->get_prop("opcionesobj");
        if ($opciones) {
            foreach ($opciones as $o) {
                $html.=print_o($o);
            }
        }
        $html.='</div>
        </div> 
        ';
        $endpoints[count($endpoints)] = "var EP_Q" . $q->get_prop("id") . "_L =jsPlumb.addEndpoint('EL_Q" . $q->get_prop("id") . "',EP_LeftQuestion); ";
        $endpoints[count($endpoints)] = "var EP_Q" . $q->get_prop("id") . "_R =jsPlumb.addEndpoint('EL_Q" . $q->get_prop("id") . "',EP_RightQuestion); ";
        $java_objects[count($java_objects)] = "
        designer.view.addQuestion(
        {
            ID:" . $q->get_prop("id") . ",
            texto:'" .strToJava($q->get_prop("texto")) . "',
            detalle:'" .strToJava($q->get_prop("detalle")) . "'
        })"
        ;
    }
    return $html;
}

function print_o($o) {
    global $endpoints;
    global $connections;
    global $java_objects;
    $html = "";
    if($o->get_prop("texto_critico"))
        $css="critic";
    else
        $css="";
    if ($o->get_prop("ruta_destino")){
        $endpoints[count($endpoints)] = "var EP_O" . $o->get_prop("id") . "_L =jsPlumb.addEndpoint('EL_O" . $o->get_prop("id") . "',EP_LeftOption); ";
        $dest="<u>Deriva a archivo con solucion</u>";


    }
    else
        $team="";
    if ($o->get_prop("idequipo_destino")!= NULL && $o->get_prop("idequipo_destino")!=""){
        $rules=explode(";",$o->get_prop("idequipo_destino"));
        $dest="";
        foreach($rules as $rule){
            $tm=new TEAM();
            $tmID=explode("=>",$rule);
            $tm->load_DB($tmID[1]);
            $dest.="<u>".$tmID[0]."=>".$tm->get_prop("nombre")."</u><br/>";
            $team.=$tmID[0]."=>".$tm->get_prop("nombre")."<br/>";
        }
        $endpoints[count($endpoints)] = "var EP_O" . $o->get_prop("id") . "_L =jsPlumb.addEndpoint('EL_O" . $o->get_prop("id") . "',EP_LeftOption); ";
    }
    $html = '
    <div style="clear:both;"></div>    
    <div class="MAINDV">
    
    <div class="TITLEDV"> 
        <div class="element option '.$css.'" id="EL_O' . $o->get_prop("id") . '"  >
            <p><b>' . $o->get_prop("texto"). ' -> ' . $o->get_prop("texto_critico") .'<br /><font style="color:red">'.$dest.'</font></b>(' . $o->get_prop("id") . ')</p>
        </div>';
    $html.='</div>';

    $html.='<div class="SUBOBJDV">';
    $connections[count($connections)] = "jsPlumb.connect({target:EP_O" . $o->get_prop("id") . "_L ,source:EP_Q" . $o->get_prop("idpregunta") . "_R,overlays:[ \"Arrow\"]});";
    //sub opciones

    if ($o->get_prop("idpregunta_destino")) {

        // verificar que no exista la pregunta
        $q = new QUESTION();
        $q->load_DB($o->get_prop("idpregunta_destino"));
        $html.=print_q($q);
        $endpoints[count($endpoints)] = "var EP_O" . $o->get_prop("id") . "_L =jsPlumb.addEndpoint('EL_O" . $o->get_prop("id") . "',EP_LeftOption); ";
        $endpoints[count($endpoints)] = "var EP_O" . $o->get_prop("id") . "_R =jsPlumb.addEndpoint('EL_O" . $o->get_prop("id") . "',EP_RightOption); ";
        $connections[count($connections)] = "jsPlumb.connect({source:EP_O" . $o->get_prop("id") . "_R ,target:EP_Q" . $o->get_prop("idpregunta_destino") . "_L,overlays:[ \"Arrow\"]});";
    }


    $html.='</div>
    </div>';
    $java_objects[count($java_objects)] = "
        designer.view.addOption(
        {
            ID:" . $o->get_prop("id") . ",
            idpregunta:" .strToJava($o->get_prop("idpregunta")) . ",
            texto:'" .strToJava($o->get_prop("texto")) . "',
            texto_critico:'" .strToJava($o->get_prop("texto_critico")) . "',
            ruta_destino:'" .strToJava($o->get_prop("ruta_destino")) . "',
            idequipo_destino:'" .dataDefatult($o->get_prop("idequipo_destino"),null) . "',
            pretext:'" .strToJava($o->get_prop("pretext")) . "',
            idpregunta_destino:" .dataDefatult($o->get_prop("idpregunta_destino"),'0') . ",
            autocerrar:" .dataDefatult($o->get_prop("autocerrar"),'0') . ",
            no_anexar:" .dataDefatult($o->get_prop("no_anexar"),'0') . ",
            teamName:'" .strToJava(dataDefatult($team,'')) . "'
                
        })";

    return $html;
}

$t = new TREE();
$rta = $t->load_path($postV["path"], 0);
if ($rta != "ok") {
    echo $rta;
    exit();
}
$s = $t->get_system();
if(!$s){
    echo "Sistema invalido. (Verificar la ruta)";
    exit();
}
$d = $t->get_division();
if(!$d){
    echo "Division invalida. (Verificar la ruta)";
    exit();
}
$d->load_systems();
$q = $d->get_fst_Q($s->get_prop("id"));


if ($q) {
    $html = print_q($q);
    echo "<div >DIRECCION: <b>".$d->get_prop("nombre")."</b><br /> SISTEMA: <b>".$s->get_prop("nombre")."</b></div>";
    echo $html;
}else
    echo "error no hay pregunta";
?>

<script>
    /*
    window.Arbol = {
        init : function() {
            // setup jsPlumb defaults.
            jsPlumb.importDefaults(Configs);
                        
                        
                        
        }
    }
    jsPlumb.bind("ready", function() {
        $("#ALL").css("width",'<?=count($idqs)*1000?>px');


        Arbol.init();
        
        <?
        foreach($endpoints as $ED)
            echo $ED.";";

        foreach($connections as $CN)
            echo $CN.";";
        
        foreach($java_objects as $JO)
            echo $JO.";";
        ?>
        //jsPlumb.draggable($(".element")); 
        var sizeW_SND = parseInt($("#SND").css("width"));
        var left_SND= parseInt($("#SND").position().left);
        var finalW=sizeW_SND+ left_SND + 100;
        $("#ALL").css("width",finalW+'px');

    });*/
    <?
    
     foreach($java_objects as $JO)
            echo $JO.";";
    
    ?>
</script>