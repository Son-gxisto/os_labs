#!/bin/bash
time="$PWD/time.t"
ps -e | awk '{print($1)}' > "$time"
for line in $(cat $time)
do
if [ -f "/proc/$line/sched" ]
then
 a=$(grep -is "PPid" /proc/$line/status | awk '{print($2)}')
 b=$(grep -is "sum_exec_runtime" /proc/$line/sched | awk '{print($3)}')
 c=$(grep -is "nr_switches" /proc/$line/sched | awk '{print($3)}')
 c=$(echo "$b / $c" | bc -l)
# c=$(echo "$c" | sed "s/^\./0./")
 echo "ProcessID=$line : Parent_ProcessID=$a : Average_Running_Time=$c"
fi
 done | sort -k3 > "$PWD/4.res"
