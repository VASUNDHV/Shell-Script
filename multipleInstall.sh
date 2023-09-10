#!/bin/bash
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
if[ $USERID -ne 0 ]
then
    echo "$R ERROR: Please rn this script with root access $N"
    exit 1
fi
