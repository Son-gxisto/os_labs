#!/bin/bash
ps ax -o pid,cmd | grep -E "^ *[[:digit:]]* \/sbin\/" #| awk '{print($1)}' > "$PWD/2.f"
