<?php
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {

    $u = $Context->get_User();
    $rname = $Context->get_Instance()->get_prop("nombre")."_".$u->get_prop("perfilt");
    $filepath=ROOT_DIR . "/config/reports/".$rname.".json";
    if(!file_exists($filepath)){
         return $Context->createElement("error", "No hay reporte disponible para el perfil. $rname");
    }
    $arrayTeam = array();
    $idsteams = explode(",", $Context->get_params("team"));
    foreach ($idsteams as $idteam) {
        if (!$u->in_team($idteam)) {
            return $Context->createElement("error", "Equipo invalido($idteam). Acceso denegado.");
        }
        array_push($arrayTeam, $idteam);
    }

    $Tf = new Itracker\TktFilter();
    $Tf->set_filter(Itracker\TktFilter::$DATE_FROM, @STRdate_format($Context->get_params("from") . "00:00", USERDATE_READ, DBDATE_WRITE));

    $Tf->set_filter(Itracker\TktFilter::$DATE_TO, @STRdate_format($Context->get_params("too") . " 23:59", USERDATE_READ, DBDATE_WRITE));

    if($Context->get_params("datefilter") == "apertura"){
        $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_FA);
    }else{
        $Tf->set_filter(Itracker\TktFilter::$DATE_FILTER, Itracker\TktFilter::$DATE_FILTER_UPDATE);
    }
    
    if ($Context->get_params("filter") == "tratadopor") {
        $Tf->set_filter(Itracker\TktFilter::$TOUCH_BY_TEAM, $arrayTeam);
    } else {
        $users=array();
        foreach ($arrayTeam as $id) {
            $t = $u->get_team_obj($id);
            if ($t) {
                $users= array_merge($users,makeproparr($t->get_users(),"usr"));
            }
        }
        $Tf->set_filter(Itracker\TktFilter::$UA, $users);
    }


    $Tl = new Itracker\TktLister();
    $Tl->loadFilter($Tf);
    
    if(!$Tl->execute()){
        return $Context->createElement("error", "Error al cargar listado. ".$Tf->getError());
    }

    $RR = new \Itracker\Report\Request();
    $RR->setTitle($rname);
    
    if($Tl->getCount()==0){
        return $Context->createElement("error", "No hay tickets para mostrar con el filtro seleccionado.");
    }
    
    $RR->loadTKTS($Tl->getObjs());
    
    $RR->loadITJson(file_get_contents($filepath));

    $RR->execute();
    $RPADAPTER = new \Itracker\Report\ExcelAdapter($RR);
    $RPADAPTER->loadExcel();

    $arch = $Context->createElement("file");
    $arch->appendChild($Context->createElement("name", "reporteITRACKER.xlsx"));
    $arch->appendChild($Context->createElementSecure("data", $RPADAPTER->getFile()));

    return $arch;
}

