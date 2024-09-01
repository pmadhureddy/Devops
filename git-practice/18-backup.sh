#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


USAGE(){

    echo -e "$R USAGE:: $N sh 18-bachup.sh <source> <destination> <days(optional)>"
    exit 1
}

# check the source  and destination are provided

if [ $# -lt 2 ]
then
   USAGE
fi   

if [ ! -d $SOURCE_DIR ]
then
   echo "$SOURCE_DIR does not exist. please check..."
fi      

if [ ! -d $DEST_DIR ]
then
   echo "$DEST_DIR does not exist. please check..."
fi  
   
FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ ! -z $FILES ] # -Z check whether files are empty are not, if empty  returns true
then
   echo "Files are Found"
else
  echo "No files older than $DAYS"
fi     