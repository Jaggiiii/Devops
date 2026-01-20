#!/usr/bin/bash

directory=/etc

if [ -d $directory ]
then
    echo "the direcorty $directory exits"
    exit 0
else
    echo "the direcorty does not exit"
    exit 1
fi

echo "the exit code is :  $?"
 