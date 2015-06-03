<?php
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
        $TH= $RC->get_objcache()->get_object("TktH", $fv[0]);
        if($RC->get_objcache()->get_status("TktH", $fv[0])!="ok"){
            return $RC->createElement("error","Archivo invalido, acceso denegado 1.");
        }
        if(!$TH->candownload()){
            return $RC->createElement("error","Archivo invalido, acceso denegado 2.");
        }
        $filepath = $RC->get_Instance()->get_prop("archivos_externos")."/adjuntos/".$fname;
    }elseif($type==="anexo"){
        $filepath = $RC->get_Instance()->get_prop("archivos_externos")."/anexos/".$fname;
    }else{
        return $RC->createElement("error","Archivo invalido");
    }
    
    $im = file_get_contents($filepath);
    if(!$im){
        return $RC->createElement("error","Error al leer archivo.");
    }
    
    if(!$im){
        return $RC->createElement("error","Error al leer archivo.2.");
    }
    
    $arch = $RC->createElement("file");
    $arch->appendChild($RC->createElement("name",$fname));
    if($TH){
        $arch->appendChild($RC->createElement("idtkt",$TH->get_prop("idtkt")));
    }
    $arch->appendChild($RC->createElementSecure("data",$im));
    
    return $arch;
    
}
