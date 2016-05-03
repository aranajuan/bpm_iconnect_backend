<?php

namespace Itracker\Report;


abstract class ExcelAdapter {

    protected $OFFSET;

    protected $excel;

    /**
     *
     * @var Request 
     */
    protected $reportrequest;

    /**
     * Alias -> columnId
     * @var array<int> 
     */
    protected $mappedCols;

    protected $excelFile;
    
    protected $rewriteError;
    
    public function __construct($reportrequest) {
        $this->reportrequest = $reportrequest;
        $this->mappedCols = array();
        $this->rewriteError=array();

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
     * @param array<Field> $fields
     * @param array<Value> $values
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
     * @param Field $field
     * @param Value $value
     * @param int $fieldPos
     * @param int $EvePos
     */
    private function writeValue($field, $value, $EvePos) {
        $itkt = 0;
        $evec = $field->getMax_cevents();
        $subFieldc = $field->getMax_subfields();
        foreach ($value as $valueTKT) {
            $dataS_ALLEVE = $valueTKT->getValues(); //array de datas
            if (!isset($dataS_ALLEVE[$EvePos])) {
                $itkt++;
                continue;
            }
            $dataEve = $dataS_ALLEVE[$EvePos]->getData();
            foreach ($dataEve as $dataEveProps) {
                $itformAlias = $this->reportrequest->getitFormAlias($dataEveProps["title"]);
                if($itformAlias){
                    if(isset($itformAlias["alias"])){
                        $dataEveProps["title"]=$itformAlias["alias"];
                    }
                    if(isset($itformAlias["type"])){
                        $dataEveProps["type"]=$itformAlias["type"];
                    }
                }
                $alias = $this->getAlias($field->getAlias(), $evec, $subFieldc, $EvePos, $dataEveProps["title"]);
                $col = $this->getCol($alias);
                if ($field->getType()) {
                    $dataEveProps["type"] = $field->getType();
                }
                $this->setCellValue($col, $itkt + $this->OFFSET, $dataEveProps);
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
    protected abstract function setCellValue($col, $row, $data);

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
    protected abstract function addHeaders();


    /**
     * Carga el valor en la planilla excel
     * @param Field $field
     * @param Value $value
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
    protected abstract function saveTmp();
    
    public function getFile(){
        return $this->excelFile;
    }

}
