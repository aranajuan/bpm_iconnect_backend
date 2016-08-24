<?php
namespace Itracker\RequestHandlers;
use \Itracker\Exceptions\ErrorException;

class HandlerXML implements HandlerInterface{
	
	private $input;
	
	private $parsed;
	
	private $body;
	
	private $header;

	private $responses;
	
	public function addResponse($response, $path = null) {
		array_push($this->responses,array($response,$path));
	}

	public function getBody() {
		return $this->body;
	}

	public function getHeader() {
		return $this->header;
	}

	public function getRequest() {
		return $this->input['txt'];
	}

	public function getResponse() {
		
	}

	/**
	 * 
	 * @param Array $input {'txt'=>,'ipfront'=>}
	 */
	public function loadEnvironment($input) {
		//parseo
		$this->input=$input;
		try{
			$this->parsed = new \DOMDocument();
			$this->parsed->loadXML($input['txt']);
		}catch(  \Exception $e){
			throw new ErrorException('handler/format');
		}
		$xpath = new \DOMXpath($this->parsed);
		
		$hash = $xpath->query ( '/itracker/header/hash' );
		$pass = $xpath->query ( '/itracker/header/pass' );
		
		if($hash->length){
			$hash=$hash->item(0)->nodeValue;
		}else {
			$hash=null;
		}
		
		if($pass->length){
			$pass=$pass->item(0)->nodeValue;
		}else {
			$pass=null;
		}
		
		//header
		$this->header=new Header(
			$xpath->query ( '/itracker/header/front' )->item (0)->nodeValue,
			$input['ipfront'],
			$xpath->query ( '/itracker/header/instance' )->item (0)->nodeValue,
			$xpath->query ( '/itracker/header/usr' )->item (0)->nodeValue,
			$xpath->query ( '/itracker/header/ip' )->item (0)->nodeValue,
			$hash,
			$pass
			);
		$params = $xpath->query ( '/itracker/request/params' );
		$params_array=array();
		foreach($params as $p){
			$params_array[$p->nodeName]=$p->nodeValue;
		}
		$files = $xpath->query ( '/itracker/request/files' );
		$files_array=array();
		foreach($files as $p){
			$files_array[$p->nodeName]=$p->nodeValue;
		}
		
		$this->body = new Body(
			$xpath->query ( '/itracker/request/class' )->item (0)->nodeValue,
			$xpath->query ( '/itracker/request/method' )->item (0)->nodeValue,
			$params_array,
			$files_array
		);
	}	
	
}
