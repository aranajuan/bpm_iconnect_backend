<?php

namespace Itracker\Services\Tkt;

class Downloadfile implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $reqFile = $Context->get_params("file");
        $type = $Context->get_params("type");

        $fname = str_replace(array("/", "\\", ".."), "", $reqFile);

        if ($type === "adjunto") {
            //validate tkt view
            $fv = explode("_", $reqFile);
            $TH = $Context->get_objcache()->get_object("TktH", $fv[0]);
            if ($Context->get_objcache()->get_status("TktH", $fv[0]) != "ok") {
                return $Context->createElement("error", "Archivo invalido, acceso denegado 1.");
            }
            if (!$TH->candownload()) {
                return $Context->createElement("error", "Archivo invalido, acceso denegado 2.");
            }
            $filepath = $Context->get_Instance()->get_prop("archivos_externos") . "/adjuntos/" . $fname;
        } elseif ($type === "anexo") {
            $filepath = $Context->get_Instance()->get_prop("archivos_externos") . "/anexos/" . $fname;
        } else {
            return $Context->createElement("error", "Archivo invalido");
        }

        $im = file_get_contents($filepath);
        if (!$im) {
            return $Context->createElement("error", "Error al leer archivo.");
        }

        if (!$im) {
            return $Context->createElement("error", "Error al leer archivo.2.");
        }

        $arch = $Context->createElement("file");
        $arch->appendChild($Context->createElement("name", $fname));
        if ($TH) {
            $arch->appendChild($Context->createElement("idtkt", $TH->get_prop("idtkt")));
        }
        $arch->appendChild($Context->createElementSecure("data", $im));

        return $arch;
    }

}
