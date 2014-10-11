#!/bin/sh
dirlist=`ls -rt /data112/ | sort`
for f in $dirlist
do
   echo $f
done

echo "wj"
