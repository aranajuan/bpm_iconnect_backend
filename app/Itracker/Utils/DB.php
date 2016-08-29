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
    private $RS;    /* recordset cargado */
    public $cReg;  /*  q de registros en recordset */
    public $noEmpty;   /* consulta con datos */
    private $lastSQL;

    private $resultarr; /* array resultado de PDO */
    /**
     * Carga connectionmanager
     * 
     */
    function __construct($conn, $root = false) {
        $this->connection = $conn;
        $this->reqC=0;
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

    private function beginTran(){
        if($this->RI==ConnectionManager::$ROOT){
            return true; //sin transacciones en root
        }
        return $this->connection->beginTran($this->RI);
    }
    
    /**
     * Carga recordset
     * @param String $ssql
     */
    public function loadRS($ssql) {
        start_measure('sql');
        $ssql = $this->tablenames($ssql);
        if ($this->connection->get_motor() == 'mysql') {
            $this->get_link()->query("SET NAMES 'utf8'");
            $this->RS = $this->get_link()->query($ssql);
            $this->connection->addCounters($this->RI, get_measure('sql'));
            $this->lastSQL = $ssql;
            if (!$this->RS) {
                $this->error = TRUE;
                $this->details = "Error al ejecutar solicitud.";
                $this->noEmpty = 0;
                $this->cReg = 0;
                throw new ItErrorException('db/query', '',
                    \KLogger\Psr\Log\LogLevel::CRITICAL,
                    'Error loadrs',array(
                        print_r($this->get_link()->errorInfo(),true),
                        $ssql));
            } else {
                $this->resultarr=$this->RS->fetchAll();
                $this->cReg =count($this->resultarr);
                if ($this->cReg)
                    $this->noEmpty = 1;
                else
                    $this->noEmpty = 0;
            }
        } elseif ($this->connection->get_motor() == 'mssql') {
            $ssql = str_replace("now()", "getdate()", $ssql);
            $this->RS = $this->get_link()->query($ssql);
            $this->connection->addCounters($this->RI, get_measure('sql'));
            if (!$this->RS) {
                $this->error = TRUE;
                $this->details = "Error al ejecutar solicitud."; 
                $this->noEmpty = 0;
                $this->cReg = 0;
                 throw new ItErrorException('db/query', '',
                    \KLogger\Psr\Log\LogLevel::CRITICAL,
                    'Error loadrs',array(
                        print_r($this->get_link()->errorInfo(),true),
                        $ssql));
            } else {
                $this->resultarr=$this->RS->fetchAll();
                $this->cReg =count($this->resultarr);
                if ($this->cReg)
                    $this->noEmpty = 1;
                else
                    $this->noEmpty = 0;
            }
        }
    }

    /**
     * Ejecuta update
     * @param type $ssql
     * @return int 1/exito
     */
    public function query($ssql) {
        start_measure('sql');
        $ssql = $this->tablenames($ssql);
        $this->beginTran();
        if ($this->connection->get_motor() == 'mysql') {
            $result=$this->get_link()->query($ssql);
            $this->connection->addCounters($this->RI, get_measure('sql'));
            if (!$result) {
                $this->details = "Error al ejecutar solicitud."; //mssql_get_last_message();
                 throw new ItErrorException('db/query', '',
                    \KLogger\Psr\Log\LogLevel::CRITICAL,
                    'Error loadrs',array(
                        print_r($this->get_link()->errorInfo(),true),
                        $ssql));
            } else {
                start_measure('sql');
                $rs = $this->get_link()->query("select @@identity as lastid;");
                $this->connection->addCounters($this->RI, get_measure('sql'));
                $lstID = $rs->fetchColumn();
                $this->lstIDmss = $lstID;
            }
        }
        elseif ($this->connection->get_motor() == 'mssql') {
            $ssql = str_replace("now()", "getdate()", $ssql);
            $ssql = mb_convert_encoding($ssql, 'ISO-8859-15', 'UTF-8');
            $result=$this->get_link()->query($ssql);
            $this->connection->addCounters($this->RI, get_measure('sql'));
            if (!$result) {
                $this->details = "Error al ejecutar solicitud."; //mssql_get_last_message();
                $this->lstIDmss = NULL;
                 throw new ItErrorException('db/query', '',
                    \KLogger\Psr\Log\LogLevel::CRITICAL,
                    'Error loadrs',array(
                        print_r($this->get_link()->errorInfo(),true),
                        $ssql));
            } else {
                start_measure('sql');
                $rs = $this->get_link()->query("select @@identity as lastid;");
                $this->connection->addCounters($this->RI, get_measure('sql'));
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
            return array_shift($this->resultarr);
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
            return $this->lstIDmss;
    }
}

?>
