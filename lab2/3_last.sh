#!/bin/bash
ps | awk '{print($1)}' | tail -1
