<?php

function GO($TKT,$data){
    $comentario=trim(get_value_from_name($data["datos"],"comentario"));
    if($comentario=="")
        return "El comentario es obligatorio";
        
    $tipoCValid=array("Corresponde","Corresponde. Ajuste General","No corresponde","Rechazado error de formato");
    
    if(!in_array(trim(get_value_from_name($data["datos"],"cierre")), $tipoCValid))
             return "Formulario invalido-Seleccione un cierre";
             
    $cierreT="<b>Cierre</b>:<div id='cierre'>".trim(get_value_from_name($data["datos"],"cierre"))."</div>";
    
    if(!is_numeric(get_value_from_name($data["datos"],"qcasos"))){
    	return "Formulario invalido-Q de reclamos debe ser numerico";
    }
    $cierreT.="<br/><b>Q</b>:<div id='qcasos'>".trim(get_value_from_name($data["datos"],"qcasos"))."</div>";
    
    if(!is_numeric(get_value_from_name($data["datos"],"monto"))){
    	return "Formulario invalido-El monto debe ser numerico";
    }
    $cierreT.="<br/><b>Monto</b>:<div id='monto'>".trim(get_value_from_name($data["datos"],"monto"))."</div>";
    
    $comentario=$cierreT."<br/>".$comentario;
    $rta=$TKT->load_detail($comentario,FALSE);
    if($rta!="ok")
        return $rta;
    return $TKT->close("USER");
    
}

?>