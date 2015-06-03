<?php
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $arrayTeam=array();
    $idsteams = explode(",", $RC->get_params("team"));
    foreach ($idsteams as $idteam) {
        if (!$u->in_team($idteam)) {
            return $RC->createElement("error", "Equipo invalido($idteam). Acceso denegado.");
        }
        array_push($arrayTeam, $idteam);
    }
    $actions = $RC->get_params("actions");

    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$IS_OPEN, "true");
    $Tf->set_filter(Itracker\TktFilter::$IDSTEAMS, $arrayTeam);
    $Tf->set_filter(Itracker\TktFilter::$ORIGINS, explode(',',$RC->get_params("origin")));

    $taken = $RC->get_params("taken");
    if ($taken) {
        $Tf->set_filter(Itracker\TktFilter::$TAKENBY, explode(",", $taken));
    }

    $Tl = new Itracker\TktLister();
    $Tl->loadFilter($Tf);
    
    if(!$Tl->execute()){
        return $RC->createElement("error", "Error al cargar listado. ".$Tf->getError());
    }
    
    $ALL_v = $Tl->getObjs();

    $listL = new \DOMDocument();
    $list = $listL->createElement("list");

    if ($ALL_v) {
        foreach ($ALL_v as $l) {
            $tkt = $listL->createElement("tkt");
            $tkt->appendChild($listL->createElement("id", $l->get_prop('id')));
            $tkt->appendChild($listL->createElement("FA", $l->get_prop('FA')));
            $tkt->appendChild($listL->createElement("UA", $l->get_prop('UA')));
            $tkt->appendChild($listL->createElement("idmaster", $l->get_prop('idmaster')));
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
