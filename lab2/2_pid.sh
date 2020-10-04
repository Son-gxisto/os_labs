#!/bin/bash
ps -afx | grep -E ":[[:digit:]]{2} [[:alpha:]\/[:digit:]]*\/sbin\/" | awk '{print($1)}' > "$PWD/2.f"
