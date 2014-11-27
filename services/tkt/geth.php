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
    $cvalid=0;
    foreach ($THALL as $TH) {
        $el = $TH->getXML_H();
        if ($el) {
            $th = $moves->addChild("th");
            append_simplexml($th, $el);
            $cvalid++;
        }
    }
    if ($cvalid== 0) {
        return $RC->createElement("error", "Ticket invalido.");
    }
    $response->addChild("master", $TKT->get_prop("idmaster"));
    $actions = $response->addChild("actions");
    $AL = $TKT->valid_actions();
    foreach ($AL as $A) {
        $action = $actions->addChild("action");
        $action->addChild("alias", $A->get_prop("alias"));
        $action->addChild("nombre", $A->get_prop("nombre"));
        $action->addChild("formulario", $A->get_prop("formulario"));
    }
    $conv = new DOMDocument();
    if($conv->loadXML($response->asXML())==false){
        return $RC->createElement("error", "Error al parsear xml.");
    }
    $nodes = $conv->getElementsByTagName("data");
    $ret = $RC->append_xml($nodes->item(0));

    return $ret;
}
