#!/bin/sh
date=$(date --date='4 days ago' +%Y-%m-%d)
#date=$(date +%Y-%m-%d)
date="$date/*_delete.csv" 
s="root@172.16.152.131::nav/$date /data1/import_navdata/delete"
rsync $s 
 
