<?php

namespace Itracker\Services\Action;

use Itracker\ResponseElement;

class Ejecute implements \Itracker\Services\ITServiceInterface{
     
    public static function GO($Context) {
        $idtkt = $Context->get_params("idtkt");
    
    if ($idtkt) {
        $TKT= $Context->get_objcache()->get_object("Tkt",$idtkt);
    }else{
        $TKT = new \Itracker\Tkt();
        $TKT->load_VEC(array(
        		'origen' => $Context->get_params("path"),
        		'usr'=>$Context->getUser()->get_prop("usr")
        ));
    }
    $A = new \Itracker\Action();
    $A->load_DB($Context->get_params("action"));
    $A->setWorking();
    $TKT->setWorking();
    $A->loadTKT($TKT);
    
    $idth = $Context->get_params("idth");
    if($idth){
        $TH= $Context->get_objcache()->get_object("TktH",$idth);
        $A->loadTH($TH);
    }
    
    $A->check_valid(); //opciones del arbol - equipo destino - etc en apertura

    $form = json_decode($Context->get_params("form"),true);
    $A->loadFormValues($form,"actionform");
    
    $fget = false;
    if($Context->get_params("sendfiles")=="true" && $A->get_prop('formulario')){
        $files = $Context->getHandler()->getBody()->getFiles();
        $A->loadFiles($files);
        $fget = true;
    }
    
    $Notif = new \Itracker\Notify();
    $actionResult = $A->ejecute();


    $Notif->load_actionOBJ($A);
    try{
        $Notif->send();
    }catch(\Exception $e){
        $Context->getLogger()->error('No se pudo enviar mail', 
                array('err' => $e->getMessage() ));
    }

    $rta = new ResponseElement('data');

    foreach($actionResult->toArray() as $k=>$v){
    	
        $rta->addValue(new ResponseElement($k,$v, ResponseElement::TEXT));
    }
    
    return $rta;
    }    
}