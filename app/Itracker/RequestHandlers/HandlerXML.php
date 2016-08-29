<?php

namespace Itracker\RequestHandlers;

use \Itracker\Exceptions\ErrorException;

class HandlerXML implements HandlerInterface {

	private $input;
	private $parsed;
	private $body;
	private $header;
	private $responses;

	public function addResponse($response, $path = null) {
		if ( $path == null ) {
			$path = '/';
		}
		array_push ( $this->responses, array ('res' => $response, 'path' => $path) );
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
		$doc = new \DOMDocument();
		$it = $doc->createElement('itracker');
		$res = $doc->createElement('response');
		$res->appendChild(
			$this->generateElement ( $doc, $this->responses[0]['res'] )
		);
		$it->appendChild($res);
		$doc->appendChild($it);
		return $doc->saveXML(null, LIBXML_NOEMPTYTAG);
	}

	/**
	 * Escapa caracteres especiales XML
	 * @param string $string
	 * @param boolean $CDATA
	 * @return string
	 */
	private function xmlEscape($string, $CDATA = false) {
		if ( $CDATA ) {
			str_replace ( "]]>", "&cdatag;", $string );
			return "<![CDATA[" . $string . "]]>";
		}
		return str_replace ( array ('&', '<', '>'), array ('&amp;', '&lt;', '&gt;'), $string );
	}

	/**
	 * Genera domelement de response
	 * @param \DOMDocument $doc
	 * @param \Itracker\ResponseElement $el
	 * @return \DOMElement 
	 */
	private function generateElement($doc, $el) {
		if ( $el->getType () == \Itracker\ResponseElement::$ARRAY ) {
			$lst = $doc->createElement ( $el->getTitle () );
			foreach ( $el->getValue () as $e ) {
				$lst->appendChild (
					$this->generateElement ( $doc, $e )
				);
			}
			return $lst;
		}

		if ( $el->getType () == \Itracker\ResponseElement::$FILE ) {
			return $doc->createElement ( $el->getTitle (), $el->getValue () );
		}

		if ( $el->getType () == \Itracker\ResponseElement::$XML ) {
			$domXML = new \DOMDocument();
			$domXML->loadXML ( $el->getValue () );
			return $doc->importNode ( $domXML );
		}

		return $doc->createElement($el->getTitle(),
			$this->xmlEscape ( $el->getValue ()) );
	}

	/**
	 * 
	 * @param Array $input {'txt'=>,'ipfront'=>,'date'=>}
	 */
	public function loadEnvironment($input) {
		//parseo
		$this->input = $input;
		try {
			$this->parsed = new \DOMDocument();
			$this->parsed->loadXML ( $input['txt'] );
		} catch ( \Exception $e ) {
			throw new ErrorException ( 'handler/format' );
		}
		$xpath = new \DOMXpath ( $this->parsed );

		$hash = $xpath->query ( '/itracker/header/hash' );
		$pass = $xpath->query ( '/itracker/header/pass' );

		if ( $hash->length ) {
			$hash = $hash->item ( 0 )->nodeValue;
		} else {
			$hash = null;
		}

		if ( $pass->length ) {
			$pass = $pass->item ( 0 )->nodeValue;
		} else {
			$pass = null;
		}

		//header
		$this->header = new Header (
			$xpath->query ( '/itracker/header/front' )->item ( 0 )->nodeValue, $input['ipfront'], $xpath->query ( '/itracker/header/instance' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/header/usr' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/header/ip' )->item ( 0 )->nodeValue, $hash, $pass, $input['date']
		);
		$params = $xpath->query ( '/itracker/request/params' );
		$params_array = array ();
		foreach ( $params as $p ) {
			$params_array[$p->nodeName] = $p->nodeValue;
		}
		$files = $xpath->query ( '/itracker/request/files' );
		$files_array = array ();
		foreach ( $files as $p ) {
			$files_array[$p->nodeName] = $p->nodeValue;
		}

		$this->body = new Body (
			$xpath->query ( '/itracker/request/class' )->item ( 0 )->nodeValue, $xpath->query ( '/itracker/request/method' )->item ( 0 )->nodeValue, $params_array, $files_array
		);
	}

}
