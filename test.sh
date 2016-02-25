#!/bin/sh

VERBOSE=false
if [ $# -ge 2 ]
then
    if [ "$1" == "-v" ]; then
        VERBOSE=true
        if [ $# -lt 3 ]; then
            echo "Usage: $0 [-v] <program> <test1.in> ... <testN.in>"
            exit 1;
        fi
        PROGRAM=$2
        TEST_FILES=${@:3}
    else
        PROGRAM=$1
        TEST_FILES=${@:2}  
    fi
fi;

DIFF=diff
if hash colordiff 2>/dev/null; then
    DIFF=colordiff
fi

echo "Testing \"$PROGRAM\" ..."
for t in $TEST_FILES; do
    # run program
    myt="${t%.*}.test.out"
    $PROGRAM < $t > $myt

    # compare outputs
    if $DIFF -b "${t%.*}.out" $myt > /dev/null; then
        printf "   ✔   $t\n"
    else
        printf "   ❌   $t\n"
        if $VERBOSE; then
            $DIFF -b "${t%.*}.out" $myt
            echo ""
        fi
    fi
done