#!/usr/bin/bash

# echo "you enter the argument : $1 $2 $3 and $4 ."

# ls -lh $1
# $# means number of arguments passed to the script

lines=$(ls -lh $1 | wc -l)

echo "you have $(($lines-1)) objects in the $1 directory"