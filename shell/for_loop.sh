#!/usr/bin/bash

for i in {1..13}
do
    echo $i
    sleep 0.5
    if [ $i -eq 7 ]
    then 
        echo "hello duppalapudi" 
        exit 
    fi
done
echo "outside the loop"


for file in logfiles/*.log
do
    tar -czvf $file.tar.gz $file
done