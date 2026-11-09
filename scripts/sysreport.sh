#!/bin/bash 
#
#
#
# 1. This is to append a file
echo "text" >> file.txt 

# 2. Find bash users 
grep "/bin/bash" /etc/passwd

#3. Human users 
awk -F: '$3 >= 1000 {print $1, $3, $7}' /etc/passwd


