<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $idtkt = $RC->get_params("id");

    $TKT = $RC->get_objcache()->get_object("TKT", $idtkt);
    if ($RC->get_objcache()->get_status("TKT", $idtkt) != "ok") {
        return $RC->createElement("error", "Ticket invalido.#1");
    }
    $response = new DOMDocument();
    $responseData = $response->createElement("data");
    
    $responseData->appendChild($response->createElement("idmaster",$TKT->get_prop("idmaster")));
    
    $opts = $TKT->get_tree_history();
    $tree = $response->createElement("tree");
    foreach ($opts as $o) {
        $option = $response->createElement("option");
        $option->appendChild($response->createElement("question", $o["question"]));
        $option->appendChild($response->createElement("ans", $o["ans"]));
        $tree->appendChild($option);
    }
    $responseData->appendChild($tree);

    $moves = $response->createElement("ths");
    $THALL = $TKT->get_tktHObj();
    $cvalid = 0;
    foreach ($THALL as $TH) {
        $el = $TH->getXML_H();
        if ($el) {
            $th = $response->importNode($el, true);
            $moves->appendChild($th);
            $cvalid++;
        }
    }
    if ($cvalid == 0) {
        return $RC->createElement("error", "Ticket invalido.#2");
    }

    $responseData->appendChild($moves);

    $response->appendChild($response->createElement("master", $TKT->get_prop("idmaster")));
    $actions = $response->createElement("actions");
    $AL = $TKT->valid_actions();
    foreach ($AL as $A) {
        $action = $response->createElement("action");
        $action->appendChild($response->createElement("alias", $A->get_prop("alias")));
        $action->appendChild($response->createElement("nombre", $A->get_prop("nombre")));
        $action->appendChild($response->createElement("formulario", $A->get_prop("formulario")));
        $actions->appendChild($action);
    }
    $responseData->appendChild($actions);
    
    return $RC->append_xml($responseData);
}
