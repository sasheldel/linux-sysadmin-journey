# 🎓 19-Hour Linux Masterclass - Complete Documentation

Welcome to my course notes and project tracker for the [19-Hour Linux Masterclass](https://youtu.be/avg65oY7sj4), part of my journey to become a proficient Linux System Administrator. This course covers foundational to advanced Linux concepts with hands-on labs.

---

Title: "19-Hour Linux Command Line Course"
author: "MichaelsTechTutorials"
status: "In Progress"
progress: "7/19 hours (37%)"
last_updated: "$(date '+%Y-%m-%d')"
---

# 19-Hour Linux Command Line Course

**Course Link:** [YouTube Playlist](https://youtu.be/avg65oY7sj4?si=o6TG1DgBEVpal_6C)
**Purpose:** Linux+ certification foundation → RHCSA preparation bridge
## 📋 What’s Covered So Far

✅ Terminal basics (cd, ls, pwd, man)  
✅ User management (adduser, usermod, passwd)  
✅ File permissions, chmod, chown, groups  
✅ Setuid, Setgid, Sticky bit  
✅ Advanced commands: grep, awk, sed, xargs  
✅ Cron jobs, systemd timers, and job scheduling  
✅ File compression tools: gzip, tar, bzip2  
✅ LVM, ZFS, RAID, disk partitions  
✅ tmux, screen, environment variables  
✅ System monitoring (top, ps, nice, kill)

---

## 🧱 Course Breakdown with Time Stamps

| Module | Topic | Timestamp |
|--------|-------|-----------|
| Terminal & Navigation | `cd`, `ls`, `pwd`, `man` | 00:00:00 – 00:22:00 |
| File Management | `touch`, `mkdir`, `rm`, `mv`, `cp`, symlinks | 00:31:00 – 01:32:21 |
| User & Group Management | `adduser`, `usermod`, `/etc/passwd` | 01:50:07 – 02:28:32 |
| Permissions | `chmod`, `chown`, `umask` | 02:48:33 – 03:26:00 |
| Special Permissions | setuid, setgid, sticky bit | 03:26:00 – 03:51:51 |
| ACLs & File Attributes | `getfacl`, `chattr`, `lsattr` | 04:02:59 – 04:23:48 |
| Date & Time | `date`, `timedatectl` | 04:32:41 – 04:41:55 |
| Text Processing | `grep`, `awk`, `sed`, `cut`, `tr`, `xargs` | 05:27:32 – 06:53:14 |
| Compression & Backup | `tar`, `gzip`, `bzip2`, `rsync` | 07:29:11 – 08:24:27 |
| Job Scheduling | `cron`, `at`, `anacron`, `systemd.timer` | 08:34:18 – 09:39:05 |
| Process Management | `ps`, `top`, `nice`, `kill` | 09:51:01 – 10:38:27 |
| Terminal Multiplexers | `screen`, `tmux` | 10:55:25 – 11:53:04 |
| Environment & Shell | `.bashrc`, `.profile`, `alias`, `functions` | 12:12:32 – 13:06:51 |
| Disk Management | `df`, `du`, mount, USB, partitioning | 13:17:52 – 14:50:25 |
| LVM & RAID | `pvcreate`, `vgcreate`, `lvcreate`, RAID levels | 15:35:59 – 16:58:35 |
| ZFS File System | Snapshots, clones, scrub, RAID-Z | 17:30:25 – 18:46:27 |
| Disk Encryption | LUKS setup, CLI, password management | 19:00:05 – 19:35:16 |


 35 | Module | Topic | Timestamp |
 36 |--------|-------|-----------|
 37 | Terminal & Navigation | `cd`, `ls`, `pwd`, `man` | 00:00:00 – 00:22:00 |
 38 | File Management | `touch`, `mkdir`, `rm`, `mv`, `cp`, symlinks | 00:31:00 – 01:32:21 |
 39 | User & Group Management | `adduser`, `usermod`, `/etc/passwd` | 01:50:07 – 02:28:32 |
 40 | Permissions | `chmod`, `chown`, `umask` | 02:48:33 – 03:26:00 |
 41 | Special Permissions | setuid, setgid, sticky bit | 03:26:00 – 03:51:51 |
 42 | ACLs & File Attributes | `getfacl`, `chattr`, `lsattr` | 04:02:59 – 04:23:48 |
 43 | Date & Time | `date`, `timedatectl` | 04:32:41 – 04:41:55 |
 44 | Text Processing | `grep`, `awk`, `sed`, `cut`, `tr`, `xargs` | 05:27:32 – 06:53:14 |
 45 | Compression & Backup | `tar`, `gzip`, `bzip2`, `rsync` | 07:29:11 – 08:24:27 |
 46 | Job Scheduling | `cron`, `at`, `anacron`, `systemd.timer` | 08:34:18 – 09:39:05 |
 47 | Process Management | `ps`, `top`, `nice`, `kill` | 09:51:01 – 10:38:27 |
 48 | Terminal Multiplexers | `screen`, `tmux` | 10:55:25 – 11:53:04 |
 49 | Environment & Shell | `.bashrc`, `.profile`, `alias`, `functions` | 12:12:32 – 13:06:51 |
 50 | Disk Management | `df`, `du`, mount, USB, partitioning | 13:17:52 – 14:50:25 |
 51 | LVM & RAID | `pvcreate`, `vgcreate`, `lvcreate`, RAID levels | 15:35:59 – 16:58:35 |
 52 | ZFS File System | Snapshots, clones, scrub, RAID-Z | 17:30:25 – 18:46:27 |
 53 | Disk Encryption | LUKS setup, CLI, password management | 19:00:05 – 19:35:16 |
 54--

# 🔑 Key Commands Mastered

### Navigation & File Management
```bash
ls -laH           # List files with details
cd -              # Go to previous directory
pwd               # Print working directory
mkdir -p          # Create parent directories
rm -rf            # Remove recursively (careful!)
cp -r             # Copy recursively
ln -s             # Create symbolic lin

User Management

sudo useradd -m username     # Create user with home dir
sudo usermod -aG group user  # Add user to group
sudo passwd username         # Set password
sudo userdel -r username     # Delete user with home dir-

Permissions
bash

chmod 755 file               # rwxr-xr-x
chmod u+x file               # Add execute for user
chown user:group file        # Change owner:group
chgrp group file             # Change group only
umask 022                    # Default permissions


Special Permissions
bash

chmod u+s file               # SUID (run as owner)
chmod g+s directory          # SGID (inherit group)
chmod +t directory           # Sticky bit



Understanding ls d Command Behavior
Integrated Creative Tech Pipeline
Kimi Claw vs MaxClaw comparison
RHCSA Linux Prep Plan
Astrology for AI Wealth Skills
Linux DevOps Mentorship with Stage Metaphors
OverTheWire Bandit Restart Guide
Linux Directory Structure Note Summary
Drawing Training Structure
Drawing Training Reentry Focus
RHCSA exam prep with Linux book
Tanisha AI Receptionist Project Learning Plan
Autonomous Sovereign Warrior King Programming Language List Critique
Roadmap for Certifications in UpNote Format
Systemic Agentic Mindset Curriculum
Career Plan to 100k PSLF
RHEL Hacking Tools Learning Roadmap
Blender Beginner Study Plan and Learning Path
IT Expert Business Ideas for Creatives
Starting Nitebourne T-Shirt Business Guide
Building Hip-Hop Sample Quiz App Tutorial
Understanding ls d Command Behavior

This is excellent documentation! You've created a very professional and detailed breakdown of the course. I can see you're using a structured approach with timestamps and module tracking.

Let me help you complete this file and integrate it properly into your repository.
Complete the Course Notes File

Based on what you've shown, here's the complete file structure:
bash

cd ~/linux-sysadmin-journey/courses/19-Hour-Linux-Course

# Create or update the main course notes file
cat > course-notes.md << 'EOF'
---
title: "19-Hour Linux Command Line Course"
author: "MichaelsTechTutorials"
status: "In Progress"
progress: "7/19 hours (37%)"
last_updated: "$(date '+%Y-%m-%d')"
---

# 19-Hour Linux Command Line Course

**Course Link:** [YouTube Playlist](https://youtu.be/avg65oY7sj4?si=o6TG1DgBEVpal_6C)
**Purpose:** Linux+ certification foundation → RHCSA preparation bridge

---

## 📋 What’s Covered So Far

✅ Terminal basics (cd, ls, pwd, man)
✅ User management (adduser, usermod, passwd)
✅ File permissions, chmod, chown, groups
✅ Setuid, Setgid, Sticky bit
✅ Advanced commands: grep, awk, sed, xargs
✅ Cron jobs, systemd timers, and job scheduling
✅ File compression tools: gzip, tar, bzip2
✅ LVM, ZFS, RAID, disk partitions
✅ tmux, screen, environment variables
✅ System monitoring (top, ps, nice, kill)

---

## 🧱 Course Breakdown with Time Stamps

| Module | Topic | Timestamp | Status |
|--------|-------|-----------|--------|
| 1 | Terminal & Navigation (`cd`, `ls`, `pwd`, `man`) | 00:00:00 – 00:22:00 | ✅ |
| 2 | File Management (`touch`, `mkdir`, `rm`, `mv`, `cp`, symlinks) | 00:31:00 – 01:32:21 | ✅ |
| 3 | User & Group Management (`adduser`, `usermod`, `/etc/passwd`) | 01:50:07 – 02:28:32 | ✅ |
| 4 | Permissions (`chmod`, `chown`, `umask`) | 02:48:33 – 03:26:00 | ✅ |
| 5 | Special Permissions (setuid, setgid, sticky bit) | 03:26:00 – 03:51:51 | ✅ |
| 6 | ACLs & File Attributes (`getfacl`, `chattr`, `lsattr`) | 04:02:59 – 04:23:48 | ✅ |
| 7 | Date & Time (`date`, `timedatectl`) | 04:32:41 – 04:41:55 | ✅ |
| 8 | Text Processing (`grep`, `awk`, `sed`, `cut`, `tr`, `xargs`) | 05:27:32 – 06:53:14 | ✅ |
| 9 | Compression & Backup (`tar`, `gzip`, `bzip2`, `rsync`) | 07:29:11 – 08:24:27 | 📝 |
| 10 | Job Scheduling (`cron`, `at`, `anacron`, `systemd.timer`) | 08:34:18 – 09:39:05 | ⏳ |
| 11 | Process Management (`ps`, `top`, `nice`, `kill`) | 09:51:01 – 10:38:27 | ⏳ |
| 12 | Terminal Multiplexers (`screen`, `tmux`) | 10:55:25 – 11:53:04 | ⏳ |
| 13 | Environment & Shell (`.bashrc`, `.profile`, `alias`, functions) | 12:12:32 – 13:06:51 | ⏳ |
| 14 | Disk Management (`df`, `du`, mount, USB, partitioning) | 13:17:52 – 14:50:25 | ⏳ |
| 15 | LVM & RAID (`pvcreate`, `vgcreate`, `lvcreate`, RAID levels) | 15:35:59 – 16:58:35 | ⏳ |
| 16 | ZFS File System (snapshots, clones, scrub, RAID-Z) | 17:30:25 – 18:46:27 | ⏳ |
| 17 | Disk Encryption (LUKS setup, CLI, password management) | 19:00:05 – 19:35:16 | ⏳ |

**Progress:** 8/17 modules completed = 47% (but only 7 hours of video = 37% due to module density)

---

## 🔑 Key Commands Mastered

### Navigation & File Management
```bash
ls -laH           # List files with details
cd -              # Go to previous directory
pwd               # Print working directory
mkdir -p          # Create parent directories
rm -rf            # Remove recursively (careful!)
cp -r             # Copy recursively
ln -s             # Create symbolic link

User Management
bash

sudo useradd -m username     # Create user with home dir
sudo usermod -aG group user  # Add user to group
sudo passwd username         # Set password
sudo userdel -r username     # Delete user with home dir

Permissions
bash

chmod 755 file               # rwxr-xr-x
chmod u+x file               # Add execute for user
chown user:group file        # Change owner:group
chgrp group file             # Change group only
umask 022                    # Default permissions

Special Permissions
bash

chmod u+s file               # SUID (run as owner)
chmod g+s directory          # SGID (inherit group)
chmod +t directory           # Sticky bit

ACLs
bash

getfacl file                 # View ACLs
setfacl -m u:user:rwx file   # Set ACL for user
setfacl -d -m u:user:rwx dir # Default ACL
setfacl -x u:user file       # Remove ACL

Text Processing
bash

grep -i pattern file         # Case insensitive search
grep -r "text" /path/        # Recursive search
awk '{print $1}' file        # Print first column
sed 's/old/new/g' file       # Replace text
cut -d: -f1 /etc/passwd      # Cut by delimiter
tr 'a-z' 'A-Z' < file        # Translate case
xargs -n1 command            # Build commands from input

Compression & Backup
bash

tar -czf archive.tar.gz /path/    # Create tar.gz
tar -xzf archive.tar.gz           # Extract tar.gz
gzip file.txt                     # Compress
gunzip file.txt.gz                # Decompress
rsync -avz source/ dest/          # Sync directories

Job Scheduling
bash

crontab -e                   # Edit cron jobs
crontab -l                   # List cron jobs
*/5 * * * * command          # Every 5 minutes
systemctl list-timers        # List systemd timers

Process Management
bash

ps aux                       # All processes
top                          # Real-time processes
htop                         # Enhanced top
kill -9 PID                  # Force kill process
nice -n 10 command           # Run with low priority
renice 5 -p PID              # Change priority

Disk Management
bash

df -h                        # Disk usage (human)
du -sh /path/                # Directory size
lsblk                        # List block devices
sudo fdisk -l                # List partitions
sudo mount /dev/sdb1 /mnt    # Mount partition

LVM (High Priority for RHCSA)
bash

pvcreate /dev/sdb1           # Create physical volume
vgcreate vg_name /dev/sdb1   # Create volume group
lvcreate -L 10G -n lv_name vg_name  # Create logical volume
lvextend -L +5G /dev/vg_name/lv_name  # Extend LV



## 📂 Folder Structure
