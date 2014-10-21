<?php

function GO($TKT,$data){

    $type=trim(get_value_from_name($data["datos"],"ext_type_add"));
    $id_tkt_ext=trim(get_value_from_name($data["datos"],"number_ext"));
    if(!is_numeric($id_tkt_ext))
        return "Error: El ticket debe ser un numero.";
    
    if(file_exists(INCLUDE_DIR."/actions/go_".  $type.".php")){
        include(INCLUDE_DIR."/actions/go_".  $type.".php");
        return SUB_GO($TKT,$id_tkt_ext);
    }else{
        return "Error: Accion invalida, archivo no encontrado.";
    }
    
}

?>
