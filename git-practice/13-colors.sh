#!/bin/bash


#32m -> green -> success
#31 => red


#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then echo -e "$2 is ..... $R Failed $N"
         exit 1
    else
        echo -e "$2 is .... $G succcess $N"
    fi         
}

if [ $USERID -ne 0 ]
then
   echo "please run this script with root privileges"
   exit 1
fi   

dnf list installed mysql




if [ $? -ne 0 ]
then 
    echo "mysql is not installed, going to install it"
    dnf install mysql -y
    VALIDATE $? "Installing mysql"     
else 
   echo "mysql is already installed. Nothing to do ...."    
fi
