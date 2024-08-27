#!/bin/bash


LOGS_FOLDER = "/var/logs/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTSAMP = $(data +Y=%m-%d-%H=%M-%S)
LOG_FILE = "$LOGS_FOLDERS/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e33m

VALIDATE(){

    if [ $1 -ne 0 ]
    then echo -e "$2 is ..... $R Failed $N" &>>$LOG_FILE
         exit 1
    else
        echo -e "$2 is .... $G succcess $N" &>>$LOG_FILE
    fi         
}

if [ $USERID -ne 0 ]
then
   echo "please run this script with root privileges" &>>$LOG_FILE
   exit 1
fi  

#sh 15-loops.sh git mysql nginx
for package in $@ # refers to all inputs
do 
   dnf list installed $package

    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install it" &>>$LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"     
    else 
        echo "$package is already $Y installed. Nothing to do ...."  &>>$LOG_FILE   
    fi



 
done 


