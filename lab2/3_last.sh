#!/bin/bash
ps -o ppid,pid,start,cmd | sed "/ $$ /d" | tail -1
