<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $TKT = new TKT();
    $TKT->load_VEC(array("origen" => $RC->get_params("path")));

    $topts = $TKT->get_tree_options();
    
    if (!$topts["object"] || $topts["object"]->get_prop("no_anexar")==1) {
        return $RC->createElement("error", "Accion no valida para esta opcion.");
    }
    
    $ALL_v = $TKT->get_similar();
    if ($ALL_v == null || count($ALL_v) == 0) {
        return null;
    }

    $listL = new SimpleXMLElement("<list></list>");


    foreach ($ALL_v as $l) {
        $tkt = $listL->addChild("tkt");
        $tkt->addChild("id", $l->get_prop('id'));
        $tkt->addChild("FA", $l->get_prop('FA'));
        $tkt->addChild("UA", $l->get_prop('UA'));
        $tkt->addChild("origen", $l->get_prop('origen'));
        $fstTH = $l->get_first_tktH();
        if ($fstTH) {
            $openxml = $fstTH->getXML_H();
            if ($openxml) {
                append_simplexml($tkt, $openxml);
            }
        }
        $listL->addChild($tkt);
    }

    $conv = new DOMDocument();
    if ($conv->loadXML($listL->asXML()) == false) {
        return $RC->createElement("error", "Error al parsear xml.");
    }
    $nodes = $conv->getElementsByTagName("list");
    $ret = $RC->append_xml($nodes->item(0));

    return $ret;
}
