<?php

require_once 'classes/report.php';
require_once 'classes/tkt.php';
require_once 'classes/report/reportrequest.php';
require_once 'classes/report/reportexceladapter.php';

function add_node($tnode, $form) {
    
}

/**
 * Lista
 * @param Rcontroller $RC
 * @return null
 */
function GO($RC) {

    //TODO chequear acceso a reporte  
    $R = new REPORT();

    $R->setFrom($RC->get_params("from") . "00:00");
    $R->setTo($RC->get_params("too") . " 23:59");
    if (!$R->isvalid()) {
        return $RC->createElement("error", "Fechas invalidas o periodo incorrecto. Seleccione un rango no mayor a " . REPORT_DAYSMAX . " dias.");
    }

    $teamVid = explode(",", $RC->get_params("teams"));
    $teamsVO = array();

    $u = $RC->get_User();
    foreach ($teamVid as $id) {
        $t = $u->get_team_obj($id);
        if ($t) {
            array_push($teamsVO, $t);
        }
    }

    switch ($RC->get_params("filter")) {
        case "from":
            $R->openbyOpTeam($teamsVO);
            break;
        case "to":
            $R->listTouchStaffteam($teamsVO);
            break;
    }
    $RR= new REPORTREQUEST();
    $lT = $R->getObjs();
    
    $RR->loadTKTS($lT);
    $RR->loadITJson('{
	"fields":[
        	{
			"action":"TKT",
			"property":"id",
			"modificator":"FST",
			"alias":"id"
		},
                {
			"action":"TKT",
			"property":"tipificacion",
			"modificator":"*",
			"alias":"T1_"
		}
                ,
		{
			"action":"TKT",
			"property":"usr_o.nombre",
                        "modificator":"FST",
			"alias":"Usuario apertura"
		},
                {
			"action":"TKT",
			"property":"usr_o.equiposname",
			"modificator":"FST",
			"alias":"Equipo"
		}
                ,
                {
			"action":"TKT",
			"property":"tipificacion",
			"modificator":"*",
			"alias":"T_"
		}
                ,
		{
			"action":"TOMAR",
			"property":"UA",
			"modificator":"*",
			"alias":"usr tom_"
		},
		{
			"action":"TOMAR",
			"property":"FA",
			"modificator":"LST",
			"alias":"f tom_"
		}]
                }');
    
    $RR->execute();
    $RPADAPTER = new REPORTEXCELADAPTER($RR);
    $RPADAPTER->loadExcel();
    exit();
    $data = $RC->createElement("data");
    $list = $RC->createElement("list");
    $tifMax = 0;
    $fieldOlist = array();
    $fieldClist = array();
    foreach ($lT as $tkt) {
        $tnode = $RC->createElement("TKT");
        $tnode->appendChild($RC->createElement("id", $tkt->get_prop("id")));
        $tnode->appendChild($RC->createElement("FA", $tkt->get_prop("FA")));
        //tipificacion
        $i = 0;
        $topt = $tkt->get_tree_history();
        foreach ($topt as $to) {
            $i++;
            $tnode->appendChild($RC->createElement("T" . $i, $to["ans"]));
        }
        if ($i > $tifMax) {
            $tifMax = $i;
        }
        $tnode->appendChild($RC->createElement("UA", $tkt->get_prop("usr_o")->get_prop("nombre")));
        $teamsT = "";
        foreach ($tkt->get_prop("usr_o")->get_prop("equiposobj") as $t) {
            $teamsT.=$t->get_prop("nombre") . ";";
        }
        $tnode->appendChild($RC->createElement("EA", $teamsT));
        $cStatus = $tkt->get_status();
        $tnode->appendChild($RC->createElement("status", $cStatus[1]));

        $events = $tkt->get_tktHObj();
        $lastclose = null;
        foreach ($events as $e) {

            if ($e->get_prop('accion')->get_prop('ejecuta') == "open") {
                //carga campos de apertura
                $idt = $e->get_prop('valoraccion');
                $form = $e->get_prop('detalle_xml');
                $tA = $RC->get_objcache()->get_object("TEAM", $idt);
                if ($RC->get_objcache()->get_status("TEAM", $idt) == "ok") {
                    $tnode->appendChild($RC->createElement("asignadoa", $tA->get_prop("nombre")));
                }
                if ($form) {
                    $fields = $form->getElementsByTagName("element");

                    foreach ($fields as $field) {
                        $lbl = $field->getElementsByTagName("label");
                        $val = $field->getElementsByTagName("value");
                        $id = $field->getElementsByTagName("id");
                        $value = $val->item(0)->textContent;
                        if ($id->item(0)->textContent && $value) {
                            $type = trim(space_delete($field->getElementsByTagName("type")->item(0)->textContent));
                            if ($type == "select") {
                                $opts = $field->getElementsByTagName("option");
                                foreach ($opts as $o) {
                                    if (trim(space_delete($o->getElementsByTagName("value")->item(0)->textContent)) == $value) {
                                        $value = $o->getElementsByTagName("text")->item(0)->textContent;
                                    }
                                }
                            }
                            $lblt = trim(space_delete($lbl->item(0)->textContent));
                            $idt = trim(space_delete($id->item(0)->textContent));
                            $tnode->appendChild($RC->createElement("id" . $idt, $value));
                            if (!in_array("id" . $idt . "=>" . $lblt, $fieldOlist)) {
                                array_push($fieldOlist, "id" . $idt . "=>" . $lblt);
                            }
                        }
                    }
                }
            }

            if ($e->get_prop('accion')->get_prop('ejecuta') == "close") {
                $lastclose = $e;
            }
        }

        if ($lastclose) {
            //muestra campos de cierre
            $FC = $lastclose->get_prop('FA');
            $form = $lastclose->get_prop('detalle_xml');
            $tnode->appendChild($RC->createElement("FC", $FC));
            if ($form) {
                $fields = $form->getElementsByTagName("element");

                foreach ($fields as $field) {
                    $lbl = $field->getElementsByTagName("label");
                    $val = $field->getElementsByTagName("value");
                    $id = $field->getElementsByTagName("id");
                    $value = $val->item(0)->textContent;
                    if ($id->item(0)->textContent && $value) {
                        $type = trim(space_delete($field->getElementsByTagName("type")->item(0)->textContent));
                        if ($type == "select") {
                            $opts = $field->getElementsByTagName("option");
                            foreach ($opts as $o) {
                                if (trim(space_delete($o->getElementsByTagName("value")->item(0)->textContent)) == $value) {
                                    $value = $o->getElementsByTagName("text")->item(0)->textContent;
                                }
                            }
                        }
                        $lblt = trim(space_delete($lbl->item(0)->textContent));
                        $idt = trim(space_delete($id->item(0)->textContent));
                        $tnode->appendChild($RC->createElement("id" . $idt, $value));
                        if (!in_array("id" . $idt . "=>cierre_" . $lblt, $fieldClist)) {
                            array_push($fieldClist, "id" . $idt . "=>cierre_" . $lblt);
                        }
                    }
                }
            }
        }

        $list->appendChild($tnode);
        //detalle.xml
    }
    $tlisTXT = "";
    for ($i = 1; $i <= $tifMax; $i++) {
        $tlisTXT.=",T" . $i;
    }
    $fields = implode(",", $fieldOlist) .",". implode(",", $fieldClist);
    $data->appendChild($RC->createElement("view", "id,FA=>fecha apertura" . $tlisTXT . ",UA=>Usuario apertura,EA=>Equipo apertura,status,FC=>Fecha cierre,asignadoa," . $fields));
    $data->appendChild($list);
    return $data;
}

