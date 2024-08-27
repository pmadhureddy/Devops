#!/bin/bash

USERID=$(id -u)
echo "User ID is : $USERID"

VALIDATE(){

    if [ $1 -ne 0 ]
    then echo "$2 is ..... Failed"
         exit 1
    else
        echo "$2 is .... succcess"
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
