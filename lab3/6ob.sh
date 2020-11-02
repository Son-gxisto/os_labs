#!/bin/bash
echo $$ > .pid
res=1
mode="work"
usr1()
{
 res=$(echo "$res + 2" | bc)
 echo $res
}
usr2()
{
 res=$(echo "$res * 2" | bc)
 echo $res
}
term()
{
 mode="stop"
}
trap 'usr1' USR1
trap 'term' SIGTERM
trap 'usr2' USR2
while true; do
 case $mode in
  "work")
   :
   # echo "$res"
    ;;
  "stop")
   echo "stopped"
   exit
   ;;
 esac
done
