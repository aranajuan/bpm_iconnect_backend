<?php

require_once 'reportrequest.php';

require_once 'classes/imports/PHPExcel/PHPExcel.php';

class REPORTEXCELADAPTER {

    private static $OFFSET=3;


    /**
     *
     * @var PHPExcel
     */
    private $excel;

    /**
     *
     * @var REPORTREQUEST 
     */
    private $reportrequest;

    /**
     * Alias -> columnId
     * @var array<int> 
     */
    private $mappedCols;

    private $excelFile;
    
    public function __construct($reportrequest) {
        $this->reportrequest = $reportrequest;
        $this->mappedCols = array();
        PHPExcel_Settings::setLocale("es_AR");

        $this->excel = new PHPExcel();

        $this->excel->getProperties()->setCreator("Telecom Argentina S.A.")
                ->setLastModifiedBy("Telecom Argentina S.A.")
                ->setTitle("Reporte Itracker")
                ->setSubject("Reporte Itracker")
                ->setDescription("Reporte tickets en Itracker")
                ->setKeywords("reporte itracker")
                ->setCategory("reportes");
        $this->excel->setActiveSheetIndex(0);
        
        $this->excelFile=null;
    }

    /**
     * Carga el excel con los datos del reporte
     */
    public function loadExcel() {
        $fields_all = $this->reportrequest->getFields();
        $values_all = $this->reportrequest->getValues();
        $pos_field = 0;
        $max_fields = count($fields_all);

        while ($pos_field < $max_fields) {
            $pos_field = $this->writeFields($fields_all, $values_all, $pos_field, -1);
        }

        $this->addHeaders();
        $this->saveTmp();
    }

    /**
     * Escribe columnas en cadena
     * @param array<REPORTFIELD> $fields
     * @param array<REPORTVALUE> $values
     * @param int $fieldPos
     * @param int $valuePos
     * @return int  fila siguiente
     */
    private function writeFields($fields, $values, $fieldPos, $valuePos) {
        $AlterNext = false;

        /* comparar con siguiente field para alternar */
        if (isset($fields[$fieldPos + 1])) {
            if ($fields[$fieldPos]->compare($fields[$fieldPos + 1])) {
                $AlterNext = true;
            }
        }
        $sig = $fieldPos + 1;
        if ($valuePos > -1) { /* detecta recall */
            $this->writeValue($fields[$fieldPos], $values[$fieldPos], $valuePos);
            if ($AlterNext) { /* si es similar */
                return $this->writeFields($fields, $values, $fieldPos + 1, $valuePos);
            } else {
                return $sig;
            }
        }
        $Ceven = $fields[$fieldPos]->getMax_cevents(); // cantidad de eventos para la columna

        for ($i = 0; $i < $Ceven; $i++) {
            $this->writeValue($fields[$fieldPos], $values[$fieldPos], $i);
            if ($AlterNext) {
                $sig = $this->writeFields($fields, $values, $fieldPos + 1, $i);
            }
        }

        return $sig;
    }

    /**
     * Escribe los valores en las celdas 
     * @param REPORTFIELD $field
     * @param REPORTVALUE $value
     * @param int $fieldPos
     * @param int $EvePos
     */
    private function writeValue($field, $value, $EvePos) {
        $itkt = 0;
        $evec = $field->getMax_cevents();

        foreach ($value as $valueTKT) {
            $dataS_ALLEVE = $valueTKT->getValues(); //array de datas
            if (!isset($dataS_ALLEVE[$EvePos])) {
                $itkt++;
                continue;
            }
            $dataEve = $dataS_ALLEVE[$EvePos]->getData();
            foreach ($dataEve as $dataEveProps) {
                $alias = $this->getAlias($field->getAlias(), $evec, count($dataEve), $EvePos, $dataEveProps["title"]);
                $col = $this->getCol($alias);
                if ($field->getType()) {
                    $dataEveProps["type"] = $field->getType();
                }
                $this->setCellValue($col, $itkt + self::$OFFSET+1, $dataEveProps);
            }
            $itkt++;
        }
    }

    /**
     * Carga valor en la celda y setea el tipo de dato
     * @param int $col
     * @param int $row
     * @param array $data
     */
    private function setCellValue($col, $row, $data) {
        if (trim($data["value"]) == "" || $data["value"] == null)
            return;
        $sheet = $this->excel->getActiveSheet();
        $value = null;
        switch ($data["type"]) {
            case "number":
                $sheet->getCellByColumnAndRow($col, $row)
                        ->getStyle()
                        ->getNumberFormat()
                        ->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_NUMBER_00);
                $value = $data["value"];
                break;
            case "integer":
                $sheet->getCellByColumnAndRow($col, $row)
                        ->getStyle()
                        ->getNumberFormat()
                        ->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_NUMBER);
                $value = $data["value"];
                break;
            case "datetime":
                $date = STRdate_format($data["value"], USERDATE_READ, "datetime");
                if ($date != -1) {
                    $value = PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $sheet->getStyleByColumnAndRow($col, $row)->getNumberFormat()
                            ->setFormatCode('dd-mm-yyyy h:mm');
                } else {
                    $value = $data["value"];
                }
                break;
            case "date":
                $date = STRdate_format($data["value"], USERDATE_READ_DATE, "datetime");
                if ($date != -1) {
                    $value = PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $sheet->getStyleByColumnAndRow($col, $row)->getNumberFormat()
                            ->setFormatCode('dd-mm-yyyy');
                } else {
                    $value = $data["value"];
                }
                break;
            case "month":
                $date = STRdate_format("1-" . $data["value"], USERDATE_READ_DATE, "datetime");
                if ($date != -1) {
                    $value = PHPExcel_Shared_Date::PHPToExcel(
                                    $date
                    );
                    $sheet->getStyleByColumnAndRow($col, $row)->getNumberFormat()
                            ->setFormatCode('mm-yyyy');
                } else {
                    $value = $data["value"];
                }
                break;
            default:
                $value = $data["value"];
        }
        $sheet->setCellValueByColumnAndRow($col, $row, $value);
    }

    /**
     * 
     * @param string $alias alias del campo
     * @param int $evec cantidad de eventos para el campo
     * @param int $fieldc   cantidad de campos
     * @param int $evepos   posicion del evento
     * @param string $fieldtitle    titulo del campo
     * @return type
     */
    private function getAlias($alias, $evec, $fieldc, $evepos, $fieldtitle) {
        $retAlias = $alias;
        if ($evec > 1) {
            $retAlias.=$evepos;
            if ($fieldc > 1) {
                $retAlias.=".";
            }
        }
        if ($fieldc > 1) {
            $retAlias.=$fieldtitle;
        }
        return strtoupper($retAlias);
    }

    /**
     * Agrega titulos al excel
     */
    private function addHeaders() {
        //PHPExcel_Shared_Font::setAutoSizeMethod(PHPExcel_Shared_Font::AUTOSIZE_METHOD_EXACT);
        $sheet = $this->excel->getActiveSheet();
        foreach ($this->mappedCols as $title => $pos) {
            $cell = $sheet->getCellByColumnAndRow($pos, self::$OFFSET);
            $cell->setValue($title);
            $this->setBackground($sheet, $pos, self::$OFFSET, 'FAFF74');
            $sheet->getColumnDimensionByColumn($pos)->setAutoSize(true);
        }
        $sheet->setCellValueByColumnAndRow(0, 2, "FECHA");
        $this->setBackground($sheet, 0, 2, '9999FF');
        $sheet->setCellValueByColumnAndRow(1, 2, date("d-m-Y"));     
        $sheet->setCellValueByColumnAndRow(2, 2, "REPORTE");
        $this->setBackground($sheet, 2, 2, '9999FF');
        $sheet->mergeCellsByColumnAndRow(3, 2, 5,2);
        $sheet->setCellValueByColumnAndRow(3, 2, 
                $this->reportrequest->getTitle());
        
       $sheet->mergeCellsByColumnAndRow(0, 1, 5, 1);
       $sheet->setCellValueByColumnAndRow(0, 1, "ITRACKER - Coordinacion Productos y Servicios");
        
    }

    /**
     * 
     * @param PHPExcel_Worksheet $sheet
     * @param int $col
     * @param int $row
     * @param string $color
     */
    private function setBackground($sheet,$col,$row,$color){
        $sheet->getStyleByColumnAndRow($col, $row)->applyFromArray(
                    array(
                        'fill' => array(
                            'type' => PHPExcel_Style_Fill::FILL_SOLID,
                            'color' => array('rgb' => $color)
                        )
                    )
            );
    }
    
    /**
     * Carga el valor en la planilla excel
     * @param REPORTFIELD $field
     * @param REPORTVALUE $value
     */
    private function getCol($id) {
        if (isset($this->mappedCols[$id])) {
            return $this->mappedCols[$id];
        } else {
            $npos = count($this->mappedCols);
            $this->mappedCols[$id] = $npos;
            return $npos;
        }
    }

    /**
     * Guarda archivo creado
     */
    private function saveTmp() {
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');
        ob_start();
        $objWriter->save('php://output');
        $this->excelFile= ob_get_clean();
    }
    
    public function getFile(){
        return $this->excelFile;
    }

}
