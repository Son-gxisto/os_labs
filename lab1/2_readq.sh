#!/bin/bash

read str
t=""
while [[ "$str" != "q" ]]
do t+="$str"
read str
done
echo "$t"
