<?php

/**
 * Opciones del arbol a mostrar
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $TKT = new \Itracker\Tkt();
    $rta = $TKT->load_VEC(array("origen" => $Context->get_params("path")));

    if ($rta == "ok") {
        // armar respuesta arbol
        $treeL = $Context->createElement("tree");
        /* Respuestas previas */
        $previous = $Context->createElement("previous");

        $topts = $TKT->get_tree_options(); //primero cargar las opciones por si realiza movimiento
        $opts = $TKT->get_tree_history();

        if ($opts) {
            foreach ($opts as $o) {
                $ans = $o["ans"];
                if ($Context->get_User()->get_prop("perfil") == 1) {
                    $ans.="/" . $o["path"];
                }
                $option = $previous->appendChild($Context->createElement("OPTION"));
                $option->appendChild($Context->createElement("question", $o["question"]));
                $option->appendChild($Context->createElement("ans", $ans));
                $previous->appendChild($option);
            }
        }
        $previous->appendChild($Context->createElement("back", $topts["back"]));
        $previous->appendChild($Context->createElement("actual", $Context->get_params("path")));
        $treeL->appendChild($previous);

        /*
          $treeL = $Context->createElement("error", print_r($opts, true));
          return $treeL;
         */

        if ($topts["error"]) {
            $treeL = $Context->createElement("error", $topts["error"]);
            return $treeL;
        }

        if ($topts["object"] && $topts["object"] instanceof Itracker\Option) {
            if ($topts["object"]->get_prop("itform")) {
                $itform = $topts["object"]->get_prop("itform");
                $itfdom = $itform->getInputDom()->documentElement;
                $joined = $Context->append_xml($itfdom);
                if ($joined) {
                    $opendata = $Context->createElement("opendata");
                    $opendata->appendChild($joined);
                    $treeL->appendChild($opendata);
                    if ($topts["object"]->get_prop("unir")) {
                        $simi = $Context->createElement("join", 'true');
                        $treeL->appendChild($simi);
                    }
                    return $treeL;
                } else {
                    $Context->getLogger()->error('No se pudo unir el formulario', array('id' => $topts["object"]->get_prop("id"),
                        'itf' => $itform->getInputDom()->saveXML()));
                    return $Context->createElement("error", "Error en formulario #2");
                }
            } else {
                $opendata = $Context->createElement("opendata");
                $opendata->appendChild($Context->createElement("msj", "No se necesitan datos adicionales. Puedes generar el itracker."));
                $treeL->appendChild($opendata);
                return $treeL;
            }
        } else {

            /* Pregunta */
            $question = $Context->createElement("question");
            $question->appendChild($Context->createElement("title", $topts["title"]));
            $question->appendChild($Context->createElement("detail", $topts["detail"]));

            /* Opciones */
            $options = $Context->createElement("options");
            foreach ($topts["options"] as $o) {
                $option = $options->appendChild($Context->createElement("OPTION"));
                $option->appendChild($Context->createElement("title", $o["title"]));
                $option->appendChild($Context->createElement("isnew", $o["isnew"]));
                $option->appendChild($Context->createElement("destiny", $o["destiny"]));
                $option->appendChild($Context->createElement("end", $o["end"]));
                $options->appendChild($option);
                $treeL->appendChild($question);
                $treeL->appendChild($options);
            }
        }
    } else {
        $treeL = $Context->createElement("error", $rta);
    }
    return $treeL;
}
