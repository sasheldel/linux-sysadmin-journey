#!/bin/bash 

#File Navigator Script 
#Author: saskovich 
#Date: $(date +%Y-%m-%d) 

#Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== File Navigator ===${NC}"
echo "User: $(whoami) | Host: $(hostname) | Date: $(date)"
echo ""

# Disk usage
echo -e "${RED}Disk Usage:${NC}"
df -h | grep -E "(Filesystem|/dev/)"

echo ""
echo "Files in $(pwd):"
ls -lah --color=auto

echo ""
echo "Largest files:"
du -sh * 2>/dev/null | sort -rh | head -5


#Show current directory 

echo "Current directory: $(pwd)"

echo "" 

#List files with details 
ls -lah

#Count files 
echo "" 
echo "Total files: $( find . -maxdepth 1 -type f | wc -l)" 

