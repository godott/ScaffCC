#!/bin/bash

DIR=$(dirname $0)
ROOT=$DIR/..
OPT=$ROOT/build/Release+Asserts/bin/opt
SCAF=$ROOT/build/Release+Asserts/lib/Scaffold.so

rm -rf $ROOT/test_cases
mkdir $ROOT/test_cases
for testcase in Cat_State Square_Root RKQC_Testing; do
#for testcase in Cat_State QFT Square_Root; do
    mkdir $ROOT/test_cases/$testcase
    cp -R $ROOT/Algorithms/$testcase  $ROOT/test_cases
    $ROOT/scaffold.sh -R $ROOT/test_cases/$testcase/*.scaffold > $ROOT/test_cases/$testcase/tmp.txt
    python get_total_gates_line.py $ROOT/test_cases/$testcase/tmp.txt  > $ROOT/test_cases/$testcase/total_gates.txt
    $ROOT/scaffold.sh -q -R $ROOT/test_cases/$testcase/*.scaffold 
    cp *.qasmh  $ROOT/test_cases/$testcase
    $ROOT/scaffold.sh -f -R $ROOT/test_cases/$testcase/*.scaffold
    cp *.qasmf  $ROOT/test_cases/$testcase
    rm -rf $ROOT/test_cases/$testcase/tmp.txt
    $ROOT/scaffold.sh -c $ROOT/test_cases/$testcase/*.scaffold
done
