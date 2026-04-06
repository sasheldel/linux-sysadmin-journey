Pathname Expansion (Wildcards) - RHCSA Notes
What Is It?

The shell automatically expands wildcards into matching filenames BEFORE running commands.
bash

echo *.txt
# Shell expands to: echo file1.txt file2.txt file3.txt

Wildcard Patterns
Pattern	Meaning	Example
*	Any characters (including none)	*.log = all .log files
?	Exactly one character	file?.txt = file1.txt, fileA.txt
[abc]	One character from set	file[123].txt
[a-z]	One character from range	[A-Z]* = uppercase files
[!abc]	NOT in set	[!0-9]* = not starting with number
[[:class:]]	POSIX character class	[[:upper:]]*
POSIX Character Classes
Class	Matches
[[:alnum:]]	Alphanumeric
[[:alpha:]]	Alphabetic
[[:digit:]]	Numeric
[[:upper:]]	Uppercase
[[:lower:]]	Lowercase
[[:space:]]	Whitespace
Testing Expansions (Safe Method)
bash

# ALWAYS test with echo first
echo *.conf           # See what will be affected
echo rm *.tmp         # Preview destructive commands

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

# Clean up
cd ~
rm -rf expansion_test

EOF
