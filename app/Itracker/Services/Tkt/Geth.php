<?php

namespace Itracker\Services\Tkt;

class Geth implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $idtkt = $Context->get_params("id");

        $TKT = $Context->get_objcache()->get_object("Tkt", $idtkt);
        if ($Context->get_objcache()->get_status("Tkt", $idtkt) != "ok") {
            return $Context->createElement("error", "Ticket invalido.#1");
        }
        $response = new \DOMDocument();
        $responseData = $response->createElement("data");

        $responseData->appendChild($response->createElement("idmaster", $TKT->get_prop("idmaster")));
        $responseData->appendChild($response->createElement("largestatus", $TKT->get_LargeStatus()));

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
            return $Context->createElement("error", "Ticket invalido.#2");
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

        return $Context->append_xml($responseData);
    }

}
