#!/bin/bash
cut -d: -f1,3 /etc/passwd | sed "s/:/ /" | sort -n -k2
