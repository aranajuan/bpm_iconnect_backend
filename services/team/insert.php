<?php

require_once 'classes/team.php';

/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O = new TEAM($RC->get_Connection());
    $O->load_VEC($RC->get_params(null));
    $result = $O->insert_DB();
    if ($result === "ok") {
        $adms=explode(",", $RC->get_params("idsadms"));
        foreach ($adms as $usr) {
            $U = $RC->get_objcache()->get_object("USER",$usr);
            if($RC->get_objcache()->get_status("USER",$usr)==="ok"){
                $U->add_adm($O->get_prop("id"));
            }
        }
    }
    return $RC->createElement("result", $result);
}
