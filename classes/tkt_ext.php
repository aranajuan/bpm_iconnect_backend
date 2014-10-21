<?php

class TKT_EXT {

    private $recived;
    private $mapped;
    private $type;
    private $id;
    private $status="No cargado";
    
    public $gestiones = array(
        "SD" => array(
            "gestion" => "llamadas",
            "URL" => "https://bit.telecom.com.ar/sites/BIT/_layouts/Telecom.SharePoint.AutogestionIT/AutogestionAjaxService.asmx/BuscarLlamadasIncidentes"),
        "IM" => array(
            "gestion" => "incidentes",
            "URL" => "https://bit.telecom.com.ar/sites/BIT/_layouts/Telecom.SharePoint.AutogestionIT/AutogestionAjaxService.asmx/BuscarLlamadasIncidentes"),
        "RQ" => array(
            "gestion" => "requerimientos",
            "URL" => "https://bit.telecom.com.ar/sites/BIT/_layouts/Telecom.SharePoint.AutogestionIT/AutogestionAjaxService.asmx/BuscarRequerimientos"
        )
    );

    public function get_popup() {
        if($this->status!="ok")
            return $this->status;
        if ($this->type != "RQ") {
            $html = "
        <table>
            <tr>
                <td><b>" . $this->mapped["tipo"] . "</b></td>
                <td><b>" . $this->mapped["nro"] . "</b></td>
            </tr>
            <tr>
                <td><b>Grupo</b></td>
                <td>" . $this->mapped["grupo"] . "</td>
            </tr>
            <tr>
                <td><b>Estado</b></td>
                <td>" . $this->mapped["estado"] . " (";
            if (trim($this->mapped["FC"]) != "")
                $html.=$this->mapped["FC"];
            else
                $html.=$this->mapped["FA"];
            $html.=") </td>
            </tr>
            <tr>
                <td><b>Texto</b></td>
                <td>";
            if (trim($this->mapped["FC"]) != "")
                $html.=$this->mapped["texto_cierre"];
            else
                $html.=$this->mapped["texto_apertura"];
            $html.="</td>
            </tr>
        </table>
        ";
        }else {
            $html = "
        <table>
            <tr>
                <td><b>" . $this->mapped["tipo"] . "</b></td>
                <td><b>" . $this->mapped["nro"] . "</b></td>
            </tr>
            <tr>
                <td><b>Estado</b></td>
                <td>" . $this->mapped["estado"] . " (";
            if (trim($this->mapped["FC"]) != "")
                $html.=$this->mapped["FC"];
            else
                $html.=$this->mapped["FA"];
            $html.=") </td>
            </tr>
            <tr>
                <td><b>Fase</b></td>
                <td>" . $this->mapped["fase"] . "</td>
            </tr>
            <tr>
                <td><b>Texto</b></td>
                <td>";
            if (trim($this->mapped["FC"]) != "")
                $html.=$this->mapped["texto_cierre"];
            else
                $html.=$this->mapped["texto_apertura"];
            $html.="</td>
            </tr>
        </table>
        ";
        }

        return $html;
    }

    private function map() {
        
        if ($this->type != "RQ") {
            $tmp = array(
                "tipo" => $this->type,
                "nro" => $this->id,
                "grupo" => $this->recived[22],
                "estado" => $this->recived[7],
                "FA" => $this->recived[16],
                "FC" => $this->recived[13],
                "texto_apertura" => $this->recived[5],
                "texto_cierre" => $this->recived[12],
            );
        } else {
            $tmp = array(
                "tipo" => $this->type,
                "nro" => $this->id,
                "estado" => $this->recived[2],
                "fase" => $this->recived[3],
                "FA" => $this->recived[14],
                "FC" => $this->recived[9],
                "texto_apertura" => $this->recived[18] . "<br />" . $this->recived[19],
                "texto_cierre" => $this->recived[10],
            );
        }
        $this->mapped=$tmp;
    }

    function load($type,$id) {         
        $type = strtoupper($type);
        $gestion = $this->gestiones[$type]["gestion"];
        $this->type=$type;
        $this->id=$id;
        $this->recived=NULL;
        $this->mapped=NULL;
        $this->status="No cargado";
        $data = array(
            "url" => 'https://bit.telecom.com.ar/sites/BIT/',
            "gestion" => $gestion,
            "nroTicket" => $id,
            "fechaDesde" => "",
            "fechaHasta" => "",
            "departamento" => "",
            "estado" => "todas",
            "creadoPor" => "",
            "creadoPara" => ""
        );


        $authToken = 'OAuth 2.0';

        $context = stream_context_create(array(
            'http' => array(
                'method' => 'POST',
                'header' => "Authorization: {$authToken}\r\n" .
                "Content-Type: application/json\r\n",
                'content' => json_encode(
                        $data
                )
            )
                ));


        $response = file_get_contents($this->gestiones[$type]["URL"], FALSE, $context);


        if ($response === FALSE) {
            $this->recived=NULL;
            $this->status="Error";
        }

        $responseData = json_decode($response, TRUE);
        if (count($responseData["aaData"]) == 0) {
            $this->recived=NULL;
            $this->status="El servidor no esta respondiendo, por favor intente mas tarde.";
        }else{
            $this->recived=$responseData["aaData"][0];
            $this->status="ok";
            $this->map();
        }
    }

    function update() {
        $this->load($this->type, $this->id);
    }

    function get_prop($prop){
        return $this->mapped[$prop];
        
    }
    
    function get_status(){
        return $this->status;
    }
    
}

?>
