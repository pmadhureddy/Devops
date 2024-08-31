#!/bin/bash

USERID=$(id -u)
echo "User ID is : $USERID"

G="\e[32m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then echo "$2 is ..... Failed"
         exit 1
    else
        echo -e "$2 is .... $G succcess"
    fi         
}


if [ $USERID -ne 0 ]
then
   echo "please run this script with root privileges"
   exit 1
fi  

#sh 15-loops.sh git mysql nginx
for package in $@ # refers to all inputs
do 
   dnf list installed $package

    if [ $? -ne 0 ]
    then 
        echo "$package is not installed, going to install it"
        dnf install $package -y
        VALIDATE $? "Installing $package"     
    else 
        echo "$package is already installed. Nothing to do ...."    
    fi



 
done   