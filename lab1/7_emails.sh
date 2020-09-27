#!/bin/bash
reg="a-zA-Z0-9_\-\."
grep -o -r -E "([\"$reg\"\+]+)@([\"$reg\"]+)\.([\"$reg\"])" /etc | sed -n "s/.*://p" | uniq > "$PWD/emails.lst"

