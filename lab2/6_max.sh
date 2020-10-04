#!/bin/bash
time="$PWD/time.t"
ps -e | awk '{print($1)}' > "$time"
while read line
do
 if [ -f /proc/"$line"/status ]
then
 t=$(grep -i "vmrss" /proc/"$line"/status | awk '{print($2)}')
 echo "$line $t"
fi
done < "$time" | sort -n -k2 | tail -1
