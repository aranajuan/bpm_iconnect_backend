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

    $actions = $RC->get_params("actions");

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
            $tkths = $listL->createElement("ths");
            $ths = $l->get_tktHObj($actions);
            $c = 0;
            if ($ths && count($ths)) {
                foreach ($ths as $th) {
                    $xmldetail = $th->getXML_H();
                    if ($xmldetail) {
                        $nod = $listL->importNode($xmldetail, true);
                        $tkths->appendChild($nod);
                        $c++;
                    }
                }
            }
            if ($c) {
                $tkt->appendChild($tkths);
                $list->appendChild($tkt);
            }
        }

        $ret = $RC->append_xml($list);

        return $ret;
    }
    return null;
}
