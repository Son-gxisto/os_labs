#!/bin/bash
cut -d: -f1,3 /etc/passwd | sed "s/:/ /p" | sort -g -k2
