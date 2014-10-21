<?php

function GO($TKT,$data){

    $prioridad=trim(get_value_from_name($data["datos"],"prioridad"));
    if(!is_numeric($prioridad))
        return "Prioridad invalida";
    return $TKT->set_priority($prioridad);
 
}

?>
