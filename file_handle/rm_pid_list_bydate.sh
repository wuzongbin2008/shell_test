#!/bin/sh
cur_year=$(date  +'%Y')
cur_month=$(date  +'%m')
#echo $cur_year
#echo $cur_month
#exit 0

for log in `ls -l| awk '{print $9}'`
	do
	    echo $log
	    path="./$log"
	    y=`ls --time-style '+%Y %m %d %H:%M:%S' -l $path | awk '{print $6}'`
	    m=`ls --time-style '+%Y %m %d %H:%M:%S' -l $path | awk '{print $7}'`
        echo $y
        echo $m
        #exit 0
		if [ $y -lt $cur_year -o $m -lt $cur_month ]
		then
           rm -f $path
		else
           echo ""
		fi
	done
exit 0