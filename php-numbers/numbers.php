#!/opt/local/bin/php
<?php

function formatString($string) {
    return str_replace(" ", "", $string);
}

function prettyPrint($array) {
    $return = "";
    $return .= "[";
    foreach ($array as $a) {
        $return .= "[" . $a[0] . ", " . $a[1] . "], ";
    }
    $return = rtrim($return, ", ");

    $return .= "]";
    return $return;
}

function processInput($string, $print = true) {
    $numbers = explode(",",formatString($string));

    $combinations = array();

    for ($i = 0; $i < count($numbers); $i++ ) {
        $n1 = $numbers[$i];
        for ($i2 = 0; $i2 < count($numbers); $i2++ ) {
            if ( $i != $i2) {
                $n2 = $numbers[$i2];
                $add = $n1 + $n2;
                if ($add == 10) {
                    $pair = array($n1, $n2);
                    $combinations[] = $pair;
                }
            }
        }
    }

    $same = array();
    $exact = array();


    foreach ($combinations as $p1) {

        $isExact = false;
        foreach ($exact as $p3) {
            if ( $p1 == $p3 ) {
                $isExact = true;
                break;
            }
        }

        if (!$isExact) {
            $exact[] = $p1;
        }

        $isSame = false;
        foreach ($same as $p4) {
            if ( $p1[0] == $p4[0] || $p1[0] == $p4[1] ) {
                $isSame = true;
                break;
            }
        }

        if (!$isSame) {
            $same[] = $p1;
        }

    }


    if ($print) {
        echo "1) " . prettyPrint($combinations) . "\n";
        echo "2) " . prettyPrint($exact) . "\n";
        echo "3) " . prettyPrint($same) . "\n";
    }
}

if (count($argv) > 3 && $argv[2] == "performance") {

    $start = microtime(true);

    for ($i = 0; $i < $argv[3]; $i++) {
        processInput($argv[1], false);
    }

    $end = microtime(true);

    $exec = $end-$start;
    $perf = number_format($argv[3]/$exec, 1);

    echo "Per Second: $perf Total: $exec\n";

} elseif (count($argv) > 1) {
    processInput($argv[1],true);
} else {
    echo "Please provide two quoted arguments like this: 'Race car' 'Elite Tile'\n";
}