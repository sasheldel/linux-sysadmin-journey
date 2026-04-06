
---

### File 2: `03-grep-text-processing.md`

```markdown
# Grep - Pattern Matching - RHCSA Notes

## Basic Syntax
```bash
grep pattern [file...]

Essential Options
Option	Meaning	Example
-i	Ignore case	grep -i error log.txt
-l	List filenames only	grep -l error *.log
-v	Invert (show non-matching)	grep -v error log.txt
-w	Match whole words only	grep -w "the" file.txt
-c	Count matches	grep -c error log.txt
-n	Show line numbers	grep -n error log.txt
-r	Recursive search	grep -r "text" /dir/
Real Examples
Find users with bash shell
bash

grep "bash" /etc/passwd

Find users WITHOUT bash
bash

grep -v "bash" /etc/passwd

Find which config files contain a setting
bash

grep -l "Port 22" /etc/ssh/*.conf

Count errors in log (case insensitive)
bash

grep -ic "error" /var/log/messages

Find running process
bash

ps aux | grep -w "httpd"

Pipeline Pattern with Grep
bash

# Build step by step
ls /bin /usr/bin           # Raw output
ls /bin /usr/bin | sort    # Sorted
ls /bin /usr/bin | sort | uniq  # Remove duplicates
ls /bin /usr/bin | sort | uniq | grep zip  # Filter for "zip"

Troubleshooting: No Output from grep
If grep -l returns nothing:

    No files matched the pattern

    Case sensitivity issue (use -i)

    Files don't exist (check with ls)

Check if files exist first:
bash

ls *.log                    # See if any log files
grep "error" *.log          # Search without -l first

Common RHCSA Tasks
Task	Command
Find user account	grep "username" /etc/passwd
Find installed package	rpm -qa | grep "package"
Find running service	systemctl list-units | grep "service"
Find listening port	ss -tlnp | grep "80"
| Option | Full Name | What it does | Example |
|--------|-----------|--------------|---------|
| `-i` | --ignore-case | Case insensitive search | `grep -i error log.txt` |
| `-l` | --files-with-matches | Show only filenames | `grep -l error *.log` |
| `-v` | --invert-match | Show non-matching lines | `grep -v error log.txt` |
| `-w` | --word-regexp | Match whole words only | `grep -w "the" file.txt` |
| `-c` | --count | Count matches, not lines | `grep -c error log.txt` |
| `-n` | --line-number | Show line numbers | `grep -n error log.txt` |
| `-r` | --recursive | Search directories recursively | `grep -r "error" /var/log/` |

### Real RHCSA Examples

```bash
# 1. Find users with bash as their shell
grep "bash" /etc/passwd

# 2. Find users WITHOUT bash
grep -v "bash" /etc/passwd

# 3. Find which config files contain "Port 22"
grep -l "Port 22" /etc/ssh/*.conf

# 4. Count error lines (case insensitive)
grep -ic "error" /var/log/messages

# 5. Find running process (whole word only)
ps aux | grep -w "httpd"

# 6. Search recursively for text in /etc
grep -r "ServerName" /etc/httpd/



Pipeline Patterns with Grep
bash

# Step by step building
ls /bin /usr/bin              # Raw output
ls /bin /usr/bin | sort       # Sorted
ls /bin /usr/bin | sort | uniq  # Remove duplicates
ls /bin /usr/bin | sort | uniq | grep zip  # Filter for "zip"

# The above gives you all zip-related programs on your system!

Troubleshooting: No Output from grep

If grep -l returns nothing:

    No files matched the pattern

    Case sensitivity issue (use -i)

    Files don't exist (check with ls)

bash

# Always check if files exist first
ls *.log
# Then search
grep "error" *.log

Common RHCSA Grep Tasks
Task	Command
Find user account	grep "username" /etc/passwd
Find installed package	rpm -qa | grep "package"
Find running service	systemctl list-units | grep "service"
Find listening port	ss -tlnp | grep "80"
Find failed logins	grep "Failed" /var/log/secure
Find sudo attempts	grep "sudo" /var/log/secure
Practice Exercises
bash

# Create test file
cat > test.txt << 'EOF'
apple
banana
APPLE
banana
cherry
APPLE
EOF

# Try these:
grep apple test.txt           # Case sensitive
grep -i apple test.txt        # Case insensitive
grep -v apple test.txt        # Lines without apple
grep -c apple test.txt        # Count matches
grep -n apple test.txt        # Show line numbers
