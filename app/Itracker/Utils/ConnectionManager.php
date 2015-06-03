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
    public static $INSTANCE=2;
    
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
     * Conecta a base de datos
     * @param type $host
     * @param type $user
     * @param type $pass
     */
    private function new_link($host, $user, $pass) {
        if ($this->serverMotor == 'mysql') {
            return mysql_connect($host, $user, \Encrypter::decrypt($pass));
        } elseif ($this->serverMotor  == 'mssql') {
            return  new \PDO("odbc:".DBSERVER_ODBC,$user, \Encrypter::decrypt($pass)); 
        }
    }

    /**
     * Devuelve link solicitado
     * @param type $db connectionmanager::
     * @return type
     */
    public function get_link($db) {
        if($db==  ConnectionManager::$INSTANCE){
            return $this->dbInstancelink;
        }elseif($db==ConnectionManager::$ROOT){
            return $this->dbRootlink;
        }
    }

    /**
     * Devuelve alias solicitado
     * @param type $db connectionmanager::
     * @return type
     */
    public function get_alias($db) {
          if($db==ConnectionManager::$INSTANCE){
            return $this->dbInstanceAlias;
        }elseif($db==ConnectionManager::$ROOT){
            return $this->dbRootAlias;
        }      
    }

    /**
     * MSSQL/MYSQL
     * @return string
     */
    public function get_motor(){
        return $this->serverMotor;
    }

}
?>
