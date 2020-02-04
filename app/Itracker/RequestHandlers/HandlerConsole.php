<?php

namespace Itracker\RequestHandlers;

use \Itracker\Exceptions\ItErrorException;
use Itracker\ResponseElement;

class HandlerConsole extends HandlerXML{

  /**
   *
   * @param Array $input
   *        	{'fields'=>,'date'=>}
   */
  public function loadEnvironment($input) {
    // parseo
    $this->input = $input;
  }

  public function getRequest() {
		return print_r($this->input ['fields'],true);
	}

  private function addData($param,$value,&$header,&$body){
    $HEADERPARAMS = array('usr','instance','hash','pass','logout');

    $BODYPARAMS = array('class','method','file');
    if(in_array($param,$HEADERPARAMS)){
      $header[$param] = $value;
      return;
    }

    if(in_array($param,$BODYPARAMS)){
      if($param == 'file'){
        if(!is_array($body['files'])){ $body['files'] == array(); }
        $fp = file_get_contents($value);
        if(!$fp){
            throw new ItErrorException ( 'handler/format', 'Adjunto invalido' );
        }
        $body['files'][$value]=base64_encode($fp);
        return;
      }
      $body[$param] = $value;
      return;
    }

    $paramV = explode('.',$param);
    if($paramV[0] == 'param'){
        if(!is_array($body['params'])){ $body['params'] == array(); }
        $body['params'][$paramV[1]]=$value;
        return;
    }
    throw new ItErrorException ( 'handler/format', 'Parametros invalidos' );
  }

  public function initialize() {

    $used = 0;
    $headerData= array();
    $bodyData = array();
    for($i = 1;$i<count($this->input['fields']);$i++){
        if(substr($this->input['fields'][$i],0,1) == '-' ){
            $this->addData(
              substr($this->input['fields'][$i],1),
              $this->input['fields'][++$i],
              $headerData,
              $bodyData
            );
        }else{
          throw new ItErrorException ( 'handler/format', 'Lista de parametros invalida',array('index'=>$i) );
        }
    }
    $this->header = new Header(
      'CONSOLE',
      'console',
      $headerData['instance'],
      $headerData['usr'],
      'console',
      $headerData['hash'],
      $headerData['pass'],
      $headerData['logout'],
      $this->input ['date']
    );

    $this->body = new Body(
      $bodyData['class'],
      $bodyData['method'],
      $bodyData['params'],
      $bodyData['files']
    );

  }

}
