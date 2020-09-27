#!/bin/bash
man bash | tr ' ' '\n' | awk '{if (3 < length($0)) print($0)}' | sort | uniq -c | sort -k1 -g -r | sed 3q
