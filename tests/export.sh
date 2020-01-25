#! /bin/bash

# run export.sh but with dump data
sed 's/cat engines/echo enginesss/; s/cat keymaps/echo keymapsss/' scripts/export.sh > tests/jit.sh
./tests/jit.sh && rm ./tests/jit.sh || echo failed
