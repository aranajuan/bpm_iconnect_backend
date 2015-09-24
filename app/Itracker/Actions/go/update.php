<?php

/**
 * 
 * @param ACTION $this
 * @return array    $response=array("result"=>"","msj"=>"");
 */
$TH = $this->getTH();
if($TH instanceof \Itracker\TktH){
    $THA_name = $TH->get_prop('accion')->get_prop('nombre');
    $ActName = explode('-',$this->get_prop('nombre'));
    
    if($ActName[1]!='UPDATE' ||  $ActName[0]!=$THA_name){
       $response = array("result" => "error", "msj" => 'No se puede actualizar ('.$THA_name.'->'.$this->get_prop('nombre').')'); 
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
