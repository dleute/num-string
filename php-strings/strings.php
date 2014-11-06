#!/opt/local/bin/php
<?php

function formatString($string) {
    return strtolower( str_replace(" ", "", $string) );
}

function processInput($string1, $string2, $print = true) {

    $string1_formatted = formatString($string1);
    $string2_formatted = formatString($string2);

    $string1_reversed = strrev($string1_formatted);
    $string2_reversed = strrev($string2_formatted);

    $temp = str_split($string1_formatted);
    sort($temp);
    $string1_sorted = implode('',$temp);

    $temp = str_split($string2_formatted);
    sort($temp);
    $string2_sorted = implode('',$temp);

    $arePalindromes = false;
    $onePalindrome = false;
    $areAnagrams = false;
    $string1Palindrome = false;
    $string2Palindrome = false;

    if ($string1_formatted == $string1_reversed) {
        $string1Palindrome = true;
    }

    if ($string2_formatted == $string2_reversed) {
        $string2Palindrome = true;
    }

    if ( $string1Palindrome && $string2Palindrome ) {
        $arePalindromes = true;
    }

    if ( ($string1Palindrome || $string2Palindrome) && !$arePalindromes ) {
        $onePalindrome = true;
    }

    if ($string1_sorted == $string2_sorted) {
        $areAnagrams = true;
    }

    if ($print) {

        if ($arePalindromes) {
            echo "1) true\n";
        } else {
            echo "1) false\n";
        }

        if ($onePalindrome) {
            echo "2) true\n";
        } else {
            echo "2) false\n";
        }

        if ($areAnagrams) {
            echo "3) true\n";
        } else {
            echo "3) false\n";
        }

        if ($arePalindromes && $areAnagrams) {
            echo "4) true\n";
        } else {
            echo "4) false\n";
        }

        if ((!$arePalindromes && !$onePalindrome) && !$areAnagrams) {
            echo "5) true\n";
        } else {
            echo "5) false\n";
        }
    }

}

if (count($argv) > 4 && $argv[3] == "performance") {

    $start = microtime(true);

    for ($i = 0; $i < $argv[4]; $i++) {
        processInput($argv[1], $argv[2], false);
    }

    $end = microtime(true);

    $exec = $end-$start;
    $perf = number_format($argv[4]/$exec, 1);

    echo "Per Second: $perf Total: $exec\n";

} elseif (count($argv) > 2) {
    processInput($argv[1],$argv[2],true);
}  else {
    echo "Please provide two quoted arguments like this: 'Race car' 'Elite Tile'\n";
}