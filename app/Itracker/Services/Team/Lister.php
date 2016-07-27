<?php

namespace Itracker\Services\Team;
use Itracker\ResponseElement;

class Lister implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
    $ALL = new \Itracker\Team();
     $ALL_v = $ALL->list_all();
        $rta = new ResponseElement('list');
        if ($ALL_v) {
            foreach ($ALL_v as $l){
                $rta->addValue($l->getData(
                        array("id","nombre","t_conformidad","iddireccion",
                            "idsequiposderiva","idsequiposvisible",
                            "idsequiposreporta","idsadms","staffhome_vista",
                            "mytkts_vista","idlistin","direccionname")));
            }
        }
        return $rta;
}
}