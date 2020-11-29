#!/bin/bash
./mem.bash &
./mem2.bash &
./checkmem.sh "mem[2]*.bash" &
