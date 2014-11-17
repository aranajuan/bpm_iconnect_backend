<?php

function SUB_GO($TKT,$id_tkt_ext){

    $rta=$TKT->add_ext("PM",$id_tkt_ext);
    return $rta;

}

?>
