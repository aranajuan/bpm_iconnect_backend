<?php

namespace Itracker\RequestHandlers;

use \Itracker\Exceptions\ItErrorException;

/**
 * Header de la solicitud
 * @author juan
 *
 */
class Header {

	/**
	 * Regex ip valida
	 * @var String
	 */
	private static $IPREGEX =
		'/^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$/';

	/**
	 * Ips validas
	 * @var array
	 */
	private static $IPVALIDS = array ('::1');

	/**
	 * Hash valido
	 * @var String
	 */
	private static $HASHREGEX  = '/([a-fA-F\\d]{40})/';

	/**
	 *
	 * @var String
	 */
	private $front;

	/**
	 *
	 * @var String
	 */
	private $ipfront;

	/**
	 *
	 * @var String
	 */
	private $instance;

	/**
	 *
	 * @var String
	 */
	private $user;

	/**
	 *
	 * @var String
	 */
	private $ipuser;

	/**
	 *
	 * @var String
	 */
	private $hash;

	/**
	 *
	 * @var String
	 */
	private $pass;

	/**
	 *
	 * @var Boolean
	 */
	private $logout;


	/**
	 * Fecha inicio solicitud
	 */
	private $request_time;

	/**
	 * Constructor
	 * @param String $front
	 * @param String $ipfront
	 * @param String $instance
	 * @param String $user
	 * @param String $ipuser
	 * @param String $hash
	 * @param String $pass
	 */
	public function __construct($front, $ipfront, $instance, $user, $ipuser, $hash, $pass, $logout, $request_time) {
		$this->setFront ( $front );
		$this->setIpfront ( $ipfront );
		$this->setInstance ( $instance );
		$this->setUser ( $user );
		$this->setIpuser ( $ipuser );
		$this->setHash ( $hash );
		$this->setPass ( $pass );
		$this->setLogout( $logout );
		$this->setRequestTime($request_time);
	}

	public function setRequestTime($request_time){
		$date = date(USERDATE_READ.':s', $request_time);
		if($date == null || $date == ''){
			throw new ItErrorException ( 'handler/invalid', 'Fecha solicitud invalido' );
		}
		$this->request_time = $date;
	}

	public function getRequestTime(){
		return $this->request_time;
	}

	/**
	 * front
	 * @return string
	 */
	public function getFront() {
		return $this->front;
	}

	/**
	 * front
	 * @param string $front
	 * @return Header{
	 */
	public function setFront($front) {
		if ( !preg_match ( '/\\s*\\w+\\s*/', $front ) ) {
			throw new ItErrorException ( 'handler/invalid', 'Front invalido' );
		}
		$this->front = trim ( $front );
	}

	/**
	 * ipfront
	 * @return string
	 */
	public function getIpfront() {
		return $this->ipfront;
	}

	/**
	 * ipfront
	 * @param string $ipfront
	 * @return Header{
	 */
	public function setIpfront($ipfront) {
		$ipfront = trim ( $ipfront );
		if ( !preg_match ( self::$IPREGEX, $ipfront ) && !in_array ( $ipfront, self::$IPVALIDS ) ) {
			throw new ItErrorException ( 'handler/invalid', 'Front invalido' );
		}
		$this->ipfront = $ipfront;
	}

	/**
	 * instance
	 * @return string
	 */
	public function getInstance() {
		return $this->instance;
	}

	/**
	 * instance
	 * @param string $instance
	 * @return Header{
	 */
	public function setInstance($instance) {
		if ( !preg_match ( '/\\s*\\w+\\s*/', $instance ) ) {
			throw new ItErrorException ( 'handler/invalid', 'Instancia invalido' );
		}
		$this->instance = trim($instance);
	}

	/**
	 * user
	 * @return string
	 */
	public function getUser() {
		return $this->user;
	}

	/**
	 * user
	 * @param string $user
	 * @return Header{
	 */
	public function setUser($user) {
		if ( !preg_match ( '/\\s*\\w+\\s*/', $user ) ) {
			throw new ItErrorException ( 'handler/invalid', 'Usuario invalido' );
		}
		$this->user = trim($user);
	}

	/**
	 * ipuser
	 * @return string
	 */
	public function getIpuser() {
		return $this->ipuser;
	}

	/**
	 * ipuser
	 * @param string $ipuser
	 * @return Header{
	 */
	public function setIpuser($ipuser) {
		if ( !preg_match ( self::$IPREGEX, $ipuser )) {
			throw new ItErrorException ( 'handler/invalid', 'Ip usuario invalida ' );
		}
		$this->ipuser = $ipuser;
	}

	/**
	 * hash
	 * @return string
	 */
	public function getHash() {
		return $this->hash;
	}

	/**
	 * hash
	 * @param string $hash
	 * @return Header{
	 */
	public function setHash($hash) {
		$this->hash = $hash;
	}

	/**
	 * pass
	 * @return string
	 */
	public function getPass() {
		return $this->pass;
	}

	/**
	 * pass
	 * @param string $pass
	 */
	public function setPass($pass) {
		$this->pass = $pass;
	}

	/**
	 * Logout despues de cumplir request
	 * @return Boolean
	 */
	public function getLogout() {
		return $this->logout;
	}

	/**
	 * pass
	 * @param Boolean $logout
	 */
	public function setLogout($logout) {
		$this->logout = 1 && $logout;
	}


}
