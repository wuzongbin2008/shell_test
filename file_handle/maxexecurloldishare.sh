#!/bin/sh
(
cd /data1/apache/logs/
ip=10.44.3.101.ishare
file="./maxexecurl/"$ip".txt"
tail -n 4000 /data1/apache/logs/ishare_access_log | grep -v ' 0 ' |grep -v '/aj'|  grep -P -o '(GET .{3})' | sort | uniq -c | sort -rn >$file
cat $file | awk -F "GET|POST" 'BEGIN {max=0 ;}{if ($1>500){
    max++;
    system("/usr/bin/curl -d \"ip=10.44.3.101&error_msg=tomaxtime."$2"\" http://test.iask.sina.com.cn/maxcurl/maxcheckishare.php")}  else { print $2}} 
    END { if (max==0) 
system("/usr/bin/curl -d \"ip=10.44.3.101&error_msg=success\" http://test.iask.sina.com.cn/maxcurl/maxcheckishare.php")
    }'
)
