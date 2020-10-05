#!/bin/bash
time="$PWD/time.t"
time2="$PWD/time2.t"
ps -A -o pid | awk '{print($1)}' > "$time"
while read line
do
 file="/proc/$line/io"
 if [ -f  "$file" ]
  then
   t=$(grep -si "read_bytes:" "$file" | awk '{print($2)}')
   echo "$line : $t" >> "$time2"
  fi
done < "$time"
rm "$time"
sleep 60
while read line
 do
 pid=$(echo "$line" | awk '{print($1)}')
 file="/proc/$pid/io"
 if [ -f "$file" ]
 then
  t=$(grep -si "read_bytes:" "$file" | awk '{print($2)}')
  tp=$(echo "$line" | awk '{print($3)}')
  tp=$(echo "$tp - $t" | bc)
  cmd=$(tr -d '\0' < /proc/$pid/cmdline)
  echo "$pid : $tp : $cmd"
 fi
done < "$time2" | sort -n -k3 | tail -3
rm "$time2"
