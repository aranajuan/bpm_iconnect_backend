<?php

require_once 'classes/tkt.php';
/**
 * Cuerpos de mails default
 */
define("MAIL_TO", "
<html>
<head></head>
<body width='100%' bgcolor='#3d3d3d'>
<table width='100%' cellspacing='0' cellpadding='0' >
<tr>
    <td>
        &nbsp;
    </td>
    <td width='750' style='background-color:white;'>
		<img src='http://i786.photobucket.com/albums/yy145/temecom_telecom_telecom/head_it_zps6e19472a.png' style='display:block;' />
		<div style='margin-left:10px;'>
		{body}
		<br/><br/>
                Por favor no responda este mensaje ya que se trata de un env&iacute;o autom&aacute;tico.
                <br/><br/>
                </div>
		<img src='http://i786.photobucket.com/albums/yy145/temecom_telecom_telecom/foot_it_zps94230a0c.png' style='display:block;'/>
    </td>
     <td>
        &nbsp;
    </td>
</tr>
</table>
</body>
</html>
");
define("MAIL_CC", MAIL_TO);
//formato en base (condicion)(destino)||(condicion)(destino)

/**
 * Clase para enviar notificaciones y armar mails
 */
class NOTIFY {

    private $tkt_origen = NULL; /* Objeto TKT inicial */
    private $tkt_final = NULL; /* Objeto TKT actualizado */
    private $full_destino = NULL; /* destino y condiciones en string */
    private $condition = array(); /* condiciones para cada destino */
    private $destiny = array(); /* destino para cada conexion */
    private $accion = ""; /* accion ejecutada */
    private $accionObj = NULL;
    private $mail_body; /* cuerpo del mail TO armado */
    private $cc_body; /* cuerpo del mail CC armado */
    private $too; /* array de destinos TO */
    private $cc; /* array de destinos CC */

    /**
     * Condiciones que seran reemplazadas en el array
     */
    private static $COND_VALS = array(
        "u_tom",
        "idmaster",
        "u_asig",
        "ub",
        "fb",
        "prioridad",
        "prev_u_tom"
    );

    /**
     *
     * Destinos que se reemplazaran por los destinatarios correspondientes
     */
    private static $MAIL_VALS = array(
        "u_tom",
        "u_asig",
        "ub",
        "team",
        "prev_team",
        "clients",
        "client"
            // ademas se podra indicar cualquier nombre de los perfiles
    );

    /**
     * Valores que se reemplazaran en el cuerpo del msj
     */
    private static $BODY_VALS = array(
        "u_tom->name",
        "system->name",
        "prev_team->name",
        "dest_team->name",
        "id",
        "html_dir",
        "FA"
    );

    /**
     * Combierte la condicion en un valor para compararlo
     * @param type $name
     * @return string valor reemplazado
     */
    private function get_condition_value($name) {
        switch ($name) {
            case "u_tom":
                $result = $this->tkt_final->get_prop("u_tom");
                break;
            case "fb":
                $result = $this->tkt_final->get_prop("FB");
                if ($result) {
                    $result = "'" . $result . "'";
                }
                break;
            case "idmaster":
                $result = $this->tkt_final->get_prop("idmaster");
                break;
            case "u_asig":
                $result = $this->tkt_final->get_prop("u_asig");
                break;
            case "ub":
                $result = $this->tkt_final->get_prop("UB");
                break;
            case "prioridad":
                $result = $this->tkt_final->get_prop("prioridad");
                break;
            case "prev_u_tom":
                $result = $this->tkt_origen->get_prop("u_tom");
                break;
            default:
                $result = "NULL";
        }
        if ($result)
            return $result;
        return "NULL";
    }

    /**
     * Reemplaza todas las condiciones con los valores
     * @param type $cond
     * @return type cadena reemplazada
     */
    private function remake_condition($cond) {
        $tmp_str = strtolower($cond);
        foreach (self::$COND_VALS as $tosearch) {
            if (strpos(" " . $tmp_str, "{" . $tosearch . "}")) {
                $tmp_str = str_replace("{" . $tosearch . "}", $this->get_condition_value($tosearch), $tmp_str);
            }
        }
        return $tmp_str;
    }

    /**
     * Cambia el parametro por el destino de mail correspondiente
     * @param type $name
     * @return string cadena reemplazada
     */
    private function get_mail_value($name) {
        $nv = explode("=>", $name);
        if (count($nv) > 1) {
            switch ($nv[0]) {
                case "team_profile":
                    $result = "";
                    //buscar equipo, ejecutar funcion de equipo para traer usuarios.
                    $users = $this->tkt_final->get_prop("equipo")->get_users($nv[1]);
                    foreach ($users as $u) {
                        $result.=$u->get_prop("mail") . ";";
                    }
                    return $result;
                case "client_team_profile":
                    $result = "";
                    if ($this->tkt_final->get_prop("usr_o")) {
                        $teams = $this->tkt_final->get_prop("usr_o")->get_prop("equiposobj");
                        foreach ($teams as $t) {
                            $users = $t->get_users($nv[1]);
                            foreach ($users as $u) {
                                $result.=$u->get_prop("mail") . ";";
                            }
                        }
                    }
                    return $result;
                default:
                    return "NULL;";
            }
        } else {
            switch ($name) {
                case "u_tom":
                    if ($result = $this->tkt_final->get_prop("u_tom_o"))
                        $result = $this->tkt_final->get_prop("u_tom_o")->get_prop("mail");
                    break;
                case "u_asig":
                    if ($this->tkt_final->get_prop("u_asig_o"))
                        $result = $this->tkt_final->get_prop("u_asig_o")->get_prop("mail");
                    break;
                case "ub":
                    $tu = new USER();
                    $tu->load_DB($this->tkt_final->get_prop("UB"));
                    if ($tu)
                        $result = $tu->get_prop("mail");
                    break;
                case "team":
                    if ($this->tkt_final->get_prop("equipo") && $this->tkt_final->get_prop("equipo")->get_prop("listinobj"))
                        $result = $this->tkt_final->get_prop("equipo")->get_prop("listinobj")->get_prop("too");
                    break;
                case "prev_team":
                    if ($this->tkt_origen->get_prop("equipo") && $this->tkt_origen->get_prop("equipo")->get_prop("listinobj"))
                        $result = $this->tkt_origen->get_prop("equipo")->get_prop("listinobj")->get_prop("too");
                    break;
                case "client":
                    if ($this->tkt_final->get_prop("usr_o"))
                        $result = $this->tkt_final->get_prop("usr_o")->get_prop("mail");
                    break;
                case "clients":
                    if ($this->tkt_final->get_prop("usr_o"))
                        $result = $this->tkt_final->get_prop("usr_o")->get_prop("mail");
                    //verifica si es master
                    if (!$this->tkt_final->get_prop("idmaster")) {
                        $this->tkt_final->load_childs();
                        foreach ($this->tkt_final->get_prop("childs") as $tktc)
                            if ($tktc->get_prop("usr_o"))
                                $result.=";" . $tktc->get_prop("usr_o")->get_prop("mail");
                    }
                    break;
                default:
                    $result = "NULL";
            }
        }
        if ($result)
            return $result . ";";
        return "NULL;";
    }

    /**
     * Reemplaza todos los mails 
     * @param type $mail
     * @return string cadena reemplazada
     */
    private function remake_mail($mail) {
        $mailR = strtolower($mail);
        //buscar y reemplazar perfiles
        foreach ($GLOBALS["PROFILES"] as $prof) {
            if (strpos(" " . $mailR, "{team_profile=>" . $prof . "}")) {
                $mailR = str_replace("{team_profile=>" . $prof . "}", $this->get_mail_value("team_profile=>" . $prof), $mailR);
            }
            if (strpos(" " . $mailR, "{client_team_profile=>" . $prof . "}")) {
                $mailR = str_replace("{client_team_profile=>" . $prof . "}", $this->get_mail_value("client_team_profile=>" . $prof), $mailR);
            }
        }

        //buscar y reemplazar constantes
        foreach (self::$MAIL_VALS as $tosearch) {
            if (strpos(" " . $mailR, "{" . $tosearch . "}")) {
                $mailR = str_replace("{" . $tosearch . "}", $this->get_mail_value($tosearch), $mailR);
            }
        }
        return $mailR;
    }

    /**
     * Genera arrays con TO(array) y CC(array)
     * @param type $strmail
     * @return type
     */
    private function get_full_mail_destiny($strmail) {
        // buscar optimizado 
        $too = array();
        $cc = array();
        $tooSTR = "";
        $ccSTR = "";

        //separar to y cc en dos str
        $tmpSplit = explode("::", $strmail);
        foreach ($tmpSplit as $tmpS) {
            $tcSplit = explode(":", $tmpS);
            if ($tcSplit[0] == "to")
                $tooSTR = $tcSplit[1];
            if ($tcSplit[0] == "cc")
                $ccSTR = $tcSplit[1];
        }

        //reemplazar parametros
        $tooSTR = $this->remake_mail($tooSTR);
        $ccSTR = $this->remake_mail($ccSTR);
        //separar array y verificar mails validos
        $too = explode(";", $tooSTR);
        $cc = explode(";", $ccSTR);

        return array($too, $cc);
    }

    /**
     *  Separa full_destino en condition y destiny
     */
    private function split_str() {
        $tmp_s = explode(")$$(", $this->full_destino);
        foreach ($tmp_s as $fd) {
            $cd = explode(")(", $fd);
            array_push($this->condition, str_replace(")", "", str_replace("(", "", $cd[0])));
            array_push($this->destiny, str_replace(")", "", str_replace("(", "", $cd[1])));
        }
    }

    /**
     * Evalua las condiciones y genera destinos
     */
    private function load_destiny() {
        $this->too = array();
        $this->cc = array();
        $i = 0;
        foreach ($this->condition as $c) {
            $cond = $this->remake_condition($c);
            if (trim($cond) != "" && eval("return (" . $cond . ");")) {
                $toAdd = $this->get_full_mail_destiny($this->destiny[$i]);
                $this->too = array_merge($this->too, $toAdd[0]);
                $this->cc = array_merge($this->cc, $toAdd[1]);
            }
            $i++;
        }
    }

    /**
     * Elimina mails duplicados o invalidos
     */
    private function clean_destiny() {

        //eliminar duplicados
        $too = array_unique($this->too);
        $cc = array_unique($this->cc);
        $i = 0;
        foreach ($too as $tM) {
            if (!filter_var(trim($tM), FILTER_VALIDATE_EMAIL))
                array_splice($too, $i, 1);
            $i++;
        }
        $i = 0;
        foreach ($cc as $tM) {
            if (!filter_var(trim($tM), FILTER_VALIDATE_EMAIL))
                array_splice($cc, $i, 1);
            $i++;
        }

        $this->too = $too;
        $this->cc = $cc;
    }

    /**
     * Carga el ticket de origen
     * @param type $TKT
     */
    function load_TKTEXT($TKT) {
        $this->tkt_origen = $TKT;
    }

    /**
     * Carga el ticket destino
     * @param type $TKT
     */
    function load_TKTNEW($TKT) {
        $this->tkt_final = $TKT;
    }

    /**
     * Carga objeto accion de base y parametros full_destino, mail_body, accion y accionObj
     * @param type $name
     */
    function load_action($name) {
        $A = new ACTION();
        if ($A->loadDB_name($name) == "ok") {
            load_actionOBJ($A);
        } else {
            $this->full_destino = "";
            $this->mail_body = "";
            $this->accion = "";
            $this->accionObj = NULL;
        }
    }

    /**
     * Carga objeto accion y parametros full_destino, mail_body, accion y accionObj
     * @param type $name
     */
    function load_actionOBJ($A) {
        $this->full_destino = $A->get_prop("notificacion_param");
        $this->mail_body = $A->get_prop("notificacion_texto");
        $this->accion = $A->get_prop("nombre");
        $this->accionObj = $A;
    }

    /**
     * Obtiene valor a reemplazar en el body
     * @param type $name
     * @return string
     */
    private function get_body_value($name) {
        switch ($name) {
            case "u_tom->name":
                $ut = $this->tkt_final->get_prop("u_tom_o");
                if ($ut)
                    $result = $ut->get_prop("nombre");
                else
                    $result = "NULL";
                break;
            case "system->name":
                $sy = $this->tkt_final->get_system();
                if ($sy)
                    $result = $sy->get_prop("nombre");
                else
                    $result = "NULL";
                break;
            case "id":
                $result = $this->tkt_final->get_prop("id");
                break;
            case "html_dir":
                $result = HBASE_DIR . '/';
                break;
            case "FA":
                $result = $this->tkt_final->get_prop("FA");
                break;
            case "dest_team->name":
                $tt = $this->tkt_final->get_prop("equipo");
                if ($tt)
                    $result = $tt->get_prop("nombre");
                else
                    $result = "NULL";
                break;
            case "prev_team->name":
                $tt = $this->tkt_origen->get_prop("equipo");
                if ($tt)
                    $result = $tt->get_prop("nombre");
                else
                    $result = "NULL";
                break;
            default:
                $result = "NULL";
        }
        if ($result)
            return $result;
        return "NULL";
    }

    /**
     * Rearmar cuerpo del mensaje reemplazando valores
     * @param type $txt
     * @return string
     */
    private function remake_body($txt) {
        $tmpMail = trim($txt);
        if ($tmpMail != "") {
            foreach (self::$BODY_VALS as $tosearch) {
                if (strpos(" " . $tmpMail, "{" . $tosearch . "}")) {
                    $tmpMail = str_replace("{" . $tosearch . "}", $this->get_body_value($tosearch), $tmpMail);
                }
            }
            return $tmpMail;
        }
        return "";
    }

    /**
     * Carga cuerpo del msj TO reemplazando valores- si no hay accion devuelve 0
     * @return int
     */
    private function load_body() {
        if ($this->accionObj) {
            $this->mail_body = $this->remake_body($this->mail_body);
            return 1;
        }
        return 0;
    }

    /**
     * Genera cuerpo del mensaje CC
     */
    private function load_cc_body() {

        $ccMail = "
        Se ejecuto la accion:  " . strtoupper($this->accion) . " sobre el tkt: {id}.<br />
        Puedes verlo en <a href=\"{html_dir}\">ITRACKER</a>.
        ";
        $this->cc_body = $this->remake_body($ccMail);
    }

    /**
     * Envia mail e informa resultado
     * @return string
     */
    function send() {
        if (MAIL_ENABLED == 0)
            return "ok";
        if ($this->accion == "" || $this->mail_body == "" || $this->full_destino == "" || $this->tkt_final == NULL || $this->tkt_origen == NULL)
            return "ok";
        $this->split_str();
        $this->load_destiny();
        $this->clean_destiny();

        if (count($this->too) == 0 && count($this->cc) == 0)
            return "ok";
        $this->load_body();
        $this->load_cc_body();

        $ok = true;
        foreach ($this->too as $t) {
            $r = mail($t, "Notificacion Itracker (" . $this->get_body_value("system->name") . ")", str_replace("\\n", "", str_replace("{body}", $this->mail_body, MAIL_TO)), "From: sistemas_de_ventas@ta.telecom.com.ar\r\nMIME-Version: 1.0\r\nContent-type: text/html; charset=iso-8859-1");
            $r = 1;
            if (!$r)
                $ok = false;
        }

        foreach ($this->cc as $t) {
            if (!mail($t, "Notificacion Itracker (" . $this->get_body_value("system->name") . ")", str_replace("\\n", "", str_replace("{body}", $this->cc_body, MAIL_CC)), "From: sistemas_de_ventas@ta.telecom.com.ar\r\nMIME-Version: 1.0\r\nContent-type: text/html; charset=iso-8859-1"))
                $ok = false;
        }
        if ($ok)
            return "ok";
        return "No se pudo informar a todos los destinatarios.";
    }

}

?>
