<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $idtkt = $RC->get_params("id");

    $TKT = new TKT();
    if ($TKT->load_DB($idtkt) != "ok") {
        return $RC->createElement("error", "Ticket invalido.");
    }
    $response = new SimpleXMLElement("<data></data>");
    $opts = $TKT->get_tree_history();
    $tree = $response->addChild("tree");
    foreach ($opts as $o) {
        $option = $tree->addChild("option");
        $option->addChild("question", $o["question"]);
        $option->addChild("ans", $o["ans"]);
    }
    $moves = $response->addChild("ths");
    $THALL = $TKT->get_tktHObj();
    foreach ($THALL as $TH) {
        $th = $moves->addChild("th");
        $el = $TH->getXML_H();
        if ($el) {
            append_simplexml($th, $el);
        }
    }
    $actions = $response->addChild("actions");
    $AL = $TKT->valid_actions();
    foreach($AL as $A){
        $action = $actions->addChild("action");
        $action->addChild("alias",$A->get_prop("alias"));
        $action->addChild("nombre",$A->get_prop("nombre"));
        $action->addChild("formulario",$A->get_prop("formulario"));
    }
    $conv = new DOMDocument();
    $conv->loadXML($response->asXML());
    $nodes =$conv->getElementsByTagName("data");
    $ret = $RC->append_xml($nodes->item(0));

    return $ret;
}