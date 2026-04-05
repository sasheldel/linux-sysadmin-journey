#!/bin/bash
# File Navigator Script
# Author: sasakovich
# Date: $(date +%Y-%m-%d)

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

while true; do
    clear
    echo -e "${GREEN}=== File Navigator ===${NC}"
    echo "User: $(whoami) | Host: $(hostname)"
    echo ""
    echo "1. Change directory (cd)"
    echo "2. List files (ls -la)"
    echo "3. Show current directory (pwd)"
    echo "4. Exit"
    echo ""
    read -p "Choose option (1-4): " choice
    
    case $choice in
        1)
            read -p "Enter path: " path
            if cd "$path" 2>/dev/null; then
                echo -e "${GREEN}Changed to: $(pwd)${NC}"
            else
                echo -e "${RED}Error: Cannot access '$path'${NC}"
            fi
            ;;
        2)
            ls -lah
            ;;
        3)
            pwd
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
done
