#!/bin/bash
man bash | tr '[:upper:]' '[:lower:]' | grep -E -o "[[:alpha:]]{4}[[:alpha:]]*" | sort | uniq -c | sort -k1 -g -r | sed 3q
