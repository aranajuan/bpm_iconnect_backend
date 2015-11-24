<?php
require_once ROOT_DIR.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.'DomPdf'
        .DIRECTORY_SEPARATOR.'dompdf_config.inc.php';
/**
 * Lista
 * @param Context $Context
 * @return null
 */
function GO($Context) {

    $idtkt = $Context->get_params("id");

    $html = '';

    $TKT = $Context->get_objcache()->get_object("Tkt", $idtkt);
    if ($Context->get_objcache()->get_status("Tkt", $idtkt) != "ok") {
        return $Context->createElement("error", "Ticket invalido.#1");
    }

    $opts = $TKT->get_tree_history();
    /* Prepara HTML de tipificacion */
    $html_tree = "<br/><b>Tipificacion:</b><br/><table>";
    foreach ($opts as $o) {
        $html_tree.="<tr><td><b>" . $o["question"] . "</b><td><td>" . $o["ans"] . "</td></tr>";
    }
    $html_tree.="</table>";

    $THALL = $TKT->get_tktHObj();
    $cvalid = 0;
    foreach ($THALL as $TH) {
        if ($TH) {
            $html.="<div class='master_TH' style='width:95%;margin:10px;padding:5px;'>";
            $html.="<div class='header_TH'>";
            $html.="<div class='title_TH' style='font-weight: bold'>" . strtoupper($TH->get_prop('accion')->get_prop('alias')) . "</div>";
            $html.="<div class='date_TH'>" . $TH->get_prop('fa') . "</div>";
            $html.="</div>";
            if ($TH->get_prop('accion')->get_prop('ejecuta') === "open") {
                $html.="<div class='element'>";
                $html.=$html_tree;
                $html.="</div>";
            }
            $itf = $TH->get_prop('itform');
            if($itf){
                $html.="<table>";
                $itfV = $itf->getReportArr();
                foreach($itfV as $field){
                    $html.="<tr>";
                    $html.="<td>".$field['title']."</td><td>".$field['valuetxt']."</td>";
                    $html.="</tr>";
                }
                $html.="</table>";
            }
            $html.="<br/>".$TH->get_prop('objadj_txt');
            
            $cvalid++;
            $html.="</div><hr/>";
        }
    }
    if ($cvalid == 0) {
        return $Context->createElement("error", "Ticket invalido.#2");
    }

    $pdf = new DOMPDF();
    $pdf->load_html($html);
    $pdf->render();
    $pdfDoc=$pdf->output();
    $arch = $Context->createElement("file");
    $arch->appendChild($Context->createElement("name",'Export id '.$idtkt.'.pdf'));
    $arch->appendChild($Context->createElementSecure("data",$pdfDoc));
    
    return $arch;
}