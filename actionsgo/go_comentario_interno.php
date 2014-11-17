<?php

function GO($TKT,$data){

    $comentario=trim(get_value_from_name($data["datos"],"comentario"));
    if($comentario=="")
        return "El comentario es obligatorio";
    $rta=$TKT->load_detail($comentario,FALSE);
    if($rta!="ok")
        return $rta;
    return $TKT->comment("COMENTARIO_INTERNO");
    
}

?>
