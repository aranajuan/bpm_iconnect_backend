<?php

function GO($TKT,$data){
    $rta = $TKT->load_VEC(
            array("origen" => Encrypter::decrypt($data["path"]))
    );
    if ($rta != "ok")
        return $rta;
    if(!$TKT->is_active())
        return "Error en arbol.";
    $lstOption = $TKT->get_last();
    if($lstOption==null){
        return "No se pudo generar ticket. No se encontro ultima opcion.";
    }
    $openAgain="";
    if($lstOption->get_prop("no_anexar")==1){
         $openAgain="<a href=\"javascript:load_tree('".$data["path"]."')\">Abrir otro ticket igual</a>";
    }
    if ($lstOption->get_prop("idequipo_destino") == NULL && $lstOption->get_prop("ruta_destino") == NULL)
        return "Error, fin de arbol invalido (Sin destino).";
    
    if ($lstOption->get_prop("idequipo_destino") && $lstOption->get_prop("ruta_destino")==NULL) {
        $rta = $TKT->load_detail($data["comentarios"]);
        if ($rta != "ok")
            return $rta;
    }
    
    $rtaOP = $TKT->open();
    if ($rtaOP != "ok")
        return $rtaOP;
    if($lstOption->get_prop("ruta_destino")){
        if($lstOption->get_prop("autocerrar")==1){
            $TKT->close("USER");
            return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>".$TKT->get_prop("id")."</a></b>.<br/>Si no puede solucionar el inconveniente debe dar la 'no conformiad' en <a href='mytkts.php' class='lnk_blue'>Mis tkts</a> para que sea tratado por el &aacute;rea correspondiente.<br /><br /><br />",'download.php?fullfile='.$lstOption->get_prop("ruta_destino"));
        }
        else{
            return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>".$TKT->get_prop("id")."</a></b>.<br/>Puede darle seguimiento en&nbsp;<a href='mytkts.php' class='lnk_blue'>Mis tkts</a><br /><br />",'download.php?fullfile='.$lstOption->get_prop("ruta_destino"));
        }
    }
    if (is_numeric($data["idmaster"])) {
        $master = new TKT();
        $rtaMA = $master->load_DB($data["idmaster"]);
        if ($rtaMA != "ok")
            return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>" . $TKT->get_prop("id") . "</a></b> pero no se pudo unir al master (error al cargar - " . $data["idmaster"] . " - $rtaMA).","");

        $rtaJOI = $TKT->join($master);
        if ($rtaJOI != "ok")
            return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>" . $TKT->get_prop("id") . "</a></b> pero no se pudo unir al master ($rtaJOI)","");
        return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>" . $TKT->get_prop("id") . "</a></b>","");
    }
    return array("ok","Se gener&oacute; el tkt n&uacute;mero <b><a href='mytkts.php?id=".$TKT->get_prop("id")."' class='lnk_blue'>" . $TKT->get_prop("id") . "</a></b><br/>".$openAgain,"");
}

?>
