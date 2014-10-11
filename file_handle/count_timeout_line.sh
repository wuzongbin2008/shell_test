#!/bin/sh

cat err.log | grep -P '(download failed:Operation timed out with ([0-9]+) out of ([0-9]+) bytes received)' >> timeout_line_attachid.log

cat timeout_line_attachid.log | awk '{print $5}' | uniq -c | awk '{print $2}' | wc -l

cat err.log | grep -P '(download failed:Operation timed out with ([0-9]+) out of ([0-9]+) bytes received)' | awk '{print $5}' >> timeout_line_attachid.log







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
