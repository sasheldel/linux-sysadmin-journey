#!/bin/bash 
#
 echo "The script name is : $0" 
 echo "The number of arguments: $#" 
 echo "The Process ID (PID) of this script is; $$" 


# Testing the exit status 
 echo "Testing exit status ..." 
 ls /etc > /dev/null 2>&1
 echo "Status after a succesful command: $?" 


ls /fake/path > /dev/null 2>&1
echo "Status after a failed command: $?"


# Let;s test the last background PID ($!)
 echo "Starting a background sleep ..." 
 sleep 2 &
 echo "The PID of the background sleep is: $!" 
 wait #wait for the sleep to finish 

