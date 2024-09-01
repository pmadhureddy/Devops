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
}

# check the source  and destination are provided

if [ $# -lt 2 ]
then
   USAGE
fi   