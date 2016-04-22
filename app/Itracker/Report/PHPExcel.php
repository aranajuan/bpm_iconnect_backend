<?php

namespace Itracker\Report;

require_once ROOT_DIR . '/app/PHPExcel/PHPExcel.php';

class PHPExcel extends ExcelAdapter {

    public function __construct($reportrequest) {
        parent::__construct($reportrequest);
        $this->excel = new \PHPExcel();
        $this->OFFSET=4;
        \PHPExcel_Settings::setLocale("es_AR");

        $this->excel->getProperties()->setCreator("Telecom Argentina S.A.")
                ->setLastModifiedBy("Telecom Argentina S.A.")
                ->setTitle("Reporte Itracker")
                ->setSubject("Reporte Itracker")
                ->setDescription("Reporte tickets en Itracker")
                ->setKeywords("reporte itracker")
                ->setCategory("reportes");
        $this->excel->setActiveSheetIndex(0);
    }

    
    /**
     * 
     * @param \PHPExcel_Worksheet $sheet
     * @param int $col
     * @param int $row
     * @param string $color
     */
    private function setBackground($sheet,$col,$row,$color){
        $sheet->getStyleByColumnAndRow($col, $row)->applyFromArray(
                    array(
                        'fill' => array(
                            'type' => \PHPExcel_Style_Fill::FILL_SOLID,
                            'color' => array('rgb' => $color)
                        )
                    )
            );
    }
    
    protected function setCellValue($col, $row, $data) {
        if (trim($data["value"]) == "" || $data["value"] == null)
            return;
        $sheet = $this->excel->getActiveSheet();
        $value = null;
        $format = \PHPExcel_Style_NumberFormat::FORMAT_GENERAL;
        switch ($data["type"]) {
            case "number":
                $format = \PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00;
                $value = $data["value"];
                break;
            case "integer":
                $format = \PHPExcel_Style_NumberFormat::FORMAT_NUMBER;
                $value = $data["value"];
                break;
            case "datetime":
                $date = STRdate_format($data["value"], USERDATE_READ, "datetime");
                if ($date != -1) {
                    $value = \PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $format = 'dd-mm-yyyy h:mm';
                } else {
                    $value = $data["value"];
                }
                break;
            case "date":
                $date = STRdate_format($data["value"], USERDATE_READ_DATE, "datetime");
                if ($date != -1) {
                    $value = \PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $format = 'dd-mm-yyyy';
                } else {
                    $value = $data["value"];
                }
                break;
            case "month":
                $date = STRdate_format("1-" . $data["value"], USERDATE_READ_DATE, "datetime");
                if ($date != -1) {
                    $value = \PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $format = 'mm-yyyy';
                } else {
                    $value = $data["value"];
                }
                break;
            default:
                $value = $data["value"];
        }
        $sheet->getStyleByColumnAndRow($col, $row)->getNumberFormat()->setFormatCode($format);
        if (isset($this->rewriteError[$col . "-" . $row])) {
            echo "Error, sobreescritura detectada $col $row $value";
            print_r($data);
            exit();
        }
        $sheet->setCellValueByColumnAndRow($col, $row, $value);
        $this->rewriteError[$col . "-" . $row] = true;
    }

    protected function addHeaders() {
        //PHPExcel_Shared_Font::setAutoSizeMethod(PHPExcel_Shared_Font::AUTOSIZE_METHOD_EXACT);
        $sheet = $this->excel->getActiveSheet();
        foreach ($this->mappedCols as $title => $pos) {
            $cell = $sheet->getCellByColumnAndRow($pos, $this->OFFSET-1);
            $cell->setValue($title);
            $this->setBackground($sheet, $pos, $this->OFFSET-1, 'FAFF74');
            $sheet->getColumnDimensionByColumn($pos)->setAutoSize(true);
        }
        $sheet->setCellValueByColumnAndRow(0, 2, "FECHA");
        $this->setBackground($sheet, 0, 2, '9999FF');
        $sheet->setCellValueByColumnAndRow(1, 2, date("d-m-Y"));
        $sheet->setCellValueByColumnAndRow(2, 2, "REPORTE");
        $this->setBackground($sheet, 2, 2, '9999FF');
        $sheet->mergeCellsByColumnAndRow(3, 2, 5, 2);
        $sheet->setCellValueByColumnAndRow(3, 2, $this->reportrequest->getTitle());

        $sheet->mergeCellsByColumnAndRow(0, 1, 5, 1);
        $sheet->setCellValueByColumnAndRow(0, 1, "ITRACKER - Coordinacion Productos y Servicios");
    }

    protected function saveTmp() {
        $objWriter = \PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');
        ob_start();
        $objWriter->save('php://output');
        $this->excelFile= ob_get_clean();
    }

}
