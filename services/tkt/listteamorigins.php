<?php

require_once 'classes/tkt.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $idteam = $RC->get_params("team");
    if (!$u->in_team($idteam)) {
        return $RC->createElement("error", "Equipo invalido. Acceso denegado.");
    }

    $filter = array(
        "open" => "open",
        "opento" => $idteam,
        "origin" => $RC->get_params("origin")
    );
    
    $taken = $RC->get_params("taken");
    if($taken){
        $filter= array_merge($filter,array("taken"=>$taken));
    }
    
    $ALL = new TKT();

    $ALL_v = $ALL->list_fiter(array_merge($filter, array("master" => "null")));


    $listL = new SimpleXMLElement("<list></list>");

    if ($ALL_v) {
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
    return null;
}
