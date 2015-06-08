<?php

/**
 * Inserta
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $O = new \Itracker\Team();
    $O->load_VEC($Context->get_params(null));
    $result = $O->insert_DB();
    if ($result === "ok") {
        $adms=explode(",", $Context->get_params("idsadms"));
        foreach ($adms as $usr) {
            $U = $Context->get_objcache()->get_object("USER",$usr);
            if($Context->get_objcache()->get_status("USER",$usr)==="ok"){
                $U->add_adm($O->get_prop("id"));
            }
        }
    }
    return $Context->createElement("result", $result);
}
