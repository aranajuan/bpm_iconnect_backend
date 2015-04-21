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
        
        /*comparar con siguiente field para alternar*/
        if (isset($fields[$fieldPos + 1])) {
            if ($fields[$fieldPos]->compare($fields[$fieldPos + 1])) {
                $AlterNext = true;
            }
        }
        
        if ($valuePos > -1) { /* detecta recall */
            $this->writeValues($fields, $values, $fieldPos, $valuePos);
            if ($AlterNext) { /* si es similar */
                return $this->writeFields($fields, $values, $fieldPos + 1, $valuePos);
            } else {
                return $fieldPos + 1;
            }
        }
        $Ceven = $fields[$fieldPos]->getMax_cevents(); // cantidad de eventos para la columna

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

    /**
     * Escribe los valores en las celdas 
     * @param array<REPORTFIELD> $fields
     * @param array<REPORTVALUE> $values
     * @param int $fieldPos
     * @param int $EvePos
     */
    private function writeValues($fields, $values, $fieldPos, $EvePos) {
        $sheet = $this->excel->getActiveSheet();
        $value_ALLTKTS = $values[$fieldPos];
        $itkt=0;
        $evec = $fields[$fieldPos]->getMax_cevents();
        
        foreach($value_ALLTKTS as $valueTKT){
            $dataS_ALLEVE = $valueTKT->getValues(); //array de datas
            if(!isset($dataS_ALLEVE[$EvePos])) continue;
            $dataEve = $dataS_ALLEVE[$EvePos]->getData();
            foreach($dataEve as $dataEveProps){
                $alias = $this->getAlias($fields[$fieldPos]->getAlias(),
                        $evec, 
                        count($dataEve),
                        $EvePos,
                        $dataEveProps["title"]);
                $col = $this->getCol($alias);
                $sheet->setCellValueByColumnAndRow($col, $itkt + 2, $dataEveProps["value"]);
            } 
            $itkt++;
        }
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
    
    /**
     * Agrega titulos al excel
     */
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

    /**
     * Guarda archivo creado
     */
    private function saveTmp() {
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');
        $objWriter->save(str_replace('.php', '.xls', __FILE__));
    }

}
