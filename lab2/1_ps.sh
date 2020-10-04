#!/bin/bash
a="$PWD/ps.stat"
ps | cut -d " " -f4,11 > "$a"
b=$(wc -l "$a" | cut -d " " -f1)
b=$(("$b" - 1))
sed -i "1s/ /$b/" "$a"
sed -i "s/ /:/" "$a"
