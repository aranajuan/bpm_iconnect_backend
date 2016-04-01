<?php

namespace Itracker\Utils;

class ConnectionManager {

    private $dbRootlink; //recurso a db root
    private $dbInstancelink; // recurso a db instancia
    private $dbRootAlias;
    private $dbInstanceAlias;
    private $serverMotor;
    private $status;
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
        $this->sqlCT_root=0;
        $this->sqlC_root=0;
        $this->sqlCT_instance=0;
        $this->sqlC_instance=0;
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
        $lnk = $this->new_link($host, $user, $pass);
        if ($lnk) {
            $this->dbRootlink = $lnk;
            $this->status = "root_ok";
            return true;
        } else {
            $this->dbRootlink = null;
            $this->status = "root_error";
            return false;
        }
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
        if ($this->status != "root_ok")
            return false;
        $this->dbInstanceAlias = $dbAlias;
        $lnk = $this->new_link($host, $user, $pass);
        if ($lnk) {
            $this->dbInstancelink = $lnk;
            $this->status = "ok";
            return true;
        } else {
            $this->dbInstancelink = null;
            $this->status = "instance_error";
            return false;
        }
    }

    /**
     * Cierra conecciones y realiza commits
     * @param boolean $failure
     */
    public function close_connections($failure=false){
        if($this->dbInstancelink instanceof \PDO){
            if($failure){
                $this->dbInstancelink->rollBack();
            }else{
                $this->dbInstancelink->commit();
            }
            $this->dbInstancelink=NULL;
        }
        if($this->dbRootlink instanceof \PDO){
            if($failure){
                $this->dbRootlink->rollBack();
            }else{
                $this->dbRootlink->commit();
            }
            $this->dbRootlink=NULL;
        }
        if($failure){
            echo 'Ocurrio un error inesperado, reintente la operacion.';
            exit();
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
            $strCn='mysql:host='.$host;
        } elseif ($this->serverMotor == 'mssql') {
            $strCn='odbc:' .GlobalConfig::getInstance()->getString('database/odbc');
        }
        try {
            $pdo = new \PDO($strCn, $user, \Encrypter::decrypt($pass));
            if(!$pdo->beginTransaction()){
                echo 'No se puede iniciar transaccion';
                exit();
            }
            return $pdo;
        } catch (\Exception $e) {
            LoggerFactory::getLogger()
                    ->critical("Imposible conectar a DB", array($strCn,
                        $host, $user, $pass,$e->getMessage()));
            return null;
        }       
    }

    /**
     * Devuelve link solicitado
     * @param type $db connectionmanager::
     * @return type
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
    public function addCounters($dbType,$time){
        
        if($dbType==self::$INSTANCE){
            $this->sqlC_instance++;
            $this->sqlCT_instance+=$time;
        }else{
            $this->sqlC_root++;
            $this->sqlCT_root+=$time;
        }
        
    }
 
    /**
     * Tiempo empleado en consultas sql
     * @return float
     */
    public function getSqlElapsed(){
        return $this->sqlCT_instance+$this->sqlCT_root;
    }
    
    /**
     * Cantidad de consultas realizadas
     * @return int
     */
    public function getSqlCount(){
        return $this->sqlC_instance+$this->sqlC_root;
    }
    
}

?>
