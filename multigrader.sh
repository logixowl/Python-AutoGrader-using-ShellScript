#!/bin/bash

echo -n '' > results/results
counter=0
totalfiles=`ls programs | wc -l`

for filename in programs/*
do
    counter=`expr $counter + 1`
    echo -ne "Running...($counter/$totalfiles)\r"
    echo -ne "$filename\t" >> results/results
    ./autograder.sh "$filename" >> results/results
done

echo -e "\nDone...($counter/$totalfiles)\r"