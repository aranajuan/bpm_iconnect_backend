<?php
/**
 * 
 * @param ACTION $action
 * @return array    $response=array("result"=>"","msj"=>"");
 */
function GO_action($action) {

    $response=array("result"=>"","msj"=>"");
    $TKT = $action->getTKT();
    $result=$TKT->close();
    if($result=="ok"){
        
    }
    
}
