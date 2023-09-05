#!/bin/bash

# our program goal is install to my sql
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Error: Please run this script with root access"
    exit 1
else
    echo "INFO: You are root user"
fi
yum install mysql -y

if[ $? -ne 0 ]
then
    echo "Installation of my sql is error"
    exit 1
else
    echo "Installation of mysql is success"
fi        

yum install postfix -y

if[ $? -ne 0 ]
then
    echo "Installation of my postfix is error"
    exit 1
else
    echo "Installation of postfix is success"
fi 