<?php

require_once "general_includes.php";
require_once 'classes/tkt.php';
require_once 'classes/notify.php';

$TKT = new TKT();
if ($postV["accion"] != "ABRIR") {
    if (!is_numeric($postV["id"])) {
        $result["ejecute"] = "error";
        $result["ejecute_detail"] = "Imposible cargar ticket. Id invalido";
        $result["ejecute_extra"] = "";
        echo json_encode($result);
        exit(0);
    }

    if ($TKT->load_DB($postV["id"]) != "ok") {
        $result["ejecute"] = "error";
        $result["ejecute_detail"] = "Imposible cargar ticket.";
        $result["ejecute_extra"] = "";
        echo json_encode($result);
        exit(0);
    }
}

function get_value_from_name($array, $name) {
    foreach ($array as $e) {
        if ($e["name"] == $name)
            return $e["value"];
    }
    return NULL;
}

//cargar notificacion
$notify = new NOTIFY();
$notify->load_TKTEXT($TKT);

$rta = $TKT->ejecute_action($postV["accion"], $postV);

//evaluar respuesta
if (is_array($rta)) {
    $resul_go = $rta[0];
    $a = $rta[1];
} else {
    $resul_go = $rta;
}

$result_GO_R = array();
if (is_array($resul_go)) {
    $result_GO_R["ejecute"] = $resul_go[0];
    $result_GO_R["ejecute_detail"] = $resul_go[1];
    $result_GO_R["ejecute_extra"] = $resul_go[2];
} else {
    if ($resul_go == "ok") {
        $result_GO_R["ejecute"] = "ok";
        $result_GO_R["ejecute_detail"] = "";
        $result_GO_R["ejecute_extra"] = "";
    } else {
        $result_GO_R["ejecute"] = "error";
        $result_GO_R["ejecute_detail"] = $resul_go;
        $result_GO_R["ejecute_extra"] = "";
    }
}

//si se ejecuta exitosamente intenta notificar a los usuarios
if ($result_GO_R["ejecute"] == "ok") {

    $notify->load_actionOBJ($a);
    //enviar mail y verificar que este ok
    $notify->load_TKTNEW($TKT);

    $result_n = $notify->send();


    //verifica el exito del envio, sino avisa que no se pudo enviar
    if ($result_n != "ok") {
        $result_GO_R["notify"] = "error";
        $result_GO_R["notify_detail"] = $result_n;
    } else {
        $result_GO_R["notify"] = "ok";
        $result_GO_R["notify_detail"] = "";
    }
}

echo json_encode($result_GO_R);
?>
