#!/bin/bash

# our program goal is install to my sql
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    #$1 ---> it will receive the argument1
    if [ $1 -ne 0 ]
    then
        echo -e "Installation $2..........$R FAILURE $N"
        exit 1
    else
        echo -e "Installation $2..........$G SUCCESS $N"
    fi


}
USERID=$(id -u)
# this function should validate the previous command it success or failure
if [ $USERID -ne 0 ]
then
    echo "Error: Please run this script with root access"
    exit 1
else
    echo "INFO: You are root user"
fi
yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing My SQL"      

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing Postfix"
