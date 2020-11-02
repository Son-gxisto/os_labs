#!/bin/bash
op="+"
res=1
(tail -f pipe) |
while true; do
	read line;
	echo "line is:$line:"
	echo "res is $res"
	case $line in
		QUIT)
			echo "exit"
			killall 5gen.sh
			killall tail
			exit
			;;
		"+" | "*")
			op=$line
			;;
		[0-9]*)
			if [[ $op == "+" ]]
			 then
			 res=$(echo "$res + $line" | bc -l)
			 else
			 res=$(echo "$res * $line" | bc -l)
			fi
			echo "evaluated $res"
			;;
		*)
			echo "input error"
			killall tail
			killall 5gen.sh
			exit
			;;
	esac
done
