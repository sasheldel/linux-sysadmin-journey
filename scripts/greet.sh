#!/bin/bash 

# 1. Check if $1 is empty 
if [[ -z "$1" ]]; then 
 echo "Usage ./greet.sh <name>" 
 exit 1 
fi 

# 2. Print the greeting 
echo "Hello, $1!" 


#3. Check if there are too many agruments
 if [[ "$#" -gt 1 ]]; then 
 echo "you gave me $# agruments, but I only need 1." 
 fi 


