#!/bin/sh
#cnt=0
#while [ $cnt -lt 1000 ]
#do
 #cnt=`expr $cnt + 1`
 #php mysql_connect_test.php
#done

cnt=0
while [ $cnt -lt 24 ]
do
 cnt=$[$cnt + 1]
 date=$(date --date="$cnt day" +%Y-%m-%d)
 echo $date
 echo $cnt
done
