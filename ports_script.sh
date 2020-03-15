#!/bin/bash

# Usage enter the IP address of the target right after script name 
# and the file name to write to

if [ "$1" == "" ]
then
    echo "Need to enter an IP address"
    exit 1
fi
if [ "$2" == "" ]
then
    echo "Provide full file path to the file to write results to"
    exit 1
fi

nmap -p- --min-rate=1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f1 |tr '\n' ','|sed s/,$// > $2

