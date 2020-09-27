#!/bin/bash
a="$PWD"
a+="/info.log"
grep " INFO " /var/log/anaconda/syslog > "$a"
