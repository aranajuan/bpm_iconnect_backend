<?php

function GO($TKT,$data){
    $id_tkt=get_value_from_name($data["datos"],"id_tkt");
    if(!is_numeric($id_tkt)){
        return "El id del ticket es invalido. Debe ser un numero.($id_tkt)";
    }
    /*
    $lnkWI=$TKT->get_prop("equipo")->get_prop("direccionobj")->get_prop("linkwi");
    if(strpos($lnkWI,"{ID}")==0)
            return "La web de incidentes no esta correctamente parametrizada.";
    $txt_wi=str_replace("{ID}", $id_tkt,$lnkWI);
    $rta=$TKT->load_detail($txt_wi,FALSE);
    if($rta!="ok")
        return $rta;
     */
    return $TKT->close("USER",array("IDWI" =>$id_tkt));
    
}

?>
