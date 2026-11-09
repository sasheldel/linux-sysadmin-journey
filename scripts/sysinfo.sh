#!/bin/bash 
#sysinfo.sh -full machine report 
#
#


echo "========SYSTEM REPORT: $(hostname) ===================="

echo "Generated: $(date)" 

echo 

echo "----- OS -------" 


uname -a 



[ -f /etc/os-release ] && cat /etc/os-release | head -3 


echo 

echo "------ Uptime/Load ----" 
uptime 

echo 
echo "------- CPU ----" 

lscpu | grep -E "Model name| ^CPU\(s\)" 

Linux 

echo 

echo "----- Memory ---" 

free -h 
 

echo 

echo "----- Biggest Directories (top level) ---" 

du -h --max-depth=1 / 2>/dev/null | sort -rh | head -10 
echo 

echo " -----Biggest Files (>100MB) ----" 

find / -xdev -type f -size +100M -exec du -h {} + 2>/dev/null | sort -rh | head -10 




echo "---- Disks ----" 
df -h 

echo 

echo " -- Block Devices ---" 
lsblk 
echo 

echo "------- Network --- " 
ip -brief addr 

echo 
echo "--- Listen Ports ---" 
ss -tulpn 
echo 

echo " ----- Who's Logged in / Recent Logins ---" 
who 
last -5 
echo 

echo "------- Failed Services ---" 
systemctl --failed 


