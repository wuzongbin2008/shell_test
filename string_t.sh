#!/bin/bash

#s="abc"
#echo ${s:1:1}
##exit
#
#idc=('j': 'BJ','t': 'TJ', 'g': 'GZ')
#echo $idc

for file in `cat $1`
do
      echo $file
      echo ${file:8:1}
done
