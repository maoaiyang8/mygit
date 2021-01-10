#!/bin/bash
if [ $# -ne 2 ]
then
    echo "usage: $0 [PID] [interval]"
    exit
fi
pid=$1  #获取进程pid
echo $pid
interval=$2  #设置采集间隔
echo $interval
while true
do 
	echo $(date "+%y-%m-%d %H:%M:%S") >> memlog.txt
	cat /proc/$pid/status|grep -e VmRSS >> memlog.txt
	echo "RES:       `top  -d 1 -n 1 -p  $1|grep $1 | awk '{print $6}'` kB" >> memlog.txt
	echo $blank >> memlog.txt
	sleep $interval
done
