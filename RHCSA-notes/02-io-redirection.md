# I/O Redirection - RHCSA Notes

## Three Standard Streams

| Stream | Name | File Descriptor | Default Destination |
|--------|------|----------------|---------------------|
| stdin  | Standard Input  | 0 | Keyboard |
| stdout | Standard Output | 1 | Screen |
| stderr | Standard Error  | 2 | Screen |

## Redirection Operators

| Operator | Function | Example |
|----------|----------|---------|
| `>`  | Redirect stdout (overwrite) | `ls > files.txt` |
| `>>` | Redirect stdout (append) | `ls >> files.txt` |
| `2>` | Redirect stderr (overwrite) | `ls /bad 2> error.log` |
| `2>>`| Redirect stderr (append) | `ls /bad 2>> error.log` |
| `&>` | Redirect both stdout and stderr | `ls &> all.txt` |
| `\|` | Pipe stdout to another command | `ls \| grep txt` |

## Important: Order Matters

```bash
# CORRECT - both go to file
ls > output.txt 2>&1

# WRONG - stderr still goes to screen
ls 2>&1 > output.txt

# Discard errors
find / -name "*.conf" 2> /dev/null

# Discard all output
command > /dev/null 2>&1

Real RHCSA Scenarios
Scenario 1: Separate output and errors
bash

find /etc -name "*.conf" > found.txt 2> errors.txt

Scenario 2: Count errors in a log
bash

grep "ERROR" app.log | wc -l
# or
grep "ERROR" < app.log | wc -l

Scenario 3: Silence permission errors
bash

find / -name "*.log" 2> /dev/null

Commands That Don't Take Filenames

These commands MUST use stdin redirection or pipes:
Command	Purpose
tr	Translate/delete characters
bc	Calculator
rev	Reverse lines
bash

# CORRECT
tr 'a-z' 'A-Z' < file.txt

# WRONG (fails)
tr 'a-z' 'A-Z' file.txt

Key Takeaways

    stderr exists so you can log errors separately

    Use 2> to capture errors for debugging

    Use 2> /dev/null to ignore errors you don't care about

    Order matters when combining redirections: > file 2>&1

text


---

### File 2: `05-grep-text-processing.md`

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
text


---

### File 3: `06-pathname-expansion.md`

```markdown
# Pathname Expansion (Wildcards) - RHCSA Notes

## What Is It?

The shell automatically expands wildcards into matching filenames BEFORE running commands.

```bash
echo *.txt
# Shell expands to: echo file1.txt file2.txt file3.txt

Wildcard Patterns
Pattern	Meaning	Example
*	Any characters (including none)	*.log = all .log files
?	Exactly one character	file?.txt = file1.txt, fileA.txt
[abc]	One character from set	file[123].txt = file1.txt, file2.txt, file3.txt
[a-z]	One character from range	[A-Z]* = files starting with uppercase
[!abc]	One character NOT in set	[!0-9]* = files not starting with number
[[:class:]]	POSIX character class	[[:upper:]]* = uppercase starting
Common POSIX Character Classes
Class	Matches
[[:alnum:]]	Alphanumeric characters
[[:alpha:]]	Alphabetic characters
[[:digit:]]	Numeric characters
[[:upper:]]	Uppercase letters
[[:lower:]]	Lowercase letters
[[:space:]]	Whitespace characters
Real Examples
bash

# Delete all .log files
rm *.log

# Copy all PDFs to backup
cp *.pdf ~/backup/

# Move all uppercase-named files
mv [[:upper:]]* ~/caps/

# List files with specific extensions
ls *.{txt,log,csv}

# Remove files with numbers in name
rm *[0-9]*

# Find files with 3-letter extensions
ls *.???

Testing Expansions (Safe Method)
bash

# ALWAYS test with echo first
echo *.conf           # See what will be affected
echo rm *.tmp         # Preview destructive commands

When Expansion Fails (No Matches)
bash

# If no .log files exist
echo *.log
# In bash: outputs "*.log" (literal)
# In zsh: error: no matches found

# Safe pattern for scripts
if ls *.log 2>/dev/null; then
    grep error *.log
fi

Why Use Expansion?
Benefit	Explanation
Speed	Type once instead of 100 filenames
Accuracy	No typos, exact filenames
Automation	Scripts work on any system
Flexibility	Works with any number of files
Dangerous Examples (Be Careful!)
bash

# THIS DELETES EVERYTHING in current directory
rm *

# Better: interactive mode
rm -i *

# Or test first
echo rm *

RHCSA Practice
bash

# Create test environment
mkdir ~/expansion_test
cd ~/expansion_test
touch report_jan.txt report_feb.txt report_mar.txt data1.csv data2.log

# Practice these:
echo *.txt
echo report_*.txt
echo *.{txt,csv}
echo [a-z]*
echo [[:upper:]]*

Key Takeaways

    Expansion happens BEFORE the command runs

    Test with echo before destructive commands

    Use -i flag (interactive) with rm when learning

    Expansion is essential for automation and scripting

text


---

### File 4: `07-pipes-filters.md`

```markdown
# Pipes and Filters - RHCSA Notes

## The Pipe Operator `|`

Connects stdout of left command to stdin of right command

```bash
command1 | command2

Visual Flow
text

┌─────────┐  stdout  ┌─────────┐
│ command1│ ───────► │ command2│
└─────────┘          └─────────┘

Common Filters (Commands That Transform Data)
Filter	What it does
sort	Sorts lines alphabetically/numerically
uniq	Removes duplicate ADJACENT lines
wc	Counts lines, words, characters
head	Shows first N lines
tail	Shows last N lines
grep	Finds lines matching pattern
tr	Translates/deletes characters
Classic Example
bash

# Find all zip-related programs
ls /bin /usr/bin | sort | uniq | grep zip

Step by step:

    ls /bin /usr/bin - List all programs

    sort - Combine and sort alphabetically

    uniq - Remove duplicates

    grep zip - Keep only lines with "zip"

Why Pipes Matter

Without pipes:
bash

# Create temp file
ls /bin /usr/bin > temp.txt
# Edit temp.txt manually?? Can't sort without writing file

With pipes:
bash

# One line, no temp files
ls /bin /usr/bin | sort | uniq | grep zip | less

Common Pipeline Patterns
bash

# Search pattern
command | grep "pattern"

# Sort and view
command | sort | less

# Count lines
command | wc -l

# Find unique entries
command | sort | uniq

# Top 10
command | sort -r | head -10

# Complex filtering
command | grep "error" | sort | uniq -c | sort -rn | less

Real RHCSA Examples
bash

# Find top 10 memory-consuming processes
ps aux --sort=-%mem | head -10

# Count unique failed login attempts
grep "Failed password" /var/log/secure | cut -d' ' -f11 | sort | uniq -c

# Find largest files in /etc
find /etc -type f -exec ls -lh {} \; | sort -rh -k5 | head -10

# Show last 5 systemd errors
journalctl | grep -i error | tail -5

Combining with Redirection
bash

# Save pipeline output to file
ls /bin | grep zip | sort > zip_programs.txt

# Save errors separately
find / -name "*.conf" 2> errors.txt | sort > configs.txt

# Both output and errors to different places
ls /good /bad > stdout.txt 2> stderr.txt

The Unix Philosophy

    Write programs that do one thing well. Connect them with pipes to do complex things.

Key Insight: Each command does ONE job, but together they solve complex problems.
Practice Pipeline
bash

# Create test file
cat > test.txt << EOF
apple
banana
APPLE
banana
cherry
APPLE
EOF

# Try these pipelines:
cat test.txt | sort | uniq
cat test.txt | sort | uniq -c
cat test.txt | sort | uniq -c | sort -rn
cat test.txt | grep -i apple | wc -l

Key Takeaways

    Pipes connect commands without temporary files

    Filters transform data (sort, grep, uniq, wc, head, tail)

    Build pipelines step by step, testing each stage

    Combine with redirection to save output

text


---

### File 5: `08-here-documents.md`

```markdown
# Here Documents - RHCSA Notes

## What Is a Here Document?

A way to feed multi-line input to a command directly from a script or terminal.

## Basic Syntax

```bash
command << DELIMITER
line 1
line 2
line 3
DELIMITER

Simple Example
bash

cat << EOF
Hello World
This is line 2
EOF

Why "EOF"?

EOF = End Of File (just a convention)

You can use ANY word as delimiter:
bash

cat << END      # Works
cat << STOP     # Works
cat << MARKER   # Works
cat << CAT      # Works

Quoted vs Unquoted Delimiters
Unquoted (Variables Expand)
bash

NAME="John"
cat << EOF
Hello $NAME
Today is $(date)
EOF
# Output:
# Hello John
# Today is Mon Apr 5 10:00:00 EDT 2026

Quoted (Literal Text - No Expansion)
bash

NAME="John"
cat << 'EOF'
Hello $NAME
Today is $(date)
EOF
# Output:
# Hello $NAME
# Today is $(date)

Creating Files with Here Documents
bash

# Create a configuration file
cat > config.txt << EOF
server=192.168.1.1
port=8080
user=admin
EOF

# Append to existing file
cat >> config.txt << EOF
new_setting=value
EOF

Real RHCSA Examples
Example 1: Create Systemd Service
bash

cat > /etc/systemd/system/myapp.service << 'EOF'
[Unit]
Description=My Custom Application
After=network.target

[Service]
Type=simple
User=appuser
ExecStart=/usr/local/bin/myapp

[Install]
WantedBy=multi-user.target
EOF

Example 2: Create Apache Virtual Host
bash

cat > /etc/httpd/conf.d/mysite.conf << EOF
<VirtualHost *:80>
    ServerName mysite.com
    DocumentRoot /var/www/mysite
    ErrorLog /var/log/httpd/mysite_error.log
</VirtualHost>
EOF

Example 3: Multi-line Script Creation
bash

cat > backup.sh << 'EOF'
#!/bin/bash
DATE=$(date +%Y%m%d)
tar -czf backup_$DATE.tar.gz /home/user/data
echo "Backup completed: backup_$DATE.tar.gz"
EOF
chmod +x backup.sh

Example 4: Feed Input to Interactive Program
bash

# Send commands to ftp
ftp << EOF
open ftp.example.com
user username password
cd /uploads
put file.txt
quit
EOF

Indented Here Documents (<<-)

Use <<- to strip leading TAB characters:
bash

#!/bin/bash
if [ -f /etc/config ]; then
    cat <<- EOF
    This text is indented
    But output has NO indentation
    Because we used <<-
    EOF
fi

Common Delimiters and Their Uses
Delimiter	Typical Use
EOF	General purpose (End Of File)
END	Alternative to EOF
BLOCK	Multi-line block of text
'EOF'	When you don't want variable expansion
MARKER	Custom delimiter for clarity
Important Rules

    Closing delimiter must be ALONE on its own line

    No spaces before or after delimiter (unless using <<- for tabs)

    Case-sensitive (EOF and eof are different)

Wrong vs Correct
bash

# WRONG - space before delimiter
cat << EOF
content
 EOF

# WRONG - space after delimiter
cat << EOF
content
EOF

# WRONG - extra text on delimiter line
cat << EOF
content
EOF extra

# CORRECT
cat << EOF
content
EOF

Practice Exercises
bash

# Exercise 1: Create a simple message
cat << MESSAGE
System Maintenance Scheduled
Date: Next Sunday at 2 AM
Duration: 2 hours
MESSAGE

# Exercise 2: Create config with variables
PORT=8080
cat > server.conf << EOF
listen_port=$PORT
max_connections=100
EOF

# Exercise 3: Create template (variables NOT expanded)
cat > script_template.sh << 'EOF'
#!/bin/bash
USERNAME=$1
echo "Setting up for $USERNAME"
mkdir /home/$USERNAME/data
EOF

# Exercise 4: Multi-line input to bc calculator
bc << EOF
scale=2
10 / 3
100 * 5
2^10
EOF

Key Takeaways

    Here documents provide multi-line input

    Delimiter can be any word (EOF is convention)

    Quotes prevent variable expansion

    Use <<- to indent with tabs

    Perfect for creating config files in scripts

    Common RHCSA task: creating service files

text


---

### File 6: `commands-cheatsheet.md`

```markdown
# Linux Commands Cheatsheet - RHCSA

## Redirection Operators

| Command | Purpose |
|---------|---------|
| `>` | Redirect stdout (overwrite) |
| `>>` | Redirect stdout (append) |
| `2>` | Redirect stderr (overwrite) |
| `2>>` | Redirect stderr (append) |
| `&>` | Redirect both |
| `\|` | Pipe |
| `<` | Redirect stdin from file |
| `<< EOF` | Here document |

## Text Processing

| Command | Purpose | Example |
|---------|---------|---------|
| `grep` | Search for pattern | `grep -i error log.txt` |
| `sort` | Sort lines | `sort file.txt` |
| `uniq` | Remove duplicates | `sort file \| uniq` |
| `wc` | Count lines/words | `wc -l file.txt` |
| `head` | First N lines | `head -20 file.txt` |
| `tail` | Last N lines | `tail -10 file.txt` |
| `tr` | Translate/delete | `tr 'a-z' 'A-Z' < file` |
| `cut` | Extract columns | `cut -d: -f1 /etc/passwd` |

## Grep Options

| Option | Meaning |
|--------|---------|
| `-i` | Ignore case |
| `-l` | List filenames only |
| `-v` | Invert match |
| `-w` | Whole word |
| `-c` | Count matches |
| `-n` | Show line numbers |
| `-r` | Recursive |

## Wildcard Patterns

| Pattern | Meaning |
|---------|---------|
| `*` | Any characters |
| `?` | One character |
| `[abc]` | One of a,b,c |
| `[a-z]` | Range |
| `[[:upper:]]` | Uppercase letters |
| `[[:digit:]]` | Numbers |

## Common Pipeline Patterns

```bash
# Search and paginate
command | grep pattern | less

# Sort unique values
command | sort | uniq

# Top 10
command | sort -r | head -10

# Count matches
command | grep pattern | wc -l

# Complex filtering
command | grep error | cut -d' ' -f2 | sort | uniq -c

RHCSA File Locations to Know
Path	Purpose
/etc/passwd	User accounts
/etc/group	Group information
/etc/shadow	Passwords (root only)
/etc/fstab	Filesystem mounts
/etc/ssh/sshd_config	SSH server config
/etc/httpd/conf/	Apache config
/var/log/messages	System logs
/var/log/secure	Security logs
/etc/systemd/system/	Custom systemd services
Safety Tips
bash

# Always test destructive commands with echo
echo rm *.log

# Use interactive mode when unsure
rm -i *.log

# Check what you're about to delete
ls *.log

Practice Commands
bash

# Create test environment
mkdir ~/rhcsa_practice
cd ~/rhcsa_practice

# Create test files
touch file{1..10}.txt
echo "error: test" > error.log
echo "INFO: success" > info.log

# Practice these:
ls *.txt
grep -l error *.log
ls /bin | grep zip | wc -l
cat error.log | tr 'a-z' 'A-Z'

How to Save These Notes
Step 1: Create directory structure
bash

mkdir -p ~/linux-sysadmin-journey/RHCSA-notes
cd ~/linux-sysadmin-journey/RHCSA-notes

Step 2: Create each file in Vim
bash

# Create first file
vim 04-io-redirection.md
# (copy content above, save with :wq)

# Create second file
vim 05-grep-text-processing.md

# Create third file
vim 06-pathname-expansion.md

# Create fourth file
vim 07-pipes-filters.md

# Create fifth file
vim 08-here-documents.md

# Create cheatsheet
vim commands-cheatsheet.md

Step 3: Create README for GitHub
bash

vim ~/linux-sysadmin-journey/README.md

README.md content:
markdown

# Linux Sysadmin Journey

My journey learning Linux for RHCSA certification.

## Directory Structure

- `RHCSA-notes/` - All my study notes organized by topic

## Topics Covered

- I/O Redirection (stdin, stdout, stderr)
- Grep and Text Processing
- Pathname Expansion (Wildcards)
- Pipes and Filters
- Here Documents

## Resources

- William Shotts - "The Linux Command Line" (3rd Edition)
- RHCSA Exam Objectives (EX200)

## Progress

- [x] I/O Redirection
- [x] Grep
- [x] Pathname Expansion
- [x] Pipes and Filters
- [x] Here Documents
- [ ] File Permissions
- [ ] Users and Groups
- [ ] Process Management
- [ ] Systemd Services
- [ ] Networking

Step 4: Initialize Git and Push to GitHub
bash

cd ~/linux-sysadmin-journey

# Initialize git repository
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: RHCSA notes from study thread"

# Create repo on GitHub first (via website)
# Then connect and push
git remote add origin https://github.com/YOUR_USERNAME/linux-sysadmin-journey.git
git branch -M main
git push -u origin main

Quick Reference Card

Save this as quick-ref.txt:
text

========================================
LINUX COMMANDS QUICK REFERENCE
========================================

REDIRECTION:
  > file    - stdout to file (overwrite)
  >> file   - stdout to file (append)
  2> file   - stderr to file
  &> file   - both to file
  |         - pipe

GREP:
  grep -i    - ignore case
  grep -l    - list filenames only
  grep -v    - invert (show non-matching)
  grep -w    - whole word only

WILDCARDS:
  *          - anything
  ?          - one character
  [a-z]      - range
  [[:upper:]]- uppercase letters

PIPELINE PATTERNS:
  cmd | grep pattern | less
  cmd | sort | uniq
  cmd | head -10
  cmd | wc -l

HERE DOCUMENT:
  cat > file << EOF
  content
  EOF

TEST FIRST:
  echo rm *     # preview before deleting
  ls -la *      # see what matches

This organization will help you:

    Find notes quickly by topic

    Track your progress as you study

    Share your journey on GitHub

    Review before the exam efficiently

Good luck with your RHCSA journey! 🚀
vm

