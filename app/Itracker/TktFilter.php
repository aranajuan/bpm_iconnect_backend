<?php

namespace Itracker;
use Itracker\Exceptions\ItFunctionalException;

/**
 *  Clase para el filtrado de tickets en reporting
 */
class TktFilter extends BasicObject {
    /* FILTER STATIC */

    public static $DATE_FROM = "date_from";
    public static $DATE_TO = "date_to";
    public static $DATE_FILTER = "date_filter";
    public static $DATE_FILTER_FA = "TKT.date_filter_fa";
    public static $DATE_FILTER_FB = "TKT.date_filter_fb";
    public static $DATE_FILTER_UPDATE = "TKT_H.date_filter_update";
    public static $IS_OPEN = "TKT.is_open";
    public static $IDSTEAMS = "TKT.idsteams";
    public static $NOT_IDSTEAMS = "TKT.not_idsteams";
    public static $UA = "TKT.ua";
    public static $TOUCH_BY_TEAM = "TKT.touch_by_team";
    public static $ORIGINS = "TKT.origins";
    public static $TAKENBY = "TKT.takenby";
    public static $IDMASTER = "TKT.idmaster";

    /* FILTER DATA */
    private $filterArray;
    private $usedDB;
    private $error;


    private $ssql;

    public function __construct() {
        $this->filterArray = array();
        $this->usedDB["TKT"] = false;
        $this->usedDB["TKT_H"] = false;
        $this->usedDB["ACCIONES"] = false;
        $this->error = "";
        $this->ssql=null;
    }

    /**
     * Setea uso de las tablas
     * @param string $type  constant
     */
    private function setDBused($type) {
        $dbs = explode(".", $type);
        $dbL = explode(",", $dbs[0]);
        foreach ($dbL as $d) {
            $this->usedDB[$d]=true;
        }
    }

    public function set_filter($type, $array) {
        if($type==self::$DATE_FILTER){
            $this->setDBused($array);
        }else{
            $this->setDBused($type);
        }
        if (is_array($array)) {
            $narr = array();
            foreach ($array as $a) {
                array_push($narr, strToSQL($a));
            }
            $this->filterArray[$type] = $narr;
        } else {
            $this->filterArray[$type] = strToSQL($array);
        }
    }

    public function clear_filter($type) {
        $this->filterArray[$type] = null;
    }

    public function get_filter($type) {
        if (!isset($this->filterArray[$type]))
            return NULL;
        return $this->filterArray[$type];
    }

    /**
     * Prepara union de tablas necesarias
     * @return string
     */
    private function joinTables() {
        $SSQL = "select distinct TKT.id from TBL_TICKETS as TKT ";
        if ($this->usedDB["TKT_H"]) {
            $SSQL .="inner join TBL_TICKETS_M as TKT_H on (TKT_H.idtkt=TKT.id) ";
        }
        if ($this->usedDB["ACCIONES"]) {
            $SSQL .="inner join TBL_ACCIONES as ACCIONES on
                (ACCIONES.id=TKT_H.idaccion) ";
        }
        return $SSQL;
    }

    /**
     * Arma where
     * @return string
     */
    private function makeWhere() {
        $SSQL = "";
        /* Fechas */
        if ($this->get_filter(self::$DATE_FILTER)) {
            switch ($this->get_filter(self::$DATE_FILTER)) {
                case self::$DATE_FILTER_FA:
                    $SSQL.=" TKT.FA between '" .
                            $this->get_filter(self::$DATE_FROM) .
                            "' and '" . $this->get_filter(self::$DATE_TO) . "'";
                    break;
                case self::$DATE_FILTER_FB:
                    $SSQL.=" TKT.FB between '" .
                            $this->get_filter(self::$DATE_FROM) .
                            "' and '" . $this->get_filter(self::$DATE_TO) . "'";
                    break;
                case self::$DATE_FILTER_UPDATE:
                    $SSQL.=" TKT_H.FA between '" .
                            $this->get_filter(self::$DATE_FROM) .
                            "' and '" . $this->get_filter(self::$DATE_TO) . "'";
                    break;
            }
            if ($this->get_filter(self::$IS_OPEN) == "true") {
                $SSQL = "(" . $SSQL . " or TKT.FB is null)";
            }
        } else {
            if ($this->get_filter(self::$IS_OPEN) == "true") {
                $SSQL = "TKT.FB is null";
            } else {
            	throw new ItFunctionalException('tktfilter/invalidparameters','Filtro de fechas invalido');
            }
        }

        foreach ($this->filterArray as $type => $value) {
            switch ($type) {
                case self::$IDSTEAMS:
                    $SSQL.= " and TKT.idequipo in (" .
                            implode(",", $this->get_filter($type)) . ") ";
                    break;
                case self::$NOT_IDSTEAMS:
                    $SSQL.= " and TKT.idequipo not in (" .
                            implode(",", $this->get_filter($type)) . ") ";
                    break;
                case self::$UA:
                    $SSQL.= " and TKT.UA in ('" .
                            implode("','", $this->get_filter($type)) . "') ";
                    break;
                case self::$ORIGINS:
                    $origins = $this->get_filter($type);
                    $c = count($origins);
                    $SSQL.= " and (";
                    for ($i = 0; $i < $c; $i++) {
                        if ($i == 0) {
                            $SSQL.="TKT.origen like '" . $origins[$i] . "'";
                        } else {
                            $SSQL.="or TKT.origen like '" . $origins[$i] . "'";
                        }
                    }
                    $SSQL.= ") ";
                    break;
                case self::$TAKENBY:
                    $utom = $this->get_filter($type);
                    if ($utom[0] == "*") {
                        $SSQL.= " and TKT.u_tom is not null";
                        continue;
                    }
                    if ($utom[0] == "null") {
                        $SSQL.= " and TKT.u_tom is null";
                        continue;
                    }
                    $SSQL.= " and ( TKT.u_tom in ('" .
                            implode("','", $utom) . "') ";
                    if (in_array("null", $utom)) {
                        $SSQL.= "or TKT.u_tom is null";
                    }
                    $SSQL.=")";
                    break;
                case self::$TOUCH_BY_TEAM:
                        $SSQL .= " and (";
                        $fst = true;
                        foreach($this->get_filter($type) as $id){
                            if($fst){
                                $fst=false;
                                $SSQL .= "TKT.equipos_tratan like '%,".$id.",%'";
                            }else{
                                $SSQL .= " or TKT.equipos_tratan like '%,".$id.",%'";
                            }
                        }
                        $SSQL .= ")";
                    break;
                case self::$IDMASTER:
                    $idmaster = $this->get_filter($type);
                    if ($idmaster[0] == "*") {
                        $SSQL.= " and TKT.idmaster is not null";
                        continue;
                    }
                    if ($idmaster[0] == "null") {
                        $SSQL.= " and TKT.idmaster is null";
                        continue;
                    }
                    $SSQL.= " and ( TKT.idmaster in (" .
                            implode(",", $idmaster) . ") ";
                    if (in_array("null", $idmaster)) {
                        $SSQL.= "or TKT.idmaster is null";
                    }
                    $SSQL.=")";
                    break;
            }
        }
        return $SSQL;
    }

    /**
     * Verifica periodo valido de fechas
     * @return boolean
     */
    private function validDate() {
        if ($this->get_filter(self::$IS_OPEN) == "true") {
            return true;
        }
        $fo = strtotime($this->get_filter(self::$DATE_FROM));
        $fd = strtotime($this->get_filter(self::$DATE_TO));
        $days = (($fd - $fo) / 86400);
        return $this->getContext()->get_GlobalConfig()->getInt('configs/reportlimit')
                >= $days;
    }

    /**
     * Arma SQL de consulta
     */
    public function makeSQL() {
        $SSQL = $this->joinTables();
        $SSQL .=' where ';
        $sWHERE = $this->makeWhere();
        if (!$sWHERE) {
            $this->ssql= null;
        }
        if (!$this->validDate()) {
        	throw new ItFunctionalException('tktfilter/invalidparameters','Rango invalido. Maximo: ' .
                    $this->getContext()->get_GlobalConfig()->getInt('configs/reportlimit')
                    . ' dias.');
        }
        $SSQL .= $sWHERE.' order by TKT.id';
        $this->ssql= $SSQL;
    }

    /**
     * Devuelve sql generado
     * @return string|null
     */
    public function getSql(){
        return $this->ssql;
    }

}
