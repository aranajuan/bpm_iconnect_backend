<?php
/**
 * Inserta
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $Ul = new USER($RC->get_Connection()) ;
    $loadR = $Ul->load_DB($RC->get_params("usr"));
    /* Verificar estado en la base update o insert */
    if($loadR==="eliminado"){
        $Ul->hardDelete(); // elimina de la base fisicamente
        $Ul=new USER($RC->get_Connection()) ;
        $Ul->load_VEC($RC->get_params(null));
        $Ul->change_teams(explode(",",$RC->get_params("idsequipos")));
        $result =$Ul->insert_DB();        
    }elseif($loadR==="ok"){//cargar equipos nuevos y demas datos
        // UPDATE
        $Ul->load_VEC($RC->get_params(null));
        $Ul->change_teams(explode(",",$RC->get_params("idsequipos")));
        $result = $Ul->update_DB();
    }else{ //errores de falta de creado
        $Ul->hardDelete(); // elimina de la base fisicamente
        $Ul=new USER($RC->get_Connection()) ;
        $Ul->load_VEC($RC->get_params(null));
        $Ul->change_teams(explode(",",$RC->get_params("idsequipos")));
        $result = $Ul->insert_DB(); 
    }
    return $RC->createElement("result",$result);
}