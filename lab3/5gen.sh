#!/bin/bash
./5ob.sh &
while true; do
	read line
	echo "$line" > pipe
done
