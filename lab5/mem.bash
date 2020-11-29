#!/bin/bash
arr=()
size=0
report="./report.log"
echo "size:" > $report
while [ true ]
do
for (( i=1; i <= 10000; i++ ))
do
arr+=(1 2 3 4 5 6 7 8 9 10)
done
echo ${#arr[@]} >> $report
size=$(echo "$size + 100000" | bc)
done
