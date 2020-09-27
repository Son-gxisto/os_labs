#!/bin/bash
a="$PWD/X2.log"
p="/var/log/anaconda/X.log"
sed '/(++)\|(EE)/d' "$p" | sed -n -e '/(II)/s/(II)/Info/p' -e '/(WW)/s/(WW)/Warning/p' | sort -k3 -o "$a"
