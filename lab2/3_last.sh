#!/bin/bash
ps | tail -1 | awk '{print($0)}'
