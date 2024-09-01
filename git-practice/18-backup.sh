#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)


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
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
   
   #check if zip is scuccessfully  created or not
   if [ -f $ZIP_FILE ]
   then
      echo "Successfully zipped files older than $DAYS"
      while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
      do
        echo "Deleting file: $file"
        rm -rf $file
      done <<< $FILES
    else 
       echo "Failed in zipping the files..."
       exit 1  
   fi   
else
  echo "No files older than $DAYS"
fi     