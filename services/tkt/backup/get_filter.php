<?php

require_once "general_includes.php";
require_once 'classes/tree.php';

$path = $postV["path"]; // ruta de arbol solicitada + historica
$idObj = $postV["obj"]; // div a recargar
$chosen = $postV["chosen"];

$resultHTML="";
$resultHTML.=  "<a class='lnk_blue' onclick=\"load_tree('','$idObj')\">INICIO</a></br>";
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
    $resultHTML.= "Seleccione la ruta para el filtro";
} else {
     $histHTML="";
     foreach ($optsH as $o) {
       $histHTML.="<div class=\"history\"><b>" . $o["title"] . ":</b>&nbsp;" . $o["option"] . "</div>";
    }
    $resultHTML.=$histHTML;
}
$resultHTML.= "<br/>";

$opts = $t->get_tree_options();

if (isset($opts["error"])) { // error al resolver destino
    $resultHTML.= $opts["error"];
    echo $resultHTML;
    exit(0);
}
if (isset($opts["object"])) { // fin de arbol
        if ($opts["back"]!="none") {
            $resultHTML.= "<a class='lnk_blue' onclick=\"load_tree('".$opts["back"]."','$idObj')\">Volver</a></br>";
        }
        echo $resultHTML;
        exit(0);
}

if (!isset($opts["options"])) { // no hay opciones
    $resultHTML.= "Error desconocido. No se cargaron opciones de arbol.";
    echo $resultHTML;
    exit(0);
}

// dibujar opciones
$resultHTML.= strtoupper($opts["title"]) . "<br />";

foreach ($opts["options"] as $o) {
    $histHTMLO=$histHTML."<div class=\"history\"><b>" . $opts["title"] . ":</b>&nbsp;" . $o["title"] . "</div>";;
    $resultHTML.= "<a class='lnk_blue' onclick=\"load_tree('".$o["destiny"]."','$idObj')\">".$o["title"] . ".</a>";
    $resultHTML.= "<a class='lnk_blue' onclick=\"select_path('".strToJava($o["destiny"])."','".strToJava($histHTMLO)."')\"><b>&nbsp;&nbsp;Agregar</b></a><br/>";
}

if ($opts["back"]!="none") {
    $resultHTML.=  "<a class='lnk_blue' onclick=\"load_tree('".$opts["back"]."','$idObj')\">Volver</a></br>";
}

echo $resultHTML;