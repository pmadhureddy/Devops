#!/bin/bash


LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e  "$R USAGE: sudo sh 16-redirectots.sh package1 package2"
    exit 1
}

if [ $# -eq 0 ]
then 
    USAGE
fi

echo "Script started excecuting at: $(date)" | tee -a $LOG_FILE


VALIDATE(){

    if [ $1 -ne 0 ]
    then echo -e "$2 is ..... $R Failed $N" | tee -a $LOG_FILE
         exit 1
    else
        echo -e "$2 is .... $G succcess $N" | tee -a $LOG_FILE
    fi         
}

if [ $USERID -ne 0 ]
then
   echo "please run this script with root privileges" | tee -a $LOG_FILE
   exit 1
fi  

#sh 15-loops.sh git mysql nginx
for package in $@ # refers to all inputs
do 
   dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"     
    else 
        echo  -e "$package is already $Y installed. Nothing to do ...."  | tee -a $LOG_FILE   
    fi



 
done 


