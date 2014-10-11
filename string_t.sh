#!/bin/bash

for file in `ls -l /var/spool/clientmqueue | awk '{print $9}'`
do
      path="/var/spool/clientmqueue/$file"
      rm -f $path
done
