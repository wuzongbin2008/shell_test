#!/bin/sh

for file in `ps -aux | grep queue | awk '{print $12}'`
do
    echo $file
	du -sh $file
done
exit 0