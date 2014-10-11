#!/bin/sh
var_size=`du -sm /var | awk '{print $1}'`
echo "size=$var_size M"

if [ $var_size -gt 1024 ] 
then
   echo "size of /var more than 1 G"

   for dir in `ls -l /var | awk '{print $9}'`
   do
      path="/var/$dir"
      du -sh $path
   done
else
   echo " /var size less than 1 G"
fi

exit 0

~      
