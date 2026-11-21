#!/bin/bash 
#
#
# 1. Check if $1 is empty 
 if [[ -z "$1" ]]; then 
    echo "Usage: ./even_odd.sh <number>"
    exit 1 

 elif [[ $(( $1 % 2 )) -eq 0 ]]; then 
    echo "The number $1 is Even." 
 else 
   echo "The number $1 is Odd." 

 fi 

 

