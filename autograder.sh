#!/bin/bash

python3 "$1" < sample.in &> tmp/tmp.out
sleep 1

if [ $? != 0 ]
then
    echo "Compilation error"
    exit
fi

diff tmp/tmp.out sample.out > tmp/tmp.file
# output empty => correct
# output not empty => wrong
if [ -s tmp/tmp.file ]
then
    echo "Wrong Answer"
else
    echo "Correct"
fi