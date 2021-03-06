<?php

namespace Itracker\RequestHandlers;

use \Itracker\Exceptions\ItErrorException;
use Itracker\ResponseElement;

class HandlerXML implements HandlerInterface {

	protected $input;
	private $parsed;
	protected $body;
	protected $header;
	protected $responses;

	public function addResponse($response, $path = null) {
		if ($path == null) {
			$path = 'response';
		}
		if(!isset($this->responses[$path])){
			$this->responses[$path]=array();
		}

		array_push ( $this->responses[$path], $response );
	}
	public function getBody() {
		return $this->body;
	}
	public function getHeader() {
		return $this->header;
	}
	public function getRequest() {
		return $this->input ['txt'];
	}
	public function getResponse() {
		$doc = new \DOMDocument ( '1.0', 'utf-8' );
		$it = $doc->createElement ( 'itracker' );
		if(isset($this->responses['header'])){
			$hd = $doc->createElement ( 'header' );
			foreach($this->responses['header'] as $he){
						if($he instanceof ResponseItemInterface){
							$hd->appendChild ( $this->generateElement ( $doc, $he ) );
						}
			}
			$it->appendChild ( $hd );
		}
		$res = $doc->createElement ( 'response' );
		if (isset ( $this->responses['response'] ) && $this->responses['response'][0] instanceof ResponseItemInterface) {
			$res->appendChild ( $this->generateElement ( $doc, $this->responses['response'][0] ) );
		}
		$it->appendChild ( $res );
		$doc->appendChild ( $it );
		return $doc->saveXML ( null, LIBXML_NOEMPTYTAG );
	}

	/**
	 * Genera domelement de response
	 *
	 * @param \DOMDocument $doc
	 * @param \Itracker\ResponseElement $el
	 * @return \DOMElement
	 */
	private function generateElement($doc, $el) {
		if ($el->getType () == \Itracker\ResponseElement::ARRAYL) {
			$lst = $doc->createElement ( $el->getTitle () );
			foreach ( $el->getValue () as $e ) {
				$lst->appendChild ( $this->generateElement ( $doc, $e ) );
			}
			return $lst;
		}

		if ($el->getType () == \Itracker\ResponseElement::FILE) {
			return $doc->createElement ( $el->getTitle (),
				base64_encode($el->getValue ()) );
		}

		if ($el->getType () == \Itracker\ResponseElement::XML) {
			$node = $doc->importNode ( $el->getValue ()->documentElement, true );

			if ($el->getTitle () == '') {
				return $node;
			}
			$nodeH = $doc->createElement ( $el->getTitle () );
			$nodeH->appendChild ( $node );
			return $nodeH;
		}
		return $doc->createElement ( $el->getTitle (), htmlspecialchars ( $el->getValue (), ENT_QUOTES | ENT_XML1 ) );
	}

	/**
	 *
	 * @param Array $input
	 *        	{'txt'=>,'ipfront'=>,'date'=>}
	 */
	public function loadEnvironment($input) {
		// parseo
		$this->input = $input;
	}


	public function initialize() {
		try {
			$this->parsed = new \DOMDocument ();
			$this->parsed->loadXML ( $this->input ['txt'] );
		} catch ( \Exception $e ) {
			throw new ItErrorException ( 'handler/format' );
		}
		$xpath = new \DOMXpath ( $this->parsed );

		$hash = $xpath->query ( '/itracker/header/hash' );
		$pass = $xpath->query ( '/itracker/header/pass' );
		$logout = $xpath->query ( '/itracker/header/logout' );

		if ($hash->length) {
			$hash = $hash->item ( 0 )->nodeValue;
		} else {
			$hash = null;
		}

		if ($pass->length) {
			$pass = $pass->item ( 0 )->nodeValue;
		} else {
			$pass = null;
		}

		if ($logout->length) {
			$logout = $logout->item ( 0 )->nodeValue;
		} else {
			$logout = null;
		}

		// header
		$this->header = new Header ( $xpath->query ( '/itracker/header/front' )->item ( 0 )->nodeValue, $this->input ['ipfront'], $xpath->query ( '/itracker/header/instance' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/header/usr' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/header/ip' )->item ( 0 )->nodeValue, $hash, $pass, $logout,$this->input ['date'] );
		$params = $xpath->query ( '/itracker/request/params/*' );
		$params_array = array ();
		foreach ( $params as $p ) {
			$params_array [$p->nodeName] = $p->nodeValue;
		}
		$files = $xpath->query ( '/itracker/request/files/*' );
		$files_array = array ();
		foreach ( $files as $p ) {
			$files_array [$p->nodeName] = $p->nodeValue;
		}

		$this->body = new Body ( $xpath->query ( '/itracker/request/class' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/request/method' )->item ( 0 )->nodeValue, $params_array, $files_array );
	}
}
