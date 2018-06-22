#!/bin/bash

#Select most popular IPs in nginx access log in last 5000 rows
tail -n 5000  /var/log/nginx-access.log  | awk '{print $1}' | sort -n | uniq -c | sort -nr | head -20

#Kill several PIDs
for pid in $(ps -ef | grep "some_fruitful_script_here" | awk '{print $2}'); do sudo kill -9 $pid; done

#Show the largest 10 currently open files
lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB" " " $9 " " $1 }' | sort -n -u | tail
