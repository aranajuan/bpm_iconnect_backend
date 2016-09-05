<?php
namespace Itracker\Services\Tkt;

use Itracker\ResponseElement;

require_once ROOT_DIR . DIRECTORY_SEPARATOR . 'app' . DIRECTORY_SEPARATOR . 'DomPdf'
        . DIRECTORY_SEPARATOR . 'dompdf_config.inc.php';

class Getpdf implements \Itracker\Services\ITServiceInterface {

    public static function GO($Context) {
        $idtkt = $Context->get_params("id");

        $html = '';

        $TKT = $Context->get_objcache()->get_object("Tkt", $idtkt);

        $opts = $TKT->get_tree_history();
        /* Prepara HTML de tipificacion */
        $html_tree = "<br/><b>Tipificacion:</b><br/><table>";
        foreach ($opts as $o) {
            $html_tree.="<tr><td><b>" . $o["question"] . "</b><td><td>" . $o["ans"] . "</td></tr>";
        }
        $html_tree.="</table>";

        $html.="<div class='master_TH' style='width:95%;margin:10px;padding:5px;border:solid 1px;'>";
        $html.="<div class='title_TH' style='font-weight: bold'>Itracker</div>";
        $html.="<table>";
        $html.="<tr><td>ID</td><td>" . $idtkt . "</td></tr>";
        $html.="<tr><td>Fecha exportacion</td><td>" . date(USERDATE_READ) . "</td></tr>";
        $html.="</table>";
        $html.="</div>";
        $html.="<div class='master_TH' style='width:95%;margin:10px;padding:5px;border:solid 1px;'>";
        $html.="Eventos del ticket<br/><i style='font-size:10px;'>Los archivos adjuntos deben descargarse desde la web</i>";
        $html.="</div>";
        $THALL = $TKT->get_tktHObj();
        $cvalid = 0;
        foreach ($THALL as $TH) {
            if ($TH) {
                $html.="<div class='master_TH' style='width:95%;margin:10px;padding:5px;'>";
                $html.="<div class='header_TH'>";
                $html.="<div class='title_TH' style='font-weight: bold;float:left;'>" . strtoupper($TH->get_prop('accion')->get_prop('alias')) . "</div>";
                $html.="<div class='date_TH' style='float:right;'>" . $TH->get_prop('fa') . "</div>";
                $html.="</div>";
                if ($TH->get_prop('accion')->get_prop('ejecuta') === "open") {
                    $html.="<div class='element'>";
                    $html.=$html_tree;
                    $html.="</div>";
                }
                $itf = $TH->get_prop('itform');
                if ($itf) {
                    $html.="<table>";
                    $itfV = $itf->getReportArr();
                    foreach ($itfV as $field) {
                        $html.="<tr>";
                        $html.="<td>" . $field['title'] . ":   </td><td>" . $field['valuetxt'] . "</td>";
                        $html.="</tr>";
                    }
                    $html.="</table>";
                }
                $html.="<br/>" . $TH->get_prop('objadj_txt');

                $cvalid++;
                $html.="</div><hr/>";
            }
        }
        $html.="<div class='master_TH' style='width:95%;margin:10px;padding:5px;border:solid 1px;'>";
        $html.="<b>Coordinacion productos y servicios</b><br/><i><a href='>https://itracker'>https://itracker</a>
        <br/><a href='>https://itracker.personal.com.ar'>https://itracker.personal.com.ar</a></i>";
        $html.="</div>";
        if ($cvalid == 0) {
        	throw new ItException('service/checkdata','Ticket invalido.#2');
        }

        $pdf = new \DOMPDF();
        $pdf->load_html($html);
        $pdf->render();
        $pdfDoc = $pdf->output();
        
        $rta = new ResponseElement('file',array(
        		new ResponseElement('name','Export id ' . $idtkt . '.pdf'),
        		new ResponseElement('data',$pdfDoc, ResponseElement::$FILE)
        ));
        
        return $rta;
    }

}