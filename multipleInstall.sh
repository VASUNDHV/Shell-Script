#!/bin/bash
Date=$(date +%F)
LOGSDIR=/home/centos/ShellScriptLogs
# /home/centos/ShellScriptLogs/script name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: $N Please run this script with root access"
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "Installing $2 ----$R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ----$G SUCCESS $N"   
}

#all args are in $@
for i in $@
do
    yum list installed $i
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, let's install it"
        yum installes $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i $N is already installed"
    fi    
done



