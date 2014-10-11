#!/bin/sh

for mysql_bin_log in `ls -l /data5/MySQLData | grep -P '(mysql-bin\..*)' | awk '{print $9}'`
	do
	    path="/data5/MySQLData/$mysql_bin_log"
	    #ls -l "$path"
	    cy=`ls -l $path | awk '{print $8}'`
		if [ $cy -lt 2013 ] 
		then
                   ls -l "$path"
		   #echo "creation date of $path less than 2013 : $cy"
		   #du -sh $path
		else
                   echo ""
		   #echo "creation date of $path more than 2013 : $cy"
		fi
	done
exit 0

~      
