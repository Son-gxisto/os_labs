#!/bin/bash
arr=()
report="./report2.log"
echo "size:" > $report
while [ true ]
do
for (( i=1; i <= 10000; i++ ))
do
arr+=(1 2 3 4 5 6 7 8 9 10)
done
echo ${#arr[@]} >> $report
done
