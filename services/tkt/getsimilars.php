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

    $listL = new DOMDocument();
    $list = $listL->createElement("list");

    $cc=0;
    
    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $tkt = $listL->createElement("tkt");
            $tkt->appendChild($listL->createElement("id", $l->get_prop('id')));
            $tkt->appendChild($listL->createElement("FA", $l->get_prop('FA')));
            $tkt->appendChild($listL->createElement("origen", $l->get_prop('origen')));
            $tkt->appendChild($listL->createElement("childsc", $l->get_count_childs()));
            $fstTH = $l->get_first_tktH();
            if ($fstTH) {
                $openxml = $fstTH->getXML_H();
                if ($openxml) {
                    $nod=$listL->importNode($openxml,true);
                    $tkt->appendChild($nod);
                     $list->appendChild($tkt);
                     $cc++;
                }
            }
        }
        if($cc==0){
            return null;
        }
        $ret = $RC->append_xml($list);

        return $ret;
    }
    return null;
}
