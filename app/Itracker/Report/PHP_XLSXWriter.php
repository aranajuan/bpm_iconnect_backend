<?php

namespace Itracker\Report;

require_once ROOT_DIR . '/app/PHP_XLSXWriter/xlsxwriter.class.php';

class PHP_XLSXWriter extends ExcelAdapter {

    private $headers;
    private $tmpHeader;
    private $tmpHeader_types;
    private $data;

    public function __construct($reportrequest) {
        parent::__construct($reportrequest);
        $this->excel = new \XLSXWriter();
        $this->OFFSET = 0;
        $this->tmpHeader = array();
        $this->tmpHeader_types = array();
        $this->excel->setAuthor('Telecom Argentina S.A.');
    }

    protected function addHeaders() {
        foreach ($this->mappedCols as $title => $pos) {
            $this->tmpHeader[$pos] = $title;
        }
    }

    protected function saveTmp() {
        $this->headers = array();
        for ($i = 0; $i < count($this->tmpHeader); $i++) {
            $this->headers[$this->tmpHeader[$i]] = $this->tmpHeader_types[$i];
            for ($j = 0; $j < count($this->data); $j++) {
                if (!isset($this->data[$j][$i])) {
                    $this->data[$j][$i] = "";
                }
            }
        }

        /*
          echo "<pre>";
          print_r($this->headers);
          echo "</pre>";

          echo "<pre>";
          print_r($this->data);
          echo "</pre>";
          exit();
         * */

        $this->excel->writeSheet($this->data, 'Datos', $this->headers);
        ob_start();
        $this->excel->writeToStdOut();
        $this->excelFile = ob_get_clean();
    }

    protected function setCellValue($col, $row, $data) {
        if (trim($data["value"]) == "" || $data["value"] == null) {
            return;
        }
        if (!is_array($this->data[$row])) {
            $this->data[$row] = array();
        }
        if ($col > count($this->data[$row])) {
            for ($j = count($this->data[$row]); $j < $col; $j++) {
                $this->data[$row][$j] = "";
            }
        }
        $this->data[$row][$col] =  $data["value"];
        switch ($data["type"]) {
            case "number":
                $this->tmpHeader_types[$col] = '0.00';
                break;
            case "integer":
                $this->tmpHeader_types[$col] = '0';
                break;
            case "datetime":
                $this->data[$row][$col] = STRdate_format($this->data[$row][$col], USERDATE_READ, 'Y-m-d H:i:s'
                );
                $this->tmpHeader_types[$col] = 'DD-MM-YYYY HH:MM';
                break;
            case "date":
                $this->data[$row][$col] = STRdate_format($this->data[$row][$col], USERDATE_READ_DATE, 'Y-m-d H:i:s'
                );
                $this->tmpHeader_types[$col] = 'DD-MM-YYYY';
                break;
            case "month":
                $this->data[$row][$col] = STRdate_format('1-' . $this->data[$row][$col], USERDATE_READ_DATE, 'Y-m-d H:i:s'
                );
                $this->tmpHeader_types[$col] = 'MM-YYYY';
                break;
            default:
                if (!isset($this->tmpHeader_types[$col])) {
                    $this->tmpHeader_types[$col] = 'string';
                }
        }
    }

}
