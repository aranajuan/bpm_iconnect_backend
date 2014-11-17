<?php

function GO($TKT,$data){
    $comentario=trim(get_value_from_name($data["datos"],"comentario"));
    if($comentario=="")
        return "El comentario es obligatorio";
    $tipoCValid=array("Correcto","Reingresar","No corresponde");
    if(!in_array(trim(get_value_from_name($data["datos"],"cierre")), $tipoCValid))
             return "Formulario invalido";
    $comentario="<b>Cierre</b>:<div id='cierre'>".trim(get_value_from_name($data["datos"],"cierre"))."</div>".$comentario;
    $rta=$TKT->load_detail($comentario,FALSE);
    if($rta!="ok")
        return $rta;
    return $TKT->close("USER");
    
}

?>
