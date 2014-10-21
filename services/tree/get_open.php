<?php

require_once "general_includes.php";
require_once 'classes/tree.php';

$path = $postV["path"]; // ruta de arbol solicitada + historica

$action = $postV["action"];
/*
 * 1_ si mostrar la siguiente accion + historico
 * 2_ solo mostrar el path / sin mostrar siguiente accion
 * 
 */

$resultHTML="";

$t = new TREE();
$rta = $t->load_path($path, 1);
if ($rta != "ok") {
    $resultHTML.= $rta;
    echo $resultHTML;
    exit(0);
}


$optsH = $t->get_tree_history();
// historico de respuestas
if ($optsH === NULL) {
    $resultHTML.= filter_bar(
            "<img src=\"" . HIMG_DIR . "/icon.png \" width=\"15\" height=\"15\" /> 
            CREAR NUEVA GESTION 
            <br/><div style='padding-left:40px;padding-top:6px;'>
            Siga los pasos a continuaci&oacute;n seleccionando las opciones para generar su gesti&oacute;n.
            </div>", "width:80%;");
} else {
     $histHTML="";
     foreach ($optsH as $o) {
       $histHTML.="<div class=\"history\"><b>" . $o["title"] . ":</b>&nbsp;" . $o["option"] . "</div>";
    }
    $resultHTML.= filter_bar(
            "<img src=\"" . HIMG_DIR . "/icon.png \" width=\"15\" height=\"15\" /> 
            RESPUESTAS PREVIAS 
            <br/><div style='padding-left:40px;padding-top:6px;'>
            $histHTML
            </div>", "width:80%;");
}
$resultHTML.= "<br/>";

$opts = $t->get_tree_options();

if (isset($opts["error"])) { // error al resolver destino
    $resultHTML.= $opts["error"];
    echo $resultHTML;
    exit(0);
}

if (isset($opts["object"])) { // fin de arbol
    $o = $opts["object"];
    if ($o->get_prop("ruta_destino")) {
        $resultHTML.= "<br />" . option_button("Abrir ticket", 450, 0, "open_tkt('" . $opts["actual"] . "');") . "<br/>";
        if ($opts["back"]!="none") {
            $resultHTML.= option_button("VOLVER", 450, 1, "load_tree('" . $opts["back"] . "');") . "</br>";
        }
        echo $resultHTML;
        exit(0);
    }
    if ($o->get_prop("idequipo_destino")) {
        if($o->equipo_destino($GLOBALS[UL])==null){
            echo "Error en arbol para el usuario.";
            exit(0);
        }
        $resultHTML.= "
        <br />
        <p style='font-size:20px;'><img src=\"" . HIMG_DIR . "/icon.png \" width=\"20\" height=\"20\" /> COMPLETE EL FORMULARIO</p>
        <div id=\"detalle_tkt\" >
        " . $o->get_prop("pretext") . "</div>  
        <br /><br />
        " . option_button("Abrir ticket", 450, 0, "go('" . $opts["actual"] . "');") . "</br>";
        if ($opts["back"]!="none") {
            $resultHTML.= option_button("VOLVER", 450, 1, "load_tree('" . $opts["back"] . "');") . "</br>";
        }
        echo $resultHTML;
        exit(0);
    }
    $resultHTML.= "Error desconocido. No se cargaron los destinos.";
    echo $resultHTML;
    exit(0);
}

if (!isset($opts["options"])) { // no hay opciones
    $resultHTML.= "Error desconocido. No se cargaron opciones de arbol.";
    echo $resultHTML;
    exit(0);
}

// dibujar opciones
$resultHTML.= "<p style='font-size:20px;'><img src=\"" . HIMG_DIR . "/icon.png \" width=\"20\" height=\"20\" /> &nbsp;" . strtoupper($opts["title"]) . "</p><br />";

foreach ($opts["options"] as $o) {
    $resultHTML.= option_button($o["title"], 450, 0, "load_tree('" . $o["destiny"] . "');") . "</br>";
}

if ($opts["back"]!="none") {
    $resultHTML.= option_button("VOLVER", 450, 1, "load_tree('" . $opts["back"] . "');") . "</br>";
}

echo $resultHTML;