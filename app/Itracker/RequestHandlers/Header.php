<?php
namespace Itracker\RequestHandlers;

/**
 * Header de la solicitud
 * @author juan
 *
 */
class Header{
	
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
	 * Constructor
	 * @param String $front
	 * @param String $ipfront
	 * @param String $instance
	 * @param String $user
	 * @param String $ipuser
	 * @param String $hash
	 * @param String $pass
	 */
	public function __construct($front, $ipfront, $instance, $user, $ipuser, $hash, $pass) {
		$this->setFront($front);
		$this->setIpfront($ipfront);
		$this->setInstance($instance);
		$this->setUser($user);
		$this->setIpuser($ipuser);
		$this->setHash($hash);
		$this->setPass($pass);
	}
	
	/**
	 * front
	 * @return string
	 */
	public function getFront(){
		return $this->front;
	}

	/**
	 * front
	 * @param string $front
	 * @return Header{
	 */
	public function setFront($front){
		$this->front = $front;
		return $this;
	}

	/**
	 * ipfront
	 * @return string
	 */
	public function getIpfront(){
		return $this->ipfront;
	}

	/**
	 * ipfront
	 * @param string $ipfront
	 * @return Header{
	 */
	public function setIpfront($ipfront){
		$this->ipfront = $ipfront;
		return $this;
	}

	/**
	 * instance
	 * @return string
	 */
	public function getInstance(){
		return $this->instance;
	}

	/**
	 * instance
	 * @param string $instance
	 * @return Header{
	 */
	public function setInstance($instance){
		$this->instance = $instance;
		return $this;
	}

	/**
	 * user
	 * @return string
	 */
	public function getUser(){
		return $this->user;
	}

	/**
	 * user
	 * @param string $user
	 * @return Header{
	 */
	public function setUser($user){
		$this->user = $user;
		return $this;
	}

	/**
	 * ipuser
	 * @return string
	 */
	public function getIpuser(){
		return $this->ipuser;
	}

	/**
	 * ipuser
	 * @param string $ipuser
	 * @return Header{
	 */
	public function setIpuser($ipuser){
		$this->ipuser = $ipuser;
		return $this;
	}

	/**
	 * hash
	 * @return string
	 */
	public function getHash(){
		return $this->hash;
	}

	/**
	 * hash
	 * @param string $hash
	 * @return Header{
	 */
	public function setHash($hash){
		$this->hash = $hash;
		return $this;
	}

	/**
	 * pass
	 * @return string
	 */
	public function getPass(){
		return $this->pass;
	}

	/**
	 * pass
	 * @param string $pass
	 * @return Header{
	 */
	public function setPass($pass){
		$this->pass = $pass;
		return $this;
	}

}