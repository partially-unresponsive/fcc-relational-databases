#!/bin/bash

# Use `./translate.sh kitty_ipsum_1.txt` and `./translate.sh kitty_ipsum_2.txt`
cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'

