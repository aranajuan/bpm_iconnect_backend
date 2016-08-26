<?php

namespace Itracker\Services\Tkt;
use \Itracker\Exceptions\ItException;
use Itracker\ResponseElement;

class Downloadfile implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $reqFile = $Context->get_params("file");
        $type = $Context->get_params("type");

        $fname = str_replace(array("/", "\\", ".."), "", $reqFile);

        if ($type === "adjunto") {
            //validate tkt view
            $fv = explode("_", $reqFile);
            $TH = $Context->get_objcache()->get_object("TktH", $fv[0]);

            if (!$TH->candownload()) {
                throw new ItException('th/getfile','Archivo invalido, acceso denegado 2.');
            }
            $filepath = $Context->getInstance()->get_prop("archivos_externos") . "/adjuntos/" . $fname;
        } elseif ($type === "anexo") {
            $filepath = $Context->getInstance()->get_prop("archivos_externos") . "/anexos/" . $fname;
        } else {
            throw new ItException('th/getfile','Archivo invalido');
        }

        $im = file_get_contents($filepath);
        if (!$im) {
            throw new ItException('th/getfile','Error al leer archivo.');
        }


        $rta = new ResponseElement('file');
        $rta->addValue(new ResponseElement('name', 
                $fname, ResponseElement::$TEXT));
        if ($TH) {
            $rta->addValue(new ResponseElement('idtkt', 
                $TH->get_prop("idtkt"), ResponseElement::$TEXT));
        }
        $rta->addValue(new ResponseElement('data',
                $im, ResponseElement::$FILE));

        return $rta;
        
    }

}
