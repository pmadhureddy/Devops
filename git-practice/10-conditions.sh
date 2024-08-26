#!/bin/bash

NUMBER=$1

if [$NUMBER -gt 20 ] #gt lt eq -ne
then 
   echo "Given Number: $Number is greater than 20"
else
   echo "Given Number: $NUMBER is less than 20"
fi      

