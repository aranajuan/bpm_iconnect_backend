<?php
require_once 'classes/tkt.php';
/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {
    $reqFile=$RC->get_params("file");
    $type = $RC->get_params("type");
    
    $fname = str_replace(array("/","\\",".."), "", $reqFile);
    
    if($type==="adjunto"){
        //validate tkt view
        $fv=explode("_",$reqFile);
        $TH=new TKT_H();
        if($TH->load_DB($fv[0])!="ok"){
            return $RC->createElement("error","Archivo invalido, acceso denegado.");
        }
        if(!$TH->candownload()){
            return $RC->createElement("error","Archivo invalido, acceso denegado.");
        }
        $filepath = $RC->get_Instance()->get_prop("archivos_externos")."/adjuntos/".$fname;
    }elseif($type==="anexo"){
        $filepath = $RC->get_Instance()->get_prop("archivos_externos")."/anexos/".$fname;
    }else{
        return $RC->createElement("error","Archivo invalido");
    }
    
    $im = file_get_contents($filepath);
    if(!$im){
        return $RC->createElement("error","Error al leer archivo. $filepath");
    }
    
    $imdata = base64_encode($im);
    
    if(!$imdata){
        return $RC->createElement("error","Error al leer archivo.2.");
    }
    
    $arch = $RC->createElement("file");
    $arch->appendChild($RC->createElement("name",$fname));
    $arch->appendChild($RC->createElement("data",$imdata));
    
    return $arch;
    
}
