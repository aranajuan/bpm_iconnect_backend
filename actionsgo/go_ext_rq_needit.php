<?php

function SUB_GO($TKT,$id_tkt_ext){

    $rta=$TKT->add_ext("RQ_NEEDIT",$id_tkt_ext);
    return $rta;

}

?>
