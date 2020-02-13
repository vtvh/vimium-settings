#! /bin/bash

# sort from line below # Frequently used to end
vim -E -s -c "g/# Frequently used/+1,$ sort" -c "wq" engines