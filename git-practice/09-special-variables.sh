#!/bin/bash



echo "All variables passed to the script $@"

echo "Number of variables passed $#"

echo "Script name: $0"

echo "Curent Wprking Directory $PWD"

echo "Home directory of current user: $HOME"

echo "Process instance id of the script is executing now : $$"

sleep 100 &

echo "PID of last background command: $!"

