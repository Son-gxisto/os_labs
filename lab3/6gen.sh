#!/bin/bash
./6ob.sh &
pid=$(cat .pid)
while true; do
 read line
# echo "$line"
  case "$line" in
   TERM)
    kill -SIGTERM $pid
    exit
    ;;
   "+")
    kill -USR1 $pid
    ;;
   "*")
    kill -USR2 $pid
    ;;
   *)
    :
    ;;
  esac
done
