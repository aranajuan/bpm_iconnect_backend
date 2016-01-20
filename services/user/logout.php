<?php

/**
 * Loguea usuario
 * @param Context $Context
 * @return null
 */
function GO($Context) {
    $Context->get_User()->sessionClose();
    return $Context->createElement("result", 'ok');
}