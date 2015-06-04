<?php
/**
 * Update
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $O= $Context->get_objcache()->get_object("Team",$Context->get_params("id"));
    $O->load_VEC($Context->get_params(null));
    $adms = $O->get_prop("adms");
    $newadms=explode(",",$Context->get_params("idsadms"));
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
            $U= $Context->get_objcache()->get_object("USER",$Na);
            if($Context->get_objcache()->get_status("USER",$Na)==="ok"){
                $U->add_adm($O->get_prop("id"));
            }
        }
    }
    
    return $Context->createElement("result",$O->update_DB());
}