<?php

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
    function DB($conn, $root = false) {
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
                $this->details = "Error al ejecutar solicitud."; //mysql_error();
                error_log("IT:sqlErr:" . mysql_error());
                error_log("IT:sql:" . $ssql);
                $this->noEmpty = 0;
                $this->cReg = 0;
            } else {
                $this->cReg = mysql_num_rows($this->RS);
                if ($this->cReg) {
                    $this->noEmpty = 1;
                } else {
                    $this->noEmpty = 0;
                }
            }
        } elseif ($this->connection->get_motor() == 'mssql') {
            $this->RS = $this->get_link()->quey($ssql);
            if (!$this->RS) {
                $this->error = TRUE;
                $this->details = "Error al ejecutar solicitud."; //mssql_get_last_message();
                error_log("IT:sqlErr:" . print_r($this->get_link()->errorInfo()));
                error_log("IT:sql:" . $ssql);
                $this->noEmpty = 0;
                $this->cReg = 0;
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

        $ssql = $this->tablenames($ssql);
        if ($this->connection->get_motor() == 'mysql') {
            if (!mysql_query($ssql, $this->get_link())) {
                $this->details = "Error al ejecutar solicitud."; // mysql_error();
                error_log("IT:sqlErr:" . mysql_error());
                error_log("IT:sql:" . $ssql);
                return mysql_error();
            }
            else
                return 0;
        }
        elseif ($this->connection->get_motor() == 'mssql') {
            $ssql = str_replace("now()", "getdate()", $ssql);
            $ssql = mb_convert_encoding($ssql, 'ISO-8859-1', 'UTF-8');
            if (!($this->get_link()->query($ssql))) {
                $this->details = "Error al ejecutar solicitud."; //mssql_get_last_message();
                error_log("IT:sqlErr:" .print_r($this->get_link()->errorInfo()));
                error_log("IT:sql:" . $ssql);
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
            $arr = array_pop($this->resultarr);
            if ($arr) {
                foreach ($arr as &$a) {
                    $a = mb_convert_encoding($a, "UTF-8");
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

}

?>
