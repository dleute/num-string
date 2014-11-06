#!/bin/sh

while getopts "n:f:s:r:p" opt; do
  case $opt in
    n)
      numbers=$OPTARG
      echo "Numbers: $OPTARG" >&2
      ;;
    f)
      string1=$OPTARG
      echo "String 1: $OPTARG" >&2
      ;;
    s)
      string2=$OPTARG
      echo "String 2: $OPTARG" >&2
      ;;
    r)
      repeat=$OPTARG
      echo "Loop: $OPTARG iterations" >&2
      ;;
    p)
      console=true
      echo "Loop: $OPTARG iterations" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo "\nSwift - Numbers\n"
./swift-numbers/DerivedData/swift-numbers/Build/Products/Release/swift-numbers "$numbers"

echo "\nPHP - Numbers\n"
php ./php-numbers/numbers.php "$numbers"

echo "\nJava - Numbers\n"
java -cp java-numbers/out/production/java-numbers/ com.allofzero.numbers.Main "$numbers"

echo "\nSwift - Strings\n"
./swift-strings/DerivedData/swift-strings/Build/Products/Release/swift-strings "$string1" "$string2"

echo "\nPHP - Strings\n"
php ./php-strings/strings.php "$string1" "$string2"

echo "\nJava - Strings\n"
java -cp ./java-strings/out/production/java-strings/ com.allofzero.strings.Main "$string1" "$string2"

if [ "$repeat" != "" ]; then

echo "\nSwift - Numbers - Loop $repeat"
./swift-numbers/DerivedData/swift-numbers/Build/Products/Release/swift-numbers "$numbers" "performance" "$repeat"

echo "\nPHP - Numbers - Loop $repeat"
php ./php-numbers/numbers.php "$numbers" "performance" "$repeat"

echo "\nJava - Numbers - Loop $repeat"
java -cp java-numbers/out/production/java-numbers/ com.allofzero.numbers.Main "$numbers" "performance" "$repeat"

echo "\n\nSwift - Strings - Loop $repeat"
./swift-strings/DerivedData/swift-strings/Build/Products/Release/swift-strings "$string1" "$string2" "performance" "$repeat"

echo "\nPHP - Strings - Loop $repeat"
php ./php-strings/strings.php "$string1" "$string2" "performance" "$repeat"

echo "\nJava - Strings - Loop $repeat"
java -cp ./java-strings/out/production/java-strings/ com.allofzero.strings.Main "$string1" "$string2" "performance" "$repeat"

fi

echo "\n"