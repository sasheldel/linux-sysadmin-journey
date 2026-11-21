#!/bin/bash 

# Loop through all agruments passed to this script 

 for item in "$@"; do 

  if [[ -d "$item" ]]; then 
	echo "$item is a directory" 
  
  elif [[ -f "$item" ]]; then 
        echo "$item is a regular file" 

  else 
   echo "$item does not exist" 

  fi 


done 
