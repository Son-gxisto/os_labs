#!/bin/bash
wc -l /var/log/*.log | sed -n "s/total//p"
