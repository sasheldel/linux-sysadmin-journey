# Pipes and Filte
## The Pipe Operator `|`

Connects stdout of left command to stdin of right command.

## Visual Flow
Connects stdout of left command to stdin of right command.

## Visual Flow

┌─────────┐ stdout ┌─────────┐
│ command1│ ───────► │ command2│
└─────────┘ └─────────┘
text


## Common Filters

| Filter | What it does | Example |
|--------|--------------|---------|
| `sort` | Sorts lines alphabetically | `ls \| sort` |
| `uniq` | Removes duplicate ADJACENT lines | `sort file \| uniq` |
| `wc` | Counts lines, words, characters | `ls \| wc -l` |
| `head` | Shows first N lines | `ls \| head -10` |
| `tail` | Shows last N lines | `ls \| tail -5` |
| `grep` | Finds lines matching pattern | `ls \| grep txt` |

## Classic Example

```bash
# Find all zip-related programs on your system
ls /bin /usr/bin | sort | uniq | grep zip

Step-by-Step Breakdown

    ls /bin /usr/bin - Lists all programs from both directories

    sort - Combines and sorts alphabetically

    uniq - Removes duplicates (programs in both directories)

    grep zip - Keeps only lines containing "zip"

Pipeline Patterns
bash

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

Why Pipes Matter (RHCSA Perspective)

Without pipes:
bash

# Create temp file
ls /bin /usr/bin > temp.txt
# Edit temp.txt manually?? Can't sort without writing file

With pipes:
bash

# One line, no temp files
ls /bin /usr/bin | sort | uniq | grep zip | less

Real RHCSA Examples
bash

# Find top 10 memory-consuming processes
ps aux --sort=-%mem | head -10

# Count unique failed login attempts
grep "Failed password" /var/log/secure | cut -d' ' -f11 | sort | uniq -c

# Find largest files in /etc
find /etc -type f -exec ls -lh {} \; | sort -rh -k5 | head -10

The Unix Philosophy

    "Write programs that do one thing well. Connect them with pipes to do complex things."

Key Insight: Each command does ONE job, but together they solve complex problems.
EOF
