<?php

require_once 'reportrequest.php';

require_once 'classes/imports/PHPExcel/PHPExcel.php';

class REPORTEXCELADAPTER {

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
     *  Array con los datos formateados para el excel
     * @var array
     */
    private $formated;

    /**
     * Alias -> columnId
     * @var array<int> 
     */
    private $mappedCols;

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
        $this->formated = array();
    }

    public function loadExcel() {
        $fields = $this->reportrequest->getFields();
        $values = $this->reportrequest->getValues();
        $pos = 0;
        $max = count($fields);

        while ($pos < $max) {
            $pos = $this->writeFields($fields, $values, $pos, -1);
        }

        $this->addHeaders();
        $this->saveTmp();
    }

    private function writeFields($fields, $values, $fieldPos, $valuePos) {
        $AlterNext = false;
        if (isset($fields[$fieldPos + 1])) {
            if ($fields[$fieldPos]->compare($fields[$fieldPos + 1])) {
                $AlterNext = true;
            }
        }

        if ($valuePos > -1) {
            $this->writeValues($fields, $values, $fieldPos, $valuePos);
            if ($AlterNext) {
                return $this->writeFields($fields, $values, $fieldPos + 1, $valuePos);
            } else {
                return $fieldPos + 1;
            }
        }
        $Ceven = $fields[$fieldPos]->getMax(); // cantidad de eventos para la columna

        for ($i = 0; $i < $Ceven; $i++) {
            $this->writeValues($fields, $values, $fieldPos, $i);
            if ($AlterNext) {
                $sig = $this->writeFields($fields, $values, $fieldPos + 1, $i);
            }
        }

        if ($AlterNext) {
            return $sig;
        }
        return $fieldPos + 1;
    }

    private function writeValues($fields, $values, $fieldPos, $valuePos) {
        $sheet = $this->excel->getActiveSheet();
        $valueTKTS = $values[$fieldPos];
        $itkt=0;

        foreach($valueTKTS as $value){
            $data = $value->getValues(); //array de datas
            $dataEve = $data[$valuePos]->getData();
            foreach($dataEve as $elV){
                $alias = $this->getAlias($fields[$fieldPos]->getAlias(),
                        count($data), 
                        count($dataEve),
                        $valuePos,
                        $elV["title"]);
                $col = $this->getCol($alias);
                $sheet->setCellValueByColumnAndRow($col, $itkt + 2, $elV["value"]);
            } 
            $itkt++;
        }
    }

    private function getAlias($alias,$evec,$fieldc,$evepos,$fieldtitle){
        $retAlias = $alias;
        if($evec>1){
            $retAlias.=$evepos;
            if($fieldc>1){
                $retAlias.=".";
            }      
        }
        if($fieldc>1){
            $retAlias.=$fieldtitle;
        }
        return $retAlias;
    }
    

    private function addHeaders() {
        foreach ($this->mappedCols as $title => $pos) {
            $sheet = $this->excel->getActiveSheet();
            $sheet->setCellValueByColumnAndRow($pos, 1, $title);
        }
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

    private function saveTmp() {
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        $objWriter->save(str_replace('.php', '.xls', __FILE__));
    }

}
