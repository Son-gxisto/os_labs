#!/bin/bash
a="$PWD/ps.stat"
ps | awk '{print($1":"$4)}' > "$a"
b=$(wc -l "$a" | cut -d " " -f1)
b=$(("$b" - 1))
sed -i "1s/.*/$b/" "$a"
