<?php

/**
 * Si no es una array lo convierte
 * @param type $arr
 */
function make_arrayobj($arr) {
    if (!isset($arr[0]) || !is_array($arr)) {
        $tmp = $arr;
        $arr = array();
        $arr[0] = $tmp;
    }
    return $arr;
}

/**
 * Une XML
 * @param SimpleXMLElement $simplexml_to
 * @param SimpleXMLElement $simplexml_from
 */
function append_simplexml(&$simplexml_to, &$simplexml_from) {
    foreach ($simplexml_from->children() as $simplexml_child) {
        $simplexml_temp = $simplexml_to->addChild($simplexml_child->getName(), (string) $simplexml_child);
        foreach ($simplexml_child->attributes() as $attr_key => $attr_value) {
            $simplexml_temp->addAttribute($attr_key, $attr_value);
        }

        append_simplexml($simplexml_temp, $simplexml_child);
    }
}

/**
 * Busca objeto en array
 * @param itobject $obj
 * @param array<itobject> $array
 * @param string $field campo a comparar
 * @param boolean $objcompare Si es true compara objetos sino obj es tomado como la propiedad
 */
function objinarray($obj, $array, $field = "id", $objcompare = true) {
    foreach ($array as $o) {
        if ($objcompare) {
            if ($o->get_prop($field) === $obj->get_prop($field) && get_class($o) === get_class($obj)) {
                return true;
            }
        } else {
            if ($o != null) {
                if ($o->get_prop($field) === $obj) {
                    return true;
                }
            }
        }
    }
    return false;
}

/**
 * Devuelve el array si no es null
 * @param string $str
 * @param string $spliter
 * @return null/array
 */
function arrayornull($spliter, $str) {
    if ($str != "" && $str) {
        return explode($spliter, $str);
    }
    return null;
}

/**
 * Busca recursivamente en un array
 */
function array_get_key_val($value, $heystack) {
    if (is_array($heystack)) {
        foreach ($heystack as $k => $v) {
            if ($v == $value) {
                return $k;
            } elseif (is_array($v)) {
                return array_get_key_val($value, $v);
            }
        }
        return -1;
    }
    return -1;
}

/**
 * Dar formato a fecha
 * $str string d-m-Y H:i
 * return Y-m-d H:i
 */
function STRdate_format($str, $origin = USERDATE_READ, $format = DBDATE_WRITE) {
    if (trim($str) == "") {
        return -1;
    }
    try {
        $date = DateTime::createFromFormat($origin, $str);
        if ($date) {
            return $date->format($format);
        }
        return -1;
    } catch (Exception $e) {
        return -1;
    }
}

/**
 * fechas en formato usuario
 * devuelve minutos
 */
function DiffBetweenDates($fechaI, $fechaF) {
    if ($fechaF == "NOW")
        $fechaF = date(USERDATE_READ);
    if ($fechaI == "NOW")
        $fechaI = date(USERDATE_READ);
    $seg_dif = strtotime(STRdate_format($fechaF, USERDATE_READ, "Y-m-d H:i")) - strtotime(STRdate_format($fechaI, USERDATE_READ, "Y-m-d H:i"));
    return round($seg_dif / 60, 0, PHP_ROUND_HALF_DOWN);
}

/**
 * convierte HH:MM a MM
 */
function HsToMin($hs) {
    $time = explode(":", $hs);
    if (!is_numeric($time[0]) || !is_numeric($time[1]))
        return -1;
    return ($time[0] * 60) + $time[1];
}

/**
 * elimina todos los espacios del texto (en cualquier lugar)
 */
function space_delete($str) {

    $rta = str_replace(" ", "", $str);
    $rta = str_replace("\t", "", $rta);
    $rta = str_replace("\n", "", $rta);
    $rta = str_replace("\0", "", $rta);
    $rta = str_replace("\x0B", "", $rta);

    return $rta;
}

/**
 * Escapa caracteres especiales XML
 * @param string $string
 * @param boolean $CDATA
 * @return string
 */
function xmlEscape($string, $CDATA = false) {
    if ($CDATA) {
        str_replace("]]>", "&cdatag;", $string);
        return "<![CDATA[" . $string . "]]>";
    }
    return str_replace(array('&', '<', '>'), array('&amp;', '&lt;', '&gt;'), $string);
}

/**
 * Re genera texto de xml
 * @param string $string
 * @return string
 */
function xmlText($string) {
    return str_replace(array('&amp;', '&lt;', '&gt;', '&cdatag;'), array('&', '<', '>', ']]>'), $string);
}

/**
 * si data es null devuelve default
 */
function dataDefatult($data, $defaultD) {
    if ($data)
        return $data;
    return $defaultD;
}

function strToSQL($txt) {
    $tmp = str_replace("'", "''", $txt);
    $tmp = str_replace("\\", "\\\\", $tmp);
    $tmp = str_replace("TBL_", "TBL _", $tmp);
    return $tmp;
}


/**
 * Bloquea mensajes de error y lo pone en una variable global
 */
$fatal_error_handler_MSJ = "";

function fatal_error_handler($buffer) {
    global $fatal_error_handler_MSJ;
    if (ereg("(error</b>:)(.+)(<br)", $buffer, $regs)) {
        $fatal_error_handler_MSJ = $buffer;
        return $buffer;
    }
    $fatal_error_handler_MSJ = "";
    return $buffer;
}

/**
 * inicia medicion y lo guarda en el id solicitado
 */
$measures = array();
$measures_stop = array();

function start_measure($id) {
    global $measures;
    global $measures_stop;
    $measures[$id] = microtime_float();
    $measures_stop[$id] = "";
}

/**
 * detener medicion
 */
function stop_measure($id) {
    global $measures_stop;
    $measures_stop[$id] = microtime_float();
}

/**
 * retorna el tiempo desde start_measure
 */
function get_measure($id) {
    global $measures;
    global $measures_stop;
    if ($measures_stop[$id] == "" || $measures_stop[$id] == NULL)
        $tFinish = microtime_float();
    else
        $tFinish = $measures_stop[$id];
    return ($tFinish - $measures[$id]);
}

/**
 * muestra el tiempo desde start_measure */
function show_measure($id, $text = "") {
    if (!$GLOBALS[UL])
        return;
    if (!$GLOBALS[UL]->get_prop("debug") || !DEBUG_MEASURE)
        return;
    if ($text == "")
        $text = $id;
    echo "<br/>" . $text . "=>" . get_measure($id);
}

function microtime_float() {
    list($useg, $seg) = explode(" ", microtime());
    return ((float) $useg + (float) $seg);
}

/**
 * se ejecuta al finalizar script */
function finish() {
    
}

class Encrypter {

    private static $Key = "ssvent1";

    public static function encrypt($input) {
        $output = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, sha1(Encrypter::$Key), $input, MCRYPT_MODE_CBC, sha1(sha1(Encrypter::$Key))));
        return $output;
    }

    public static function decrypt($input) {
        $output = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, sha1(Encrypter::$Key), base64_decode($input), MCRYPT_MODE_CBC, sha1(sha1(Encrypter::$Key))), "\0");
        return $output;
    }

}

?>
