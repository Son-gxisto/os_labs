#!/bin/bash
file="$PWD/4.res"
output="$PWD/5.res"
b=$(cat "$file" | head -1)
c=0
#avg=$(echo "$b" | awk '{print($5)}' | awk -F "=" '{print($2)}')
avg=0
b=$(echo "$b" | awk '{print($3)}')
while read line
do
 a=$b
 b=$(echo "$line" | awk '{print($3)}')
 echo "$line" > "$output"
 if [ "$a" = "$b" ]
  then
   c=$(("$c" + "1"))
   t=$(echo "$line" | awk '{print($5)}' | awk -F "=" '{print($2)}')
   avg=$(echo "$avg + $t" | bc)
  else
    PPid=$(echo "$a" | awk -F "=" '{print($2)}')
    avg=$(echo "$avg / $c" | bc -l)
    echo "Average_Sleeping_Children_of_ParentID=$PPid $avg"
    avg=$(echo "$line" | awk '{print($5)}' | awk -F "=" '{print($2)}')
    c="1"
 fi
done < "$file"
PPid=$(echo "$b" | awk -F "=" '{print($2)}')
avg=$(echo "$avg / $c" | bc -l)
echo "Average_Sleeping_Children_of_ParentID=$PPid $avg"
