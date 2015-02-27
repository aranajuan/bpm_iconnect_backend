<?php

include_once 'abstract/basicobject.php';
include_once 'team.php';
include_once 'tkt.php';

/**
 *  Clase para el filtrado de tickets en reporting
 */
class REPORT extends basicobject {

    private $fromdate;
    private $todate;
    private $valid;
    private $resultids;
    private $resultobjts;

    /**
     * Abierto
     * @var boolean
     */
    private $open;

    /**
     * Carga fecha from
     * @param string $date  USERREAD
     */
    public function setFrom($date) {
        $this->fromdate = strToSQL(@STRdate_format($date, USERDATE_READ, DBDATE_WRITE));
    }

    /**
     * Carga fecha to
     * @param string $date  USERREAD
     */
    public function setTo($date) {
        $this->todate = strToSQL(@STRdate_format($date, USERDATE_READ, DBDATE_WRITE));
    }

    /**
     * Setea Open
     * @param boolean $open
     */
    public function setOpen($open) {
        $this->open = $open;
    }

    /**
     * Verifica las fechas cargadas y tiempo maximo de filtro
     */
    private function setvalid() {
        if ($this->open) {
            $this->valid = true;
            return;
        }
        $fo = strtotime($this->fromdate);
        $fd = strtotime($this->todate);
        $days = (($fd - $fo) / 86400);
        $this->valid = REPORT_DAYSMAX >= $days;
    }

    /**
     * Se puede ejecutar
     * @return boolean
     */
    public function isvalid() {
        $this->setvalid();
        return $this->valid;
    }

    /**
     * Carga todos los tkts que tocaron a un area (apertura/derivacion)
     * @param array<TEAM> $teams
     */
    public function listTouchStaffteam($teams) {
        $this->setOpen(false);
        if (!$this->isvalid()) {
            return null;
        }
        $idsteams = makeproparr($teams, "id");
        $retArr = array();
        $idsteamsInt = makeintarr($idsteams);
        $idsT = "'" . implode("','", $idsteamsInt) . "'";
        $ssql = "Select distinct TH.idtkt from TBL_TICKETS_M as TH "
                . "inner join TBL_ACCIONES as TA on (TH.idaccion=TA.id)"
                . " where TA.ejecuta in('open','derive')"
                . " and TH.valoraccion in (" . $idsT . ")"
                . " and TH.FA between '" . $this->fromdate . "' and '" . $this->todate . "'";
        $this->dbinstance->loadRS($ssql);
        while ($tid = $this->dbinstance->get_vector()) {
            array_push($retArr, $tid["idtkt"]);
        }
        $this->resultids = $retArr;
        $this->loadObjs();
    }

    /**
     * Carga tickets que pasaron por un equipo y ya no estan en el mismo
     * @param TEAM $team
     */
    public function listTouchOutTeam($team) {
        if (!$this->isvalid()) {
            return null;
        }
        $id = $team->get_prop("id");
        $retArr = array();
        $ssql = "Select distinct TK.id from TBL_TICKETS_M as TH "
                . " inner join TBL_ACCIONES as TA on (TH.idaccion=TA.id)"
                . " inner join TBL_TICKETS as TK on (TH.idtkt = TK.id)  "
                . " where TA.ejecuta in('open','derive')"
                . " and TH.valoraccion=".intval($id)
                . " and TK.idequipo <>".intval($id);
        if ($this->open) {
           $ssql.=" and TK.FB is null"; 
        }else{
            $ssql.= " and TH.FA between '" . $this->fromdate . "' and '" . $this->todate . "'";
        }
        $this->dbinstance->loadRS($ssql);
        while ($tid = $this->dbinstance->get_vector()) {
            array_push($retArr, $tid["id"]);
        }
        $this->resultids = $retArr;
        $this->loadObjs();
    }

    /**
     * Carga todos los tickets abiertos por algun usuario de los equipos
     * @param array<TEAM> $teams
     */
    public function openbyOpTeam($teams) {
        if (!$this->isvalid()) {
            return null;
        }
        $retArr = array();
        $ulist = array();
        foreach ($teams as $t) {
            $ul = $t->get_users();
            foreach ($ul as $u) {
                array_push($ulist, $u->get_prop("usr"));
            }
        }

        $ssql = "Select id from TBL_TICKETS where "
                . "UA in ('" . implode("','", $ulist) . "')"
                . " and FA between '" . $this->fromdate . "' and '" . $this->todate . "'";
        $this->dbinstance->loadRS($ssql);
        while ($tid = $this->dbinstance->get_vector()) {
            array_push($retArr, $tid["id"]);
        }
        $this->resultids = $retArr;
        $this->loadObjs();
    }

    /**
     * Carga vector de objetos TKT
     */
    private function loadObjs(){
        $this->resultobjts=array();
        foreach($this->resultids as $id){
            $T = $this->objsCache->get_object("TKT", $id);
            if($this->objsCache->get_status("TKT", $id)=="ok"){
                array_push($this->resultobjts,$T);
            } 
        }
    }

    /**
     * Lista de tickets filtrados
     * @return array<TKT>
     */
    public function getObjs() {
        return $this->resultobjts;
    }

}
