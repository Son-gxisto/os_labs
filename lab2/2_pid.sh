#!/bin/bash
ps -afx | grep -E ":[[:digit:]]{2} [[:alpha:]\/[:digit:]]*usr\/sbin\/" | awk '{print($1)}' > "$PWD/2.f"
