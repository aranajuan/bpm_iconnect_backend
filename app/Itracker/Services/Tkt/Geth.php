<?php

namespace Itracker\Services\Tkt;
use Itracker\ResponseElement;
use Itracker\Exceptions\ItFunctionalException;

class Geth implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $idtkt = $Context->get_params("id");
        $hideUpdate = $Context->get_params('hideupdate');
        if ($hideUpdate != 'false') {
            $hideUpdate = true;
        } else {
            $hideUpdate = false;
        }
        $TKT = $Context->get_objcache()->get_object("Tkt", $idtkt);
        
        $response = new \DOMDocument();
        $responseData = $response->createElement("data");
		$rta = new ResponseElement('data');
		$rta->addValue(new ResponseElement('idmaster'),$TKT->get_prop('idmaster'));
		$rta->addValue(new ResponseElement('largestatus'),$TKT->get_LargeStatus());
        $rta->addValue(
                $TKT->get_prop('usr_o')->getData(array('usr', 'nombre', 'mail'))
        );
        $opts = $TKT->get_tree_history();
        $rta_tree = new ResponseElement('tree');
        foreach ($opts as $o) {
        	$rta_tree_option = new ResponseElement('option',array(
        			new ResponseElement('question',$o['question']),
        			new ResponseElement('ans',$o['ans']),
        	));
            $rta_tree->addValue($rta_tree_option);
        }
        $rta->addValue($rta_tree);

        $rta_moves = new ResponseElement('ths');
        $THALL = $TKT->get_tktHObj();
        $cvalid = 0;
        $hasupdate = false;
        foreach ($THALL as $TH) {
            if ($hideUpdate) {
                if ($TH->isUpdate()) {
                    if (!$hasupdate) {
                    	$rta->addValue(new ResponseElement('hasupdate','true'));
                        $hasupdate = true;
                    }
                    continue;
                }
                $NTH = $TH->getThUpdate();
                while ($NTH) {
                    $TH = $NTH;
                    $NTH = $NTH->getThUpdate();
                }
            }
            $el = $TH->getData_H();
            if ($el instanceof ResponseElement) {
                $rta_moves->addValue($el);
                $cvalid++;
            }
        }

        if ($cvalid == 0) {
        	throw new ItFunctionalException('service/checkdata','Ticket invalido.#2');
        }
		$rta->addValue($rta_moves);
		$rta_actions = new ResponseElement('actions');

        $AL = $TKT->valid_actions();
        foreach ($AL as $A) {
        	$rta_actions->addValue($A->getData(array('alias','nombre','formulario')));
        }
        $rta->addValue($rta_actions);
        return $rta;
    }

}
