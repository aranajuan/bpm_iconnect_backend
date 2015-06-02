<?php

require_once 'classes/tkt.php';
require_once 'classes/tktlister.php';
require_once 'classes/report/reportrequest.php';
require_once 'classes/report/reportexceladapter.php';

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    $u = $RC->get_User();
    $rname = $RC->get_Instance()->get_prop("nombre")."_".$u->get_prop("perfilt");
    $filepath=INCLUDE_DIR . "/config/reports/".$rname.".json";
    if(!file_exists($filepath)){
         return $RC->createElement("error", "No hay reporte disponible para el perfil. $rname");
    }
    $arrayTeam = array();
    $idsteams = explode(",", $RC->get_params("team"));
    foreach ($idsteams as $idteam) {
        if (!$u->in_team($idteam)) {
            return $RC->createElement("error", "Equipo invalido($idteam). Acceso denegado.");
        }
        array_push($arrayTeam, $idteam);
    }

    $Tf = new TKTFILTER();
    $Tf->set_filter(TKTFILTER::$DATE_FROM, @STRdate_format($RC->get_params("from") . "00:00", USERDATE_READ, DBDATE_WRITE));

    $Tf->set_filter(TKTFILTER::$DATE_TO, @STRdate_format($RC->get_params("too") . " 23:59", USERDATE_READ, DBDATE_WRITE));

    if($RC->get_params("datefilter") == "apertura"){
        $Tf->set_filter(TKTFILTER::$DATE_FILTER, TKTFILTER::$DATE_FILTER_FA);
    }else{
        $Tf->set_filter(TKTFILTER::$DATE_FILTER, TKTFILTER::$DATE_FILTER_UPDATE);
    }
    
    if ($RC->get_params("filter") == "tratadopor") {
        $Tf->set_filter(TKTFILTER::$TOUCH_BY_TEAM, $arrayTeam);
    } else {
        $users=array();
        foreach ($arrayTeam as $id) {
            $t = $u->get_team_obj($id);
            if ($t) {
                $users= array_merge($users,makeproparr($t->get_users(),"usr"));
            }
        }
        $Tf->set_filter(TKTFILTER::$UA, $users);
    }


    $Tl = new TKTLISTER();
    $Tl->loadFilter($Tf);
    
    if(!$Tl->execute()){
        return $RC->createElement("error", "Error al cargar listado. ".$Tf->getError());
    }

    $RR = new REPORTREQUEST();
    $RR->setTitle($rname);
    
    if($Tl->getCount()==0){
        return $RC->createElement("error", "No hay tickets para mostrar con el filtro seleccionado.");
    }
    
    $RR->loadTKTS($Tl->getObjs());
    
    $RR->loadITJson(file_get_contents($filepath));

    $RR->execute();
    $RPADAPTER = new REPORTEXCELADAPTER($RR);
    $RPADAPTER->loadExcel();

    $arch = $RC->createElement("file");
    $arch->appendChild($RC->createElement("name", "reporteITRACKER.xlsx"));
    $arch->appendChild($RC->createElementSecure("data", $RPADAPTER->getFile()));

    return $arch;
}

