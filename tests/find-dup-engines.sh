#! /bin/bash

# Find duplicated keyword in engines
grep -oE '^\w+' engines | sort | uniq -d