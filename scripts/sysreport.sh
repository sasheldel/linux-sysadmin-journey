#!/bin/bash 
#


# 1. Create a header 
echo "=== SYSTEM AUDIT REPORT ===" > report.txt 
echo "Date: $(date)" >> report.txt 
echo "==========================" >> report.txt 


# 2. Find users who can log in 
echo "Users with Bash shell:" >> report.txt 
grep "bin/bash" /etc/passwd >> report.txt 


# 3. Find human users (UID >= 1000) 
echo "Human Users:" >> report.txt 
awk -F: '$3 >= 1000 {print $1, $3, $7}' /etc/passwd >> report.txt 

# 4. Let the user know its done 
echo "Report generated! Check report.txt"  
