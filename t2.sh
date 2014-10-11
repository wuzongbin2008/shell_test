#!/bin/sh

cnt=0
while [ $cnt -lt 24 ]
do
 cnt=`expr $cnt + 1`
 date=$(date --date="$cnt day" +%Y-%m-%d)
 if [ $cnt -gt 5 ]
 then
   echo $cnt
   exit 1
 fi
 echo $date
 echo $cnt
done
