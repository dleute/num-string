Explanation
==========

This is a performance exploration of several different languages. Tere are two logic tests each of which present different issues.

Currently it is supported in 3 languages: Swift, PHP and Java.

This is not defensively coded. If bad input is provided, these experiments will choke and fail. The point was to test performance not usability.

Current Output Notes
==========

Assuming the command `./speedreport.sh -f "Race Car" -s "rAce Car" -n "1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9" -r 10000`

This will currently only run on a Mac with OS X Yosemite, PHP and Java properly installed in the path. To make it easier I have included the compiled binaries where relevant in the git.

The script will run each version of the code a sing time for six different outputs.

Since -r 10000 was provided, each code base was also designed to test looping the input that many times. This is rudimentary testing to give an idea of which language is best for which task.

Output
==========

String 1: Race Car

String 2: rAce Car

Numbers: 1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9

Loop: 10000 iterations

Swift - Numbers

1) [[1, 9], [1, 9], [4, 6], [4, 6], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [6, 4], [6, 4], [9, 1], [9, 1]]

2) [[1, 9], [4, 6], [5, 5], [6, 4], [9, 1]]

3) [[1, 9], [4, 6], [5, 5]]

PHP - Numbers

1) [[1, 9], [1, 9], [4, 6], [4, 6], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [6, 4], [6, 4], [9, 1], [9, 1]]

2) [[1, 9], [4, 6], [5, 5], [6, 4], [9, 1]]

3) [[1, 9], [4, 6], [5, 5]]

Java - Numbers

1) [[1, 9], [1, 9], [4, 6], [4, 6], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [6, 4], [6, 4], [9, 1], [9, 1]]

2) [[1, 9], [4, 6], [5, 5], [6, 4], [9, 1]]

3) [[1, 9], [4, 6], [5, 5]]

Swift - Strings

1) true

2) false

3) true

4) true

5) false

PHP - Strings

1) true
2) false
3) true
4) true
5) false

Java - Strings

1) true

2) false

3) true

4) true

5) false

Swift - Numbers - Loop 10000

Per Second: 9805.8 Total: 1.01980501413345

PHP - Numbers - Loop 10000

Per Second: 14,447.2 Total: 0.69217801094055

Java - Numbers - Loop 10000

Per Second: 50528.2 Total: 0.197909258

Swift - Strings - Loop 10000

Per Second: 4760.7 Total: 2.10054397583008

PHP - Strings - Loop 10000

Per Second: 167,048.5 Total: 0.059862852096558

Java - Strings - Loop 10000

Per Second: 117990.5 Total: 0.084752606
