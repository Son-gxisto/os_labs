#!/bin/bash
mkdir $HOME/test 2>/dev/null && (echo "catalog was created successfully" > ~/report ; d=$(date | sed "s/  */_/g") ; touch $HOME/test/$d)
ping -c 1 www.net_nikogo.ru 2>/dev/null || (d=$(date | sed "s/  */_/g") ; echo "$d: ping error" >> ~/report) 2>/dev/null
