#/bin/sh
PORT=4000
ps -ef|grep server.sh| grep -v grep|awk '{print $2}'|xargs kill
netstat -pant|grep $PORT|grep LISTEN|awk '{print $NF}' |awk -F '/' '{print $1}'|xargs kill
