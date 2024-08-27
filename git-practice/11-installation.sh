#!/bin/bash

USERID=$(id -u)
echo "User ID is : $USERID"

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
    if [ $? -ne 0 ]
    then 
       echo "My sql installation is not success. Please check it..."
    else 
       echo "Mysql installation is successful"
    fi      
else 
   echo "mysql is already installed. Nothing to do ...."    
fi
