<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$TH = $this->getTH();
if($TH instanceof \Itracker\TktH){
    $THA_name = $TH->get_prop('accion')->get_prop('nombre');
    $ActName = $this->get_prop('nombre');
    preg_match('/^UPDATE_(.*)/', $ActName, $matches);
    
    if($matches[1]!=$THA_name){
       $response = array("result" => "error", "msj" => 'No se puede actualizar ('.$THA_name.'->'.$ActName.')'.$matches[1]); 
    }
    
    if($TH->getThUpdate()){
        $response = array("result" => "error", "msj" => 'No se puede actualizar (evento actualizado previamente)');
    }else{
        $this->loadObjadjId($TH->get_prop('id'));
        // MOVER ADJUNTOS
        $response = array("result" => "ok", "msj" => '');
    }
}else{
    $response = array("result" => "error", "msj" => 'No se puede actualizar (sin evento)');
}
return $response;
?>
