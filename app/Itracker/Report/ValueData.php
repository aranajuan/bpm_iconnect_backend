<?php
namespace Itracker\Report;

class ValueData {

    private $data;

    public function __construct($value) {
        $this->data = array();
        if (!is_array($value)) {
            $this->data[0]["title"] = "0";
            $this->data[0]["value"] = $value;
            $this->data[0]["type"] = "";
        } else {
            $nval = make_arrayobj($value);
            $i = 0;
            foreach ($nval as $val) {
                if (!is_array($val)) {
                    $this->data[$i]["value"] = $val;
                    $this->data[$i]["title"] = $i;
                    $this->data[$i]["type"] = "";
                } else {
                    if (!isset($val["title"])) {
                        $this->data[$i]["title"] = $i;
                    } else {
                        $this->data[$i]["title"] = $val["title"];
                    }
                    if (!isset($val["type"])) {
                        $this->data[$i]["type"] = "";
                    } else {
                        $this->data[$i]["type"] = $val["type"];
                    }
                    $this->data[$i]["value"] = $val["value"];
                }
                $i++;
            }
        }
    }

    public function getData() {
        return $this->data;
    }

    public function getCount() {
        return count($this->data);
    }

}

?>
