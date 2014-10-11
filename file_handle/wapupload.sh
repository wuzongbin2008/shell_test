#!/bin/sh

date_time=$(date  +'%Y-%m-%d %H:%M')

arr=`cat /weibo_img/scribe/weibo_img/app/app_picserversweibof6vwt_wapupload/app_picserversweibof6vwt_wapupload_current |  grep -P -o '($date_time)'`

for a in $arr
	do
	   echo $a
	done
exit 0