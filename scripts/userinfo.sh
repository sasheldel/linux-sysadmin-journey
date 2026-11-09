#!/bin/bash 
 file="/etc/passwd"

 while read -r line; do 
	 # Extract username (field 1) and UID (field 3) 
	 echo "$line" | cut -d: -f1,3
 done < "$file" 
