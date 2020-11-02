#!/bin/bash
(sleep 10 ; ./1.sh ; tail -f -n1 ~/report) &
