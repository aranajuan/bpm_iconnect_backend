<?php

function GO($TKT,$data){
    global $u;
    
    $idmaster=get_value_from_name($data["datos"],"txt_idmaster");
    
    if(!is_numeric($idmaster)){
        return "Invalido, debe ser un numero";
    }
    $master= new TKT();
    if($master->load_DB($idmaster)!="ok")
        return "Error al cargas master";
    
    if($u->get_prop("id")!=$master->get_prop("u_tom")){
        $rtaTom = $u->take(); // toma el ticket para unirlo
        if($rtaTom!="ok"){
            return "Error: El tkt debe pertenecer a tu area y tenerlo tomado (no se pudo tomar: ".$rtaTom." )";
        }
    }
    
    
    return $TKT->join($master);
    
}
?>
