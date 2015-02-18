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
		<img src='" . MAIL_HEADER . "' style='display:block;' />
		<div style='margin-left:10px;'>
		{body}
		<br/><br/>
                Por favor no responda este mensaje ya que se trata de un env&iacute;o autom&aacute;tico.
                <br/><br/>
                </div>
		<img src='" . MAIL_FOOTER . "' style='display:block;'/>
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
class NOTIFY extends itobject {

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
    private $dbroot;

    /**
     * Condiciones que seran reemplazadas en el array
     */
    private static $COND_VALS = array(
        "is_master",
        "is_teaken",
        "always"
    );

    /**
     *
     * Destinos que se reemplazaran por los destinatarios correspondientes
     */
    private static $MAIL_VALS = array(
        "u_tom", //usuario toma
        "u_asig", //usuario asigna
        "ub", //usuario cierre
        "team", //equipo asignado
        "clients", //generador y adjuntos
        "client", //generador
        "clients->teams" //equipos del generador y adjuntos
    );
    
    /**
     * Lista de valores complejos
     * @var array<String> 
     */
    private static $MAIL_VALS_COMPLEX = array(
        "team_profile",
        "client_team_profile",
        "event_user"
    );

    /**
     * Valores que se reemplazaran en el cuerpo del msj
     */
    private static $BODY_VALS = array(
        "u_tom->name", //usuario toma
        "system->name", //sistema
        "team->name", //equipo actual
        "id", //id del ticket
        "html_dir", //ruta a it
        "FA"    //fecha apertura
    );

    function __construct($conn = null) {
        parent::__construct($conn);
        $this->dbroot = new DB($this->conn, true);
    }

    /**
     * Verifica condicion
     * @param string $c
     * @return boolean
     */
    private function check_condition($c) {
        if ($this->tkt_final == null) {
            return false;
        }
        switch (trim($c)) {
            case "always":
                return true;
            case "is_master":
                return $this->tkt_final->is_master();
            case "is_taken":
                return ($this->tkt_final->get_prop("u_tom") != null);
            default:
                return false;
        }
        return false;
    }

    /**
     * Cambia el parametro por el destino de mail correspondiente
     * @param type $name
     * @param boolean   $too    //es too o cc
     * @return string cadena reemplazada
     */
    private function get_mail_value($name, $too) {
        $nv = explode("=>", $name);
        if (count($nv) > 1) {
            if(!in_array($nv[0], self::$MAIL_VALS_COMPLEX))
                    return "NULL" . MAIL_SPLITER;
            switch ($nv[0]) {
                 case "event_user":
                    $result = "";
                    $ths = $this->tkt_final->get_tktHObj();
                    foreach($ths as $th){
                        $a = $th->get_prop("accion");
                        if(!$a){
                            continue;
                        }
                        $actionsV = explode(",", strtoupper($nv[1]));
                        if(!in_array($a->get_prop("nombre"), $actionsV)){ 
                            continue;
                        }
                        $usr = $th->get_prop("UA_o");
                        if(!$usr){
                            continue;
                        }
                        
                        $result.=$usr->get_prop("mail") . MAIL_SPLITER;
                        
                    }

                    return $result;
                case "team_profile":
                    $result = "";
                    //buscar equipo, ejecutar funcion de equipo para traer usuarios.
                    $users = $this->tkt_final->get_prop("equipo")->get_users($nv[1]);
                    foreach ($users as $u) {
                        $result.=$u->get_prop("mail") . MAIL_SPLITER;
                    }
                    return $result;
                case "client_team_profile":
                    $result = "";
                    if ($this->tkt_final->get_prop("usr_o")) {
                        $teams = $this->tkt_final->get_prop("usr_o")->get_prop("equiposobj");
                        foreach ($teams as $t) {
                            $users = $t->get_users($nv[1]);
                            foreach ($users as $u) {
                                $result.=$u->get_prop("mail") . MAIL_SPLITER;
                            }
                        }
                    }
                    return $result;
                default:
                    return "NULL" . MAIL_SPLITER;
            }
        } else {
            if(!in_array($name, self::$MAIL_VALS))
                    return "NULL" . MAIL_SPLITER;
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
                    if ($this->tkt_final->get_prop("equipo") && $this->tkt_final->get_prop("equipo")->get_prop("listinobj")) {
                        if ($too) {
                            $result = $this->tkt_final->get_prop("equipo")->get_prop("listinobj")->get_prop("too");
                        } else {
                            $result = $this->tkt_final->get_prop("equipo")->get_prop("listinobj")->get_prop("cc");
                        }
                    }
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
                                $result.=MAIL_SPLITER . $tktc->get_prop("usr_o")->get_prop("mail");
                    }
                    break;
                case "clients->teams":
                    $result = "";
                    if ($too) {
                        $dest = "too";
                    } else {
                        $dest = "cc";
                    }
                    $ulist = array();
                    array_push($ulist, $this->tkt_final->get_prop("usr_o"));
                    if ($this->tkt_final->is_master()) {
                        foreach ($this->tkt_final->get_prop("childs") as $tktc) {
                            array_push($ulist, $tktc->get_prop("usr_o"));
                        }
                    }
                    foreach ($ulist as $u) {
                        if ($u) {
                            foreach ($u->get_prop("equiposobj") as $t) {
                                $result.=MAIL_SPLITER . $t->get_prop("listinobj")->get_prop($dest);
                            }
                        }
                    }
                    return $result;
                    break;
                default:
                    $result = "NULL";
            }
        }
        if ($result)
            return $result . MAIL_SPLITER;
        return "NULL". MAIL_SPLITER;
    }

    /**
     * Reemplaza todos los mails 
     * @param type $mail
     * @param boolean $too too, sino cc
     * @return string cadena reemplazada
     */
    private function remake_mail($mail, $too) {
        $mailR = strtolower($mail);
        $matches=array();
        preg_match_all("/\\{[^\\}]+\\}/", $mailR, $matches);
        
        foreach($matches[0] as $m){
            $mclear = str_replace(array("{","}"), "", $m);
            $mailR = str_replace($m, $this->get_mail_value($mclear, $too), $mailR);
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
        $tooSTR = $this->remake_mail($tooSTR, true);
        $ccSTR = $this->remake_mail($ccSTR, false);
        //separar array y verificar mails validos
        $too = explode(MAIL_SPLITER, $tooSTR);
        $cc = explode(MAIL_SPLITER, $ccSTR);

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
            if ($this->check_condition($c)) {
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
     * Carga objeto accion y parametros full_destino, mail_body, accion y accionObj
     * @param ACTION $A
     */
    function load_actionOBJ($A) {
        $this->full_destino = $A->get_prop("notificacion_param");
        $this->mail_body = $A->get_prop("notificacion_texto");
        $this->accion = $A->get_prop("nombre");
        $this->accionObj = $A;
        $this->tkt_final = $A->getTKT();
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
        Puedes verlo en ITRACKER.
        ";
        $this->cc_body = $this->remake_body($ccMail);
    }

    /**
     * Envia mail e informa resultado
     * @return string
     */
    public function send() {
        if (MAIL_ENABLED == 0) {
            return "Mail desactivado";
        }

        if ($this->accion == "" || $this->mail_body == "" || $this->full_destino == "" || $this->tkt_final == NULL) {
            return "Faltan datos para enviar mail";
        }
        $this->split_str();
        $this->load_destiny();
        $this->clean_destiny();

        if (count($this->too) == 0 && count($this->cc) == 0) {
            return "No hay destinatarios para esta notificacion";
        }

        $this->load_body();
        $this->load_cc_body();

        $subject = "Notificacion Itracker (" . $this->get_body_value("system->name") . ")";
        $tobody = str_replace("\\n", "", str_replace("{body}", $this->mail_body, MAIL_TO));

        foreach ($this->too as $t) {
            $this->send_mail($t, $subject, $tobody, "", "HTML", "itracker@ta.telecom.com.ar");
        }

        $cbody = str_replace("\\n", "", str_replace("{body}", $this->cc_body, MAIL_CC));

        foreach ($this->cc as $t) {
            $this->send_mail($t, $subject, $cbody, "", "HTML", "itracker@ta.telecom.com.ar");
        }

        return "ok";
    }

    /**
     * Envia mail a destinatarios por SP
     * @param type $to
     * @param type $subject
     * @param type $body
     * @param type $cc
     * @param type $type
     * @param type $from
     * @return int
     */
    private function send_mail($to, $subject, $body, $cc, $type, $from) {
        $extras = "From: $from\r\nMIME-Version: 1.0\r\nContent-type: text/html; charset=iso-8859-1";
        return mail($to,$subject,$body,$extras);
    }

    public function check_data() {
        
    }

    public function delete_DB() {
        
    }

    public function get_prop($property) {
        
    }

    public function insert_DB() {
        
    }

    public function load_DB($id) {
        
    }

    public function load_VEC($tmpU) {
        
    }

    public function update_DB() {
        
    }

}

?>
