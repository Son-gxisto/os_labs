#!/bin/bash
pid=$(pgrep infev.sh | head -1)
while true
do
	kill -STOP $pid
	sleep 0.1
	kill -CONT $pid
	sleep 0.005
done &
