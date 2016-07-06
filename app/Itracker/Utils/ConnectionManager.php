<?php

namespace Itracker\Utils;

class ConnectionManager {

    private $dbRootlink; //recurso a db root
    private $dbInstancelink; // recurso a db instancia
    private $dbRootAlias;
    private $dbInstanceAlias;
    private $dbRootTran;
    private $dbInstanceTran;
    private $serverMotor;
    public static $ROOT = 1;
    public static $INSTANCE = 2;

    /**
     * Contadores de sqls
     * @var int
     */
    private $sqlC_root;
    private $sqlCT_root;
    private $sqlC_instance;
    private $sqlCT_instance;

    public function __construct() {
        $this->sqlCT_root = 0;
        $this->sqlC_root = 0;
        $this->sqlCT_instance = 0;
        $this->sqlC_instance = 0;
    }

    /**
     * Conecta a base root
     * @param type $motor
     * @param type $host
     * @param type $user
     * @param type $pass
     * @param type $dbAlias
     * @return boolean resultado
     */
    public function connect_root($motor, $host, $user, $pass, $dbAlias) {
        $this->serverMotor = $motor;
        $this->dbRootAlias = $dbAlias;
        $this->dbRootlink = $this->new_link($host, $user, $pass);
        $this->dbRootTran = false;
    }

    /**
     * Conecta a instancia
     * @param type $host
     * @param type $user
     * @param type $pass
     * @param type $dbAlias
     * @return boolean
     */
    public function connect_instance($host, $user, $pass, $dbAlias) {
        $this->dbInstanceAlias = $dbAlias;
        $this->dbInstancelink = $this->new_link($host, $user, $pass);
        $this->dbInstanceTran = false;
    }

    /**
     * Cierra conecciones y realiza commits
     * @param boolean $failure
     * @param boolean $exit close on failure
     */
    public function close_connections($failure = false, $exit = true) {
        $close = false;
        if ($this->dbInstancelink instanceof \PDO) {
            if ($this->dbInstanceTran) {
                if ($failure) {
                    $this->dbInstancelink->rollBack();
                    LoggerFactory::getLogger()->critical("Rolling back instance");
                } else {
                    $this->dbInstancelink->commit();
                }
            }
            $this->dbInstanceTran = false;
            $this->dbInstancelink = NULL;
            $close = true;
        }
        if ($this->dbRootlink instanceof \PDO) {
            if ($this->dbRootTran) {
                if ($failure) {
                    $this->dbRootlink->rollBack();
                    LoggerFactory::getLogger()->critical("Rolling back root");
                } else {
                    $this->dbRootlink->commit();
                }
            }
            $this->dbRootTran = false;
            $this->dbRootlink = NULL;
            $close = true;
        }
        if ($failure && $close) {
            throw new \ErrorException('connection/closeerror');
        }
    }

    /**
     * Conecta a base de datos
     * @param type $host
     * @param type $user
     * @param type $pass
     */
    private function new_link($host, $user, $pass) {
        if ($this->serverMotor == 'mysql') {
            $strCn = 'mysql:host=' . $host;
        } elseif ($this->serverMotor == 'mssql') {
            $strCn = 'odbc:' . GlobalConfig::getInstance()->getString('database/odbc');
        }
        try {
            $pdo = new \PDO($strCn, $user, \Encrypter::decrypt($pass));
            return $pdo;
        } catch (\Exception $e) {
            throw new ErrorException('connection/open', '',
                    \KLogger\Psr\Log\LogLevel::CRITICAL,
                    '',array($strCn,
                        $host, $user, $pass, $e->getMessage()));
        }
    }

    /**
     * Devuelve link solicitado
     * @param type $db connectionmanager::
     * @return boolean
     */
    public function beginTran($db) {
        if ($db == ConnectionManager::$INSTANCE &&
                $this->dbInstancelink &&
                $this->dbInstanceTran == false) {
            $this->dbInstanceTran = true;
            return $this->get_link($db)->beginTransaction();
        } elseif ($db == ConnectionManager::$ROOT &&
                $this->dbRootlink &&
                $this->dbRootTran == false) {
            $this->dbRootTran = true;
            return $this->get_link($db)->beginTransaction();
        }
        return 0;
    }

    /**
     * Devuelve link solicitado
     * @param type $db connectionmanager::
     * @return \PDO
     */
    public function get_link($db) {
        if ($db == ConnectionManager::$INSTANCE) {
            return $this->dbInstancelink;
        } elseif ($db == ConnectionManager::$ROOT) {
            return $this->dbRootlink;
        }
    }

    /**
     * Devuelve alias solicitado
     * @param type $db connectionmanager::
     * @return type
     */
    public function get_alias($db) {
        if ($db == ConnectionManager::$INSTANCE) {
            return $this->dbInstanceAlias;
        } elseif ($db == ConnectionManager::$ROOT) {
            return $this->dbRootAlias;
        }
    }

    /**
     * MSSQL/MYSQL
     * @return string
     */
    public function get_motor() {
        return $this->serverMotor;
    }

    /**
     * Contadores de sql
     * @param self::constan $dbType
     * @param float $time
     */
    public function addCounters($dbType, $time) {

        if ($dbType == self::$INSTANCE) {
            $this->sqlC_instance++;
            $this->sqlCT_instance+=$time;
        } else {
            $this->sqlC_root++;
            $this->sqlCT_root+=$time;
        }
    }

    /**
     * Tiempo empleado en consultas sql
     * @return float
     */
    public function getSqlElapsed() {
        return $this->sqlCT_instance + $this->sqlCT_root;
    }

    /**
     * Cantidad de consultas realizadas
     * @return int
     */
    public function getSqlCount() {
        return $this->sqlC_instance + $this->sqlC_root;
    }

}

?>
