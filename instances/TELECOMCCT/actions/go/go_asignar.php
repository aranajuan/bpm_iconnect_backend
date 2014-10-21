<?php

function GO($TKT,$data){
    $u=new USER();
    if($u->load_DB(get_value_from_name($data["datos"],"txt_usuario"))!="ok")
            return "Error al cargar usuario";
    
    return $TKT->asign($u);
    
}

?>
