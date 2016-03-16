<?php

namespace Itracker\Services\Tkt;

class Getsimilars implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {

        $TKT = new \Itracker\Tkt();
        $TKT->load_VEC(array("origen" => $Context->get_params("path")));

        if (!$TKT->is_active()) {
            $response["result"] = "error";
            $response["msj"] = "Error en tipificacion.";
            return $response;
        }

        $topts = $TKT->get_last();


        if (!$topts->get_prop('unir')) {
            return $Context->createElement("error", "Accion no valida para esta opcion. #2");
        }

        $ALL_v = $TKT->get_similar();

        if ($ALL_v == null || count($ALL_v) == 0) {
            return null;
        }

        $listL = new \DOMDocument();
        $list = $listL->createElement("list");

        $cc = 0;

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
                        $nod = $listL->importNode($openxml, true);
                        $tkt->appendChild($nod);
                        $list->appendChild($tkt);
                        $cc++;
                    }
                }
            }
            if ($cc == 0) {
                return null;
            }
            $ret = $Context->append_xml($list);

            return $ret;
        }
        return null;
    }

}