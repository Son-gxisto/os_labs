#!/bin/bash
p="pmemchange.log"
s="smemchange.log"
echo "process change" > $p
echo "system change" > $s
for (( i=0 ; i <= 20 ; i++))
do
top -b -n 1 | grep "$1" >> $p
top -b -n 1 | head -5 | tail -2 >> $s
sleep 1
done
