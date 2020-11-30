#!/bin/bash
K=30
n=2250000
for (( i=0; i < $K ; i++ ))
do
./newmem.bash $n &
sleep 1
done
