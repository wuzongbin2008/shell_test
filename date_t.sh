#!/bin/sh

function format()
{
#    echo "param 0 = "$0
#    echo "param 1 = "$1
#    exit 0

    i=0
    while [ TRUE ]
    do
        date_time=$(date  +'%Y%m%d%H%M')
        i=`expr $i + 1`
        echo $i"="$date_time

        if [ $i -eq 10 ]
            then
         exit 1
        fi
    done
}

#format 3 1

echo $(date +'%s')