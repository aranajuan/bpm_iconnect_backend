<?php

function GO($TKT,$data){

    $comentario=trim(get_value_from_name($data["datos"],"comentario"));
    if($comentario=="")
        return "El comentario es obligatorio";
    $rta=$TKT->load_detail($comentario,FALSE);
    if($rta!="ok")
        return $rta;
    $idequipo=get_value_from_name($data["datos"],"txt_equipo");
    if($TKT->get_prop("idequipo")==$idequipo)
        return "El ticket ya esta asignado a este equipo";
    $team= new TEAM();
    if($team->load_DB($idequipo)!="ok" && $team->get_prop("tipoTXT")!="GRUPO_IT"){
        return "El equipo no es valido";
    }
    
    return $TKT->derive($team);
    
}

?>
