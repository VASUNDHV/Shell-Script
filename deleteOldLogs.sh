#!/bin/bash
APP_LOGS_DIR=/home/centos/app-logs
Date=$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/ShellScriptLogs
# /home/centos/ShellScriptLogs/script name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>> $LOGFILE

while read line
do
    #We write statements here
    echo "Deleteing $line" &>> $LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE    