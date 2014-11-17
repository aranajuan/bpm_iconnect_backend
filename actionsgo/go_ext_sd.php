<?php

function SUB_GO($TKT,$id_tkt_ext){

    $rta=$TKT->add_ext("SD",$id_tkt_ext);
    return $rta;

}

?>
