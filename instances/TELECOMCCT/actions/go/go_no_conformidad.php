<?php

function GO($TKT,$data){
    $comentario=trim(get_value_from_name($data["datos"],"comentario"));
    if($comentario=="")
        return "El comentario es obligatorio";
    $rta=$TKT->load_detail($comentario,FALSE);
    if($rta!="ok")
        return $rta;
    if($TKT->get_prop("minFromClose") > HsToMin($TKT->get_prop("equipo")->get_prop("t_conformidad")))
        return "Se venci&oacute; el tiempo para dar la no conformidad del tkt, si es necesario puede generar otra gesti&oacuten. La misma para este area es de: ".$TKT->get_prop("equipo")->get_prop("t_conformidad")."Hs.";
    
    
    return $TKT->disagree();
 
    
}

?>
