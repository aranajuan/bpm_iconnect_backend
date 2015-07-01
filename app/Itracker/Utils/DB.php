<?php
namespace Itracker\Utils;
/*
 * Clase ejecucion base de datos
 */

class DB {

    /**
     *
     * @var ConnectionManager
     */
    private $connection;
    private $RI; //root-instance
    private $error = FALSE; /* error en la ultima consulta */
    private $lstIDmss = NULL;   /* ultimo id-> para mssql */
    public $details;    /* detalle del error */
    var $RS;    /* recordset cargado */
    var $cReg;  /*  q de registros en recordset */
    var $noEmpty;   /* consulta con datos */
    var $lastSQL;

    var $resultarr; /* array resultado de PDO */
    /**
     * Carga connectionmanager
     * 
     */
    function __construct($conn, $root = false) {
        $this->connection = $conn;
        if ($root) {
            $this->RI = ConnectionManager::$ROOT;
        } else {
            $this->RI = ConnectionManager::$INSTANCE;
        }
    }

    private function tablenames($ssql) {
        $array = $this->connection->get_alias($this->RI);
        $tmp = $ssql;
        foreach ($array as $t)
            $tmp = str_replace($t[0], strtolower($t[1]), $tmp);
        return $tmp;
    }

    private function get_link() {
        return $this->connection->get_link($this->RI);
    }

    /**
     * Carga recordset
     * @param String $ssql
     */
    public function loadRS($ssql) {
        $ssql = $this->tablenames($ssql);
        if ($this->connection->get_motor() == 'mysql') {
            mysql_query("SET NAMES 'utf8'", $this->get_link());
            $this->RS = mysql_query($ssql, $this->get_link());
            $this->lastSQL = $ssql;
            if (!$this->RS) {
                $this->error = TRUE;
                $this->details = "Error al ejecutar solicitud.";
                $this->logError(mysql_error()."-".$ssql);
                 $this->noEmpty = 0;
                $this->cReg = 0;
                return 1;
            } else {
                $this->cReg = mysql_num_rows($this->RS);
                if ($this->cReg) {
                    $this->noEmpty = 1;
                } else {
                    $this->noEmpty = 0;
                }
                return 0;
            }
        } elseif ($this->connection->get_motor() == 'mssql') {
            $this->RS = $this->get_link()->query($ssql);
            if (!$this->RS) {
                $this->error = TRUE;
                $this->details = "Error al ejecutar solicitud."; 
                $this->logError(print_r($this->get_link()->errorInfo(),true)."-".$ssql);
                $this->noEmpty = 0;
                $this->cReg = 0;
                return 1;
            } else {
                $this->resultarr=$this->RS->fetchAll();
                $this->cReg =count($this->resultarr);
                if ($this->cReg)
                    $this->noEmpty = 1;
                else
                    $this->noEmpty = 0;
                return 0;
            }
        }
    }

    /**
     * Ejecuta update
     * @param type $ssql
     * @return int 1/exito
     */
    public function query($ssql) {

        $ssql = $this->tablenames($ssql);
        if ($this->connection->get_motor() == 'mysql') {
            if (!mysql_query($ssql, $this->get_link())) {
                $this->details = "Error al ejecutar solicitud."; // mysql_error();
                $this->logError(mysql_error()."-".$ssql);
                return mysql_error();
            }
            else
                return 0;
        }
        elseif ($this->connection->get_motor() == 'mssql') {
            $ssql = str_replace("now()", "getdate()", $ssql);
            $ssql = mb_convert_encoding($ssql, 'ISO-8859-15', 'UTF-8');
            if (!($this->get_link()->query($ssql))) {
                $this->details = "Error al ejecutar solicitud."; //mssql_get_last_message();
                $this->logError(print_r($this->get_link()->errorInfo(),true)."-".$ssql);
                $this->lstIDmss = NULL;
                return 1;
            } else {
                $rs = $this->get_link()->query("select @@identity as lastid;");
                $lstID = $rs->fetchColumn();
                $this->lstIDmss = $lstID;
                return 0;
            }
        }
    }

    /**
     * fetch array
     * @return type
     */
    public function get_vector() {
        if ($this->connection->get_motor() == 'mysql') {
            return mysql_fetch_array($this->RS);
        } elseif ($this->connection->get_motor() == 'mssql') {
            $arr = array_shift($this->resultarr);
            if ($arr) {
                foreach ($arr as &$a) {
                    $a = mb_convert_encoding($a, "UTF-8","ISO-8859-15");
                    $a = preg_replace('/[^\x{0009}\x{000a}\x{000d}\x{0020}-\x{D7FF}\x{E000}-\x{FFFD}]+/u', '', $a);
                }
            }
            return $arr;
        }
    }

    /**
     * Devuelve ultimo ID insertado
     * @return type
     */
    public function get_lastID() {
        if ($this->connection->get_motor() == 'mysql') {
            return mysql_insert_id();
        } elseif ($this->connection->get_motor() == 'mssql') {
            return $this->lstIDmss;
        }
    }
    
    /**
     * Log de error SQL
     * @param String $msj
     */
    private function logError($msj){
        $context = \Itracker\Context::getContext();
        $context->getLogger()->critical($context->getLogString().__CLASS__."\t".$msj);
    }

}

?>