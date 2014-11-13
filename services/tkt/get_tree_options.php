<?php

require_once 'classes/tkt.php';
require_once 'classes/itform.php';

/**
 * Opciones del arbol a mostrar
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $TKT = new TKT($RC->get_Connection());
    $rta = $TKT->load_VEC(array("origen" => $RC->get_params("path")));

    if ($rta == "ok") {
        // armar respuesta arbol
        $treeL = $RC->createElement("tree");
        /* Respuestas previas */
        $previous = $RC->createElement("previous");

        $topts = $TKT->get_tree_options(); //primero cargar las opciones por si realiza movimiento
        $opts = $TKT->get_tree_history();

        if ($opts) {
            foreach ($opts as $o) {
                $option = $previous->appendChild($RC->createElement("OPTION"));
                $option->appendChild($RC->createElement("question", $o["question"]));
                $option->appendChild($RC->createElement("ans", $o["ans"]));
                $previous->appendChild($option);
            }
        }
        $previous->appendChild($RC->createElement("back", $topts["back"]));
        $previous->appendChild($RC->createElement("actual", $RC->get_params("path")));
        $treeL->appendChild($previous);

        /*
          $treeL = $RC->createElement("error", print_r($opts, true));
          return $treeL;
         */

        if ($topts["error"]) {
            $treeL = $RC->createElement("error", $topts["error"]);
            return $treeL;
        }

        if ($topts["object"]) {
            if ($topts["object"]->get_prop("idequipo_destino") && $topts["object"]->get_prop("ruta_destino") == NULL) {
                $X = $topts["object"]->get_prop("pretext");
                $dom = new DOMDocument();
                $dom->loadXML($X);
                $joined = $RC->append_xml($dom->documentElement);
                if ($joined) {
                    $opendata = $RC->createElement("opendata");
                    $opendata->appendChild($joined);
                    $treeL->appendChild($opendata);
                    return $treeL;
                } else {
                    return $RC->createElement("error", "imposible unir");
                }
            } else {
                $opendata = $RC->createElement("opendata");
                $opendata->appendChild($RC->createElement("msj", "No se necesitan datos adicionales. Puedes generar el itracker."));
                $treeL->appendChild($opendata);
                return $treeL;
            }
        } else {

            /* Pregunta */
            $question = $RC->createElement("question");
            $question->appendChild($RC->createElement("title", $topts["title"]));
            $question->appendChild($RC->createElement("detail", $topts["detail"]));

            /* Opciones */
            $options = $RC->createElement("options");
            foreach ($topts["options"] as $o) {
                $option = $options->appendChild($RC->createElement("OPTION"));
                $option->appendChild($RC->createElement("title", $o["title"]));
                $option->appendChild($RC->createElement("destiny", $o["destiny"]));
                $option->appendChild($RC->createElement("end", $o["end"]));
                $options->appendChild($option);
                $treeL->appendChild($question);
                $treeL->appendChild($options);
            }
        }
    } else {
        $treeL = $RC->createElement("error", $rta);
    }
    return $treeL;
}