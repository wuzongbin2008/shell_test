#!/bin/sh

rm_path="." #$1
#if [[ -z $1 ]]; then
#    echo "rm_xx.sh path"
#    exit 0
#fi

cur_year=$(date  +'%Y')
cur_month=$(date  +'%m')
#echo $cur_year
#echo $cur_month
#exit 0

for log in `ls -l $rm_path | awk '{print $9}'`
	do
	    echo $log
	    path="$rm_path/$log"
	    y=`ls --time-style '+%Y %m %d %H:%M:%S' -l $path | awk '{print $6}'`
	    m=`ls --time-style '+%Y %m %d %H:%M:%S' -l $path | awk '{print $7}'`
	    s=`ls --time-style '+%s' -l $path | awk '{print $6}'`
        #echo $y
        #echo $m
        echo $s
		if [ $y -lt $cur_year -o $m -lt $cur_month ]
		then
		    echo $path
           #rm -f $path
		else
           echo ""
		fi
	done
exit 0