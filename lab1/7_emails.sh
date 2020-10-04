#!/bin/bash
reg="a-zA-Z0-9_\-\."
grep -IEroh "([\"$reg\"\+]+)@([\"$reg\"]+)\.([\"$reg\"])" /etc | uniq

