#!/bin/sh
#132G    audit_data  2013/11/4

current_path=$PWD
echo "current path = $current_path"

for file in `ls -l $current_path | awk '{print $9}'`
do
        echo $file
	du -sh $file
done
exit 0
