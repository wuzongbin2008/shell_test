#!/bin/bash

usage()
{
	echo "hello usage\n"
}

argv_test()
{
	opt=$1
	processid=$2

	if [[ $# -ne 2 ]];then
		usage
		exit 1
	fi

	case $opt in 
	start|Start) 
		echo "starting...$processid"
		;;
	stop|Stop)
		echo "stopping...$processid"
		;;
	*) 
		usage
		echo "default"
		;;
	esac
}

argv_test2()
{
	#loop=0
	while [[ $# -ne 0 ]]
	do
		echo $1
		shift
	done
}

argv_test2 $1 $2


