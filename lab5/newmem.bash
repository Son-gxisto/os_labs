#!/bin/bash
arr=()
size=0
while [ ${#arr[@]} -lt $1 ]
do
arr+=(1 2 3 4 5 6 7 8 9 10)
#echo "${#arr[@]}"
done
