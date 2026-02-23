#!/bin/bash
# Author: $(whoami)
# Date: $(date +%Y-%m-%d)
# Description: 

set -euo pipefail  # Strict mode

# Variables
HOSTNAME=$(hostname)
USER=$(whoami)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
PWD=$(pwd)
KERNEL=$(uname -r)
# Functions

# Main
echo "System Information Report"
echo "========================"
echo "Hostname:        $HOSTNAME"
echo "Current User:    $USER"
echo "Date/Time:       $DATE"
echo "Working Dir:     $PWD"
echo "Kernel Version:  $KERNEL"


# Security: Check for UID 0 users (root equivalents)
echo ""
echo "Security Check: Root-Level Users"
echo "================================="
awk -F: '$3 == 0 {print "WARNING: " $1 " has UID 0 (root access)"}' /etc/passwd

# Security: Check for users without passwords
echo ""
echo "Security Check: Password Status"
echo "================================"
sudo awk -F: '$2 == "" {print "WARNING: " $1 " has no password"}' /etc/shadow 2>/dev/null || echo "Note: Run with sudo for full password audit"


