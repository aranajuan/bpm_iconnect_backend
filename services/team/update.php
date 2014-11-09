<?php
require_once   'classes/team.php';
/**
 * Update
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $O= new TEAM($RC->get_Connection());
    $O->load_DB($RC->get_params("id"));
    $O->load_VEC($RC->get_params(null));
    $adms = $O->get_prop("adms");
    $newadms=explode(",",$RC->get_params("idsadms"));
    $admsok=array();
    
    foreach($adms as $ua){
        if(!in_array($ua->get_prop("usr"),$newadms)){
            $ua->remove_adm($O->get_prop("id"));
        }else{
            array_push($admsok, $ua->get_prop("usr"));
        }
    }
    
    foreach($newadms as $Na){
        if(!in_array($Na, $admsok)){
            $U=new USER($RC->get_Connection());
            if($U->load_DB($Na)==="ok"){
                $U->add_adm($O->get_prop("id"));
            }
        }
    }
    
    return $RC->createElement("result",$O->update_DB());
}