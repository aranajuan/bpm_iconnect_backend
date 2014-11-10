<?php

require_once 'classes/tkt.php';

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


/*
        $treeL = $RC->createElement("error", print_r($opts, true));
        return $treeL;
*/

        if ($topts["error"]) {
            $treeL = $RC->createElement("error", $topts["error"]);
            return $treeL;
        }

        if ($topts["object"]) {
            $treeL = $RC->createElement("error", "FORMULARIO");
            return $treeL;
        }

        /* Pregunta */
        $question = $RC->createElement("question");
        $question->appendChild($RC->createElement("title", $topts["title"]));
        $question->appendChild($RC->createElement("detail", $topts["detail"]));
        $question->appendChild($RC->createElement("back", $topts["back"]));

        /* Opciones */
        $options = $RC->createElement("options");
        foreach ($topts["options"] as $o) {
            $option = $options->appendChild($RC->createElement("OPTION"));
            $option->appendChild($RC->createElement("title", $o["title"]));
            $option->appendChild($RC->createElement("destiny", $o["destiny"]));
            $option->appendChild($RC->createElement("end", $o["end"]));
            $options->appendChild($option);
        }

        /* Une todo */
        $treeL->appendChild($previous);
        $treeL->appendChild($question);
        $treeL->appendChild($options);
    } else {
        $treeL = $RC->createElement("error", $rta);
    }
    return $treeL;
}
