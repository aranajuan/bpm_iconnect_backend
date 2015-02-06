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
    if ($taken) {
        $filter = array_merge($filter, array("taken" => $taken));
    }

    $ALL = new TKT();

    $ALL_v = $ALL->list_fiter(array_merge($filter, array("master" => "null")));


    $listL = new DOMDocument();
    $list = $listL->createElement("list");

    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $tkt = $listL->createElement("tkt");
            $tkt->appendChild($listL->createElement("id", $l->get_prop('id')));
            $tkt->appendChild($listL->createElement("FA", $l->get_prop('FA')));
            $tkt->appendChild($listL->createElement("UA", $l->get_prop('UA')));
            $tkt->appendChild($listL->createElement("origen", $l->get_prop('origen')));
            $fstTH = $l->get_first_tktH();
            if ($fstTH) {
                $openxml = $fstTH->getXML_H();
                if ($openxml) {
                    $nod=$listL->importNode($openxml,true);
                    $tkt->appendChild($nod);
                }
            }
            $list->appendChild($tkt);
        }

        $ret = $RC->append_xml($list);

        return $ret;
    }
    return null;
}
