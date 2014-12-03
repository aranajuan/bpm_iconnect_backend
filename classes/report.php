<?php

include_once 'abstract/basicobject.php';
include_once 'team.php';

/**
 *  Clase para el filtrado de tickets en reporting
 */
class REPORT extends basicobject {

    private $fromdate;
    private $todate;

    /**
     * Carga fecha from
     * @param string $date  USERREAD
     */
    public function setFrom($date) {
        $this->fromdate = strToSQL(@STRdate_format($date, USERDATE_READ, DBDATE_WRITE));
    }

    public function setTo($date) {
        $this->to = strToSQL(@STRdate_format($date, USERDATE_READ, DBDATE_WRITE));
    }

    /**
     * Carga todos los tkts que tocaron a un arrea (apertura/derivacion)
     * @param array<int> $idsteams
     */
    public function listTouchStaffteam($idsteams) {
        $retArr = array();
        $idsteamsInt = makeintarr($idsteams);
        $idsT = "'" . implode("','", $idsteamsInt) . "'";
        $ssql = "Select TH.idtkt from TBL_TICKETS_M as TH "
                . "inner join TBL_ACCIONES as TA on (TH.idaccion=TA.id)"
                . " where TA.ejecuta in('open','derive')"
                . " and TH.valoraccion in (" . $idsT . ")"
                . " and TH.FA between '".$this->fromdate."' and '".$this->todate."'";
        $this->dbinstance->loadRS($ssql);
        while ($tid = $this->dbinstance->get_vector()) {
            array_push($retArr, $tid["idtkt"]);
        }
        return implode(",", $retArr);
    }

    /**
     * Carga todos los tickets abiertos por algun usuario de los equipos
     * @param array<int> $idsteams
     */
    public function openbyOpTeam($idsteams) {
        $idsteamsInt = makeintarr($idsteams);
        $ulist = array();
        foreach ($idsteamsInt as $id) {
            $t = new TEAM();
            if ($t->load_DB($id) == "ok") {
                $ul = $t->get_users();
                foreach ($ul as $u) {
                    array_push($ulist, $u->get_prop("usr"));
                }
            }
        }

        $ssql = "Select id from TBL_TICKETS where "
                . "UA in ('" . implode("','", $ulist) . "')"
                . " and TH.FA between '".$this->fromdate."' and '".$this->todate."'";
        return $ssql;
    }

}
